import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/models/order.dart';
import 'package:getx_flutter/models/service.dart';
import 'package:getx_flutter/models/technician.dart';
import 'package:getx_flutter/x_utils/utilities.dart';

/// createdby DucTrinh
/// Wednesday, 8/7/21

class SelectServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectServiceController());
  }

}

class SelectServiceController extends BaseController {
  var technicians = [
    Technician(
      id : 1,
      name: 'My Duyen',
    ),
    Technician(
      id : 2,
      name: 'Ngoc Anh'
    ),
    Technician(
      id: 3,
      name: 'Thanh Huong'
    )
  ];

  var services = [
    Service(
      id : 1,
      name: 'manicure',
      price: 3
    ),
    Service(
        id : 2,
        name: 'pedicure',
        price: 3
    ),
    Service(
        id : 3,
        name: 'waxing',
        price: 3
    ),Service(
        id : 4,
        name: 'massage',
        price: 3
    ),Service(
        id : 5,
        name: 'hair',
        price: 3
    ),
  ];
  var orders = [];
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
  selectTechnician(int index,bool value){
    technicians[index].isSelected = value;
    if(!value){
      orders.removeWhere((e) => e.technicianId ==technicians[index].id);
    }
    update();
  }

  selectService(int index,bool value){
    services[index].isSelected = value;
    if(!value){
      orders.removeWhere((e) => e.serviceId == services[index].id);
    }
    update();
  }

  addOrder(){
    orders.clear();
    for(var t in technicians){
      if(t.isSelected){
        for( var s in services){
          if(s.isSelected){
            orders.add(Order(
              technicianId: t.id,
              serviceId: s.id,
              technicianName: t.name,
              serviceName: s.name,
              price: s.price
            ));
          }
        }
      }
    }
    update();
  }

  deleteOrder(int index){
    orders.removeAt(index);
    update();
  }
}