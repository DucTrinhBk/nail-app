import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/models/banner.dart';

/// createdby DucTrinh
/// Wednesday, 7/8/22

class CheckInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckInController());
  }

}

class CheckInController extends BaseController {

  var banners = [
    Banner(
      title: 'Slide 1',
      imageUrl: 'https://dep365.com/wp-content/uploads/2022/01/mau-nail-tet-do-3.jpg',
    ),
    Banner(
      title: 'Slide 2',
      imageUrl: 'https://dep365.com/wp-content/uploads/2022/01/mau-nail-tet-do-1-1-edited.jpg',
    ),
    Banner(
      title: 'Slide 3',
      imageUrl: 'https://dep365.com/wp-content/uploads/2022/01/mau-nail-tet-do-4.jpg',
    ),
  ];
  var isPolicyChecked = false;
  var phoneNumber = '0901231234';
  @override
  void onInit() async{
    super.onInit();
    await 2.delay();
    MyTranslations.init();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());
  }
  void policyCheck(bool isCheck){
    isPolicyChecked = isCheck;
    update();
  }
  void enterPhoneNumber(String value){
    if(phoneNumber.length > 12){
      logWhenDebug("enterPhoneNumber", "Số điện thoại quá dài");
      return;
    }
    phoneNumber+=value;
    update();
  }
  void delPhoneNumber(){
    if(phoneNumber.length <= 0){
      logWhenDebug("delPhoneNumber", "Không thể xóa sdt ");
      return;
    }
    phoneNumber = phoneNumber.substring(0,phoneNumber.length - 1);
    update();
  }
}