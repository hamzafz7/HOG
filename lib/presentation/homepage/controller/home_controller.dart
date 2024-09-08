import 'package:get/get.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/models/categories_model.dart';
import 'package:hog/data/models/courses_model.dart';
import 'package:hog/data/models/news_model.dart';
import 'package:hog/data/repositories/category_repo.dart';
import 'package:hog/data/repositories/home_repo..dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getNews();
    getCategories();

    super.onInit();
  }

  NewsResponse? newsResponse;
  CategoriesModel? categoriesModel;
  RxInt currentCategoryIndex = 0.obs;

  changeCurrentIndex(int ind, int courseId) {
    currentCategoryIndex.value = ind;
    getCourses(courseId);
  }

  var getNewsStatus = RequestStatus.begin.obs;
  var categoriesStatus = RequestStatus.begin.obs;
  updateGetNewsStatus(RequestStatus status) => getNewsStatus.value = status;

  var courseStatus = RequestStatus.begin.obs;
  updatecourseStatus(RequestStatus status) => courseStatus.value = status;
  updateCategoriesStatus(RequestStatus status) =>
      categoriesStatus.value = status;
  final HomeRepository _homeRepository = HomeRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  Future<void> getNews() async {
    updateGetNewsStatus(RequestStatus.loading);
    var response = await _homeRepository.getNews();
    if (response.success) {
      newsResponse = NewsResponse.fromJson(response.data);
      if (newsResponse!.news.isEmpty) {
        updateGetNewsStatus(RequestStatus.noData);
      } else {
        updateGetNewsStatus(RequestStatus.success);
      }
    } else if (!response.success) {
      if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
        updateGetNewsStatus(RequestStatus.noInternentt);
      } else {
        updateGetNewsStatus(RequestStatus.onError);
      }
    }
  }

  Future<void> getCategories() async {
    updateCategoriesStatus(RequestStatus.loading);
    var response = await _categoryRepository.getCategories();
    if (response.success) {
      categoriesModel = CategoriesModel.fromJson(response.data);
      if (categoriesModel!.categories == null ||
          categoriesModel!.categories!.isEmpty) {
        updateCategoriesStatus(RequestStatus.noData);
      } else {
        updateCategoriesStatus(RequestStatus.success);
        getCourses(categoriesModel!.categories![0].id!);
      }
    } else if (!response.success) {
      if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
        updateCategoriesStatus(RequestStatus.noInternentt);
      } else {
        updateCategoriesStatus(RequestStatus.onError);
      }
    }
  }

  CoursesModel? coursesModel;

  Future<void> getCourses(int id) async {
    updatecourseStatus(RequestStatus.loading);
    var response = await _categoryRepository.getCourses(id);
    if (response.success) {
      coursesModel = CoursesModel.fromJson(response.data);
      print(response.data);
      if (coursesModel!.courses == null || coursesModel!.courses!.isEmpty) {
        updatecourseStatus(RequestStatus.noData);
      } else {
        updatecourseStatus(RequestStatus.success);
      }
    } else if (!response.success) {
      if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
        updatecourseStatus(RequestStatus.noInternentt);
      } else {
        updatecourseStatus(RequestStatus.onError);
      }
    }
  }
}
