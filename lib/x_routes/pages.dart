import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/views/checkin/checkin_binding.dart';
import 'package:getx_flutter/views/checkin/checkin_screen.dart';
import 'package:getx_flutter/views/checkincomplete/checkin_complete_binding.dart';
import 'package:getx_flutter/views/checkincomplete/checkin_complete_screen.dart';
import 'package:getx_flutter/views/checkinsuccess/checkin_success_binding.dart';
import 'package:getx_flutter/views/checkinsuccess/checkin_success_screen.dart';
import 'package:getx_flutter/views/home/home_binding.dart';
import 'package:getx_flutter/views/login/login_binding.dart';
import 'package:getx_flutter/views/login/login_screen.dart';
import 'package:getx_flutter/views/select_service/select_service_binding.dart';
import 'package:getx_flutter/views/select_service/select_service_screen.dart';
import 'package:getx_flutter/views/test/test_binding.dart';
import '../views/test/test_screen.dart';
import '../views/home/home_screen.dart';
import 'router_name.dart';

/**
 * Created by daewubintara on
 * 09, September 2020 09.07
 */

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouterName.main_home,
        page: () => HomeScreen(),
        binding: HomeBinding()
      ),
      GetPage(
        name: RouterName.test,
        page: () => TestScreen(),
        binding: TestBinding()
      ),
      GetPage(
          name: RouterName.login,
          page:()=> LoginScreen(),
          binding: LoginBinding()
      ),
      GetPage(
          name: RouterName.checkin,
          page: ()=> CheckInScreen(),
          binding: CheckInBinding()
      ),
      GetPage(
          name: RouterName.checkinsuccess,
          page: () => CheckInSuccessScreen(),
          binding: CheckInSuccessBinding()
      ),
      GetPage(
          name: RouterName.selectservice,
          page: ()=> SelectServiceScreen(),
          binding: SelectServiceBinding()
      ),
      GetPage(
          name: RouterName.checkincomplete,
          page: ()=>CheckInCompleteScreen(),
          binding: CheckInCompleteBinding()
      )
    ];
  }
}