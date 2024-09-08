import 'package:get/get.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/models/courses_model.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/data/providers/databaseProvider/course_database.dart';
import 'package:hog/data/repositories/category_repo.dart';

class MyCoursesController extends GetxController {
  @override
  void onInit() {
    int id = CacheProvider.getUserId();
    getMyCourses(id);
    super.onInit();
  }

  final CategoryRepository _categoryRepository = CategoryRepository();
  var getMyCoursesStatus = RequestStatus.begin.obs;
  updateGetCoursesStatus(RequestStatus status) =>
      getMyCoursesStatus.value = status;
  CoursesModel? model;
  // Future<void> getMyCourses(int id) async {
  //   updateGetCoursesStatus(RequestStatus.loading);
  //   var response = await _categoryRepository.getMyCourses(id);
  //   if (response.success) {
  //     model = CoursesModel.fromJson(response.data);
  //     print(response.data);
  //     if (model!.courses == null || model!.courses!.isEmpty) {
  //       updateGetCoursesStatus(RequestStatus.noData);
  //     } else {
  //       updateGetCoursesStatus(RequestStatus.success);
  //     }
  //   } else if (!response.success) {
  //     if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
  //       updateGetCoursesStatus(RequestStatus.noInternentt);
  //     } else {
  //       updateGetCoursesStatus(RequestStatus.onError);
  //     }
  //   }
  // }
  var database = CourseDatabase.database;
  Future<void> getMyCourses(int id) async {
    updateGetCoursesStatus(RequestStatus.loading);
    var response = await _categoryRepository.getMyCourses(id);

    if (response.success) {
      model = CoursesModel.fromJson(response.data);
      print(response.data);

      if (model!.courses == null || model!.courses!.isEmpty) {
        updateGetCoursesStatus(RequestStatus.noData);
      } else {
        // Save courses to database for offline use
        await CourseDatabase.saveCoursesToDatabase(model!.courses!);
        updateGetCoursesStatus(RequestStatus.success);
      }
    } else if (!response.success) {
      if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
        // Fetch stored courses when no internet connection
        List<CourseModel> storedCourses =
            await CourseDatabase.getCoursesFromDatabase();

        if (storedCourses.isNotEmpty) {
          // Add the stored courses to the CoursesModel
          model = CoursesModel(
            courses: storedCourses,
            message: "Loaded from local storage due to no internet.",
          );
          updateGetCoursesStatus(RequestStatus.success);
        } else {
          updateGetCoursesStatus(RequestStatus.noData);
          print("No Internet and No Data");
        }
      } else {
        updateGetCoursesStatus(RequestStatus.onError);
      }
    }
  }
}
