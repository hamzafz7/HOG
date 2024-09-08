import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/data/models/quiz_model.dart';

class QuizController extends GetxController {
  late QuizzModel model;
  RxInt _totalTimeInSeconds = 3600.obs;
  RxDouble initalValue = (1 / 3).obs;
  late RxInt totalQuistions;
  RxInt currentQuistions = 1.obs;
  RxDouble finalResults = 0.0.obs;

  @override
  void onInit() {
    model = Get.arguments;
    totalQuistions = model.questions?.length.obs ?? 1.obs;
    initalValue.value = (1 / totalQuistions.value);
    startCountdown();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    timer.value.cancel();
  }

  Rx<String> get formattedTime =>
      "${(_totalTimeInSeconds ~/ 60).toString().padLeft(2, '0')}:${(_totalTimeInSeconds % 60).toString().padLeft(2, '0')}"
          .obs;

  late Rx<Timer> timer;

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalTimeInSeconds > 0) {
        _totalTimeInSeconds--;
      } else {
        timer.cancel();
      }
      update();
    }).obs;
  }

  Rx<PageController> pageController = PageController().obs;
  Rx<int> currentIndex = 0.obs;

  incrementQuistionsValue() {
    if (currentQuistions.value < totalQuistions.value) {
      initalValue.value = initalValue.value + 1 / totalQuistions.value;
      currentQuistions.value++;
      currentIndex.value++;
    }
  }

  decrementQuistionsValue() {
    if (currentQuistions.value > 1) {
      initalValue.value = initalValue.value - 1 / totalQuistions.value;
      currentQuistions.value--;
      currentIndex.value--;
    }
  }

  Map<int, int> userSolutions = {};
  Map<int, int> rightSolutions = {};
  RxInt skippedQuistions = 0.obs;
  RxInt wrongAnswers = 0.obs;
  RxInt timeElapsed = 0.obs;

  calcResult() {
    timer.value.cancel();
    timeElapsed.value = (timer.value.tick / 60).ceil();
    finalResults.value = 0.0;
    skippedQuistions.value = 0;
    wrongAnswers.value = 0;
    for (var element in model.questions!) {
      int ind = 0;
      for (int i = 0; i < element.choices!.length; i++) {
        if (element.choices![i].isTrue!) {
          ind = element.choices![i].id!;
          rightSolutions[element.id!] = element.choices![i].id!;
          break;
        }
      }
      if (userSolutions.containsKey(element.id) &&
          userSolutions.containsValue(ind)) {
        finalResults.value += 1 / totalQuistions.value;
      } else if (userSolutions.containsKey(element.id) &&
          !userSolutions.containsValue(ind)) {
        wrongAnswers.value += 1;
      } else if (!userSolutions.containsKey(element.id)) {
        skippedQuistions.value += 1;
      }
    }
  }

  provideSolution(int key, int val) {
    userSolutions[key] = val;
    update();
  }

  clearSolutions() {
    _totalTimeInSeconds.value = 3600;
    timeElapsed.value = 0;
    startCountdown();
    currentIndex.value = 0;
    currentQuistions.value = 1;
    initalValue.value = 1 / totalQuistions.value;
    userSolutions = {};
    pageController.value.jumpToPage(0);

    update();
  }
}
