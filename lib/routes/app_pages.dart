import 'package:get/get.dart';
import '../screens/input_screen.dart';
import '../screens/result_screen.dart';

class Routes {
  static const INPUT = '/input';
  static const RESULT = '/result';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.INPUT, page: () => InputScreen()),
    GetPage(name: Routes.RESULT, page: () => ResultScreen()),
  ];
}