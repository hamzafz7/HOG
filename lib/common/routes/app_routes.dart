import 'package:get/get.dart';
import 'package:hog/presentation/Auth/pages/login_page.dart';
import 'package:hog/presentation/Auth/pages/register_page.dart';
import 'package:hog/presentation/course_details/pages/course_details_page.dart';
import 'package:hog/presentation/course_details/widgets/show_course_video.dart';
import 'package:hog/presentation/downloadedVideos/page/downloaded_videos_page.dart';
import 'package:hog/presentation/mainpage/pages/main_page.dart';
import 'package:hog/presentation/onboarding/pages/on_boarding_page.dart';
import 'package:hog/presentation/quizzes/pages/quiz_page.dart';
import 'package:hog/presentation/quizzes/pages/quizz_statistic_page.dart';
import 'package:hog/presentation/quizzes/pages/result_page.dart';
import 'package:hog/presentation/search/page/search_page.dart';
import 'package:hog/presentation/settings/pages/about_us_page.dart';
import 'package:hog/presentation/settings/pages/privacy_policy_dart.dart';
import 'package:hog/presentation/settings/pages/settings_page.dart';
import 'package:hog/presentation/userinfo/page/user_info_page.dart';
import 'package:hog/presentation/yearcoursespage/page/year_courses_page.dart';

class AppRoute {
  static String onboardingPageRoute = '/onboarding';
  static String loginPageRoute = '/login';
  static String registerPageRoute = '/register';
  static String userInfoPageRoute = '/userinfo';
  static String yearsPageRoute = '/years_page';
  static String settingsPageRoute = '/settings';
  static String aboutUsPageRoute = "/about_us";
  static String mainPageRoute = "/main_page";
  static String courseDetailsPageRoute = "/course_detail";
  static String showCourseVideoRoute = '/show_course_pdf';
  static String showCoursePdfRoute = '/show_course_pdf';
  static String quizStatisiticPageRoute = '/show_statistics_page';
  static String quizzPageRoute = '/quizz_page';
  static String quizResultPageRoute = '/quiz_result_page';
  static String searchPageRoute = '/search_page';
  static String privacyPolicyRoute = '/privacy_policy';
  static String downloadedVideosRoute = '/downloaded_videos';

  static List<GetPage> pages = [
    GetPage(name: onboardingPageRoute, page: () => const OnBoardingPage()),
    GetPage(name: loginPageRoute, page: () => const LoginPage()),
    GetPage(name: registerPageRoute, page: () => const RegisterPage()),
    GetPage(name: userInfoPageRoute, page: () => UserInfoPage()),
    GetPage(name: settingsPageRoute, page: () => const SettingsPage()),
    GetPage(name: aboutUsPageRoute, page: () => const AboutUsPage()),
    GetPage(name: mainPageRoute, page: () => const MainPage()),
    GetPage(name: yearsPageRoute, page: () => YearsCoursesPage()),
    GetPage(
        name: courseDetailsPageRoute, page: () => const CourseDetailsPage()),
    GetPage(name: showCourseVideoRoute, page: () => const ShowCourseVideo()),
    GetPage(name: showCourseVideoRoute, page: () => const ShowCourseVideo()),
    GetPage(name: quizStatisiticPageRoute, page: () => QuizStatisticPage()),
    GetPage(name: quizzPageRoute, page: () => const QuizzesPage()),
    GetPage(name: quizResultPageRoute, page: () => ResultPage()),
    GetPage(name: searchPageRoute, page: () => const SearchPage()),
    GetPage(name: privacyPolicyRoute, page: () => const PricyPolicy()),
    GetPage(
        name: downloadedVideosRoute, page: () => const DownloadedVideosPage()),
  ];
}
