import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/models/order.dart';
import 'package:getx_flutter/models/service.dart';
import 'package:getx_flutter/models/technician.dart';
import 'package:getx_flutter/x_utils/utilities.dart';

/// createdby DucTrinh
/// Wednesday, 8/7/21

class CheckInCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckInCompleteController());
  }

}

class CheckInCompleteController extends BaseController {
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
}