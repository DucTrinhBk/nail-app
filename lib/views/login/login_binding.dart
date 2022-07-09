import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/x_utils/utilities.dart';

/// createdby DucTrinh
/// Wednesday, 8/7/21

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}

class LoginController extends BaseController {
  var title = XR().string.checkin_title;
  var notify = XR().string.login_notify;
  var switchMode = SwitchMode.checkin;
  @override
  void onInit() {
    super.onInit();
    setEnableScrollController = true;
    MyTranslations.init();
    setScreenState = screenStateOk;
    update();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());
  }
  void changeSwithMode(SwitchMode mode){
    switchMode = mode;
    if(mode == SwitchMode.checkin){
      title = XR().string.checkin_title;
    }else{
      title = XR().string.checkout_title;
    }
    update();
  }
}