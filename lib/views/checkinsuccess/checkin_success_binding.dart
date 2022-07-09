import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/x_utils/utilities.dart';

/// createdby DucTrinh
/// Wednesday, 8/7/21

class CheckInSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckInSuccessController());
  }

}

class CheckInSuccessController extends BaseController {
  var dob = DateTime.now();
  @override
  void onInit() async{
    setEnableScrollController = true;
    super.onInit();
    await 2.delay();
    MyTranslations.init();
    setScreenState = screenStateOk;
    update();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());
  }
  setDob(DateTime dateTime){
    dob = dateTime;
    update();
  }
}