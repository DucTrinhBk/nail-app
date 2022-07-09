
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/models/member.dart';
import 'package:getx_flutter/models/order.dart';
import 'package:getx_flutter/x_res/my_res.dart';

import 'select_service_binding.dart';

/// createdby DucTrinh
/// Monday, 8/7/22

class SelectServiceScreen extends BaseView<SelectServiceController> {

  @override
  Widget vBuilder() => Scaffold(
    body:
    Container(
      //height: 200,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(Get.context).size.height * 0.8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(MySpace.paddingS)
                      ) ,
                      margin: EdgeInsets.fromLTRB(MySpace.marginZero, MySpace.marginZero, MySpace.marginL, MySpace.marginZero),
                      child: ListView.builder(
                        itemCount: controller.services.length,
                        itemBuilder: (context,index){
                          var itemModel = controller.services[index];
                          return  CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(itemModel.name,style: TextStyle(fontSize: 12),),
                            subtitle: Text('\$${itemModel.price}',style: TextStyle(fontSize: 12),),
                            value: itemModel.isSelected,
                            onChanged: (bool value) {
                              controller.selectService(index, value);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            selectedTileColor: Colors.transparent,

                          );
                        },
                      )),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(MySpace.paddingS)
                      ) ,
                      margin: EdgeInsets.fromLTRB(MySpace.marginZero, MySpace.marginZero, MySpace.marginL, MySpace.marginZero),
                      child: ListView.builder(
                        itemCount: controller.technicians.length,
                        itemBuilder: (context,index){
                          var itemModel = controller.technicians[index];
                          final theme = Theme.of(context);
                          final oldCheckboxTheme = theme.checkboxTheme;

                          final newCheckBoxTheme = oldCheckboxTheme.copyWith(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          );
                          return  Theme(
                              data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
                              child:CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(itemModel.name,style: TextStyle(fontSize: 12),),
                                value: itemModel.isSelected,
                                onChanged: (bool value) {
                                  controller.selectTechnician(index, value);
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)) ,
                                controlAffinity: ListTileControlAffinity.leading,
                                selectedTileColor: Colors.transparent,
                              )
                          );
                        },
                      )
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    controller.addOrder();
                  },
                  child: Text("ADD  >>"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,//change background color of button
                    onPrimary: Colors.red,//change text color of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:  BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    elevation: 15.0,
                  ),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(MySpace.paddingS),
                      ) ,
                      padding: EdgeInsets.fromLTRB(MySpace.marginM, MySpace.marginZero, MySpace.marginM, MySpace.marginZero),
                      margin: EdgeInsets.fromLTRB(MySpace.marginM, MySpace.marginZero, MySpace.marginM, MySpace.marginZero),
                      child: ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context,index){
                          Order itemModel = controller.orders[index];
                          return  ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('${itemModel.serviceName}',style: TextStyle(fontSize: 14),),
                            subtitle: Container(
                              height: 26,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, MySpace.marginS),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
                                ),
                              ),
                              child: Text('${itemModel.technicianName}',style: TextStyle(fontSize: 14),),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),) ,
                            minLeadingWidth : 0,
                            horizontalTitleGap: 0,
                            leading: Container(
                              width: MySpace.paddingM * 3,
                              padding: EdgeInsets.fromLTRB(MySpace.paddingZero, MySpace.paddingZero, MySpace.paddingM, MySpace.paddingZero),
                              alignment: Alignment.center,
                              child: Ink(
                                width: MySpace.paddingL,
                                height: MySpace.paddingL,
                                padding: EdgeInsets.zero,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.close,color: Colors.black,size: MySpace.paddingL,),
                                  onPressed: (){
                                    controller.deleteOrder(index);
                                  },
                                ),
                              ),
                            ),
                            trailing: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      controller.minusOrderQuantity(index);
                                    },
                                    icon: Icon(Icons.remove_circle_outline,size: 15,),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(
                                        maxWidth: 15,
                                        minWidth: 5
                                    ),
                                  ),
                                  Container(
                                    child: Text('${itemModel.quantity}'),
                                    padding: EdgeInsets.fromLTRB(MySpace.marginM, MySpace.paddingZero, MySpace.marginM, MySpace.paddingZero),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      controller.addOrderQuantity(index);
                                    },
                                    icon: Icon(Icons.add_circle_outline,size: 15,),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(
                                        maxWidth: 15,
                                        minWidth: 5
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            selectedTileColor: Colors.transparent,
                          );
                        },
                      )
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(Get.context).size.height * 0.2,
            color: Colors.black,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: (){
                  Get.toNamed(RouterName.checkincomplete);
                }, child: Text("SKIP"),style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                ),
                SizedBox(
                  width: MySpace.marginL,
                ),
                TextButton(onPressed: (){
                  Get.toNamed(RouterName.checkincomplete);
                }, child: Text("NEXT"),style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),)
              ],
            ),
          )
        ],
      )
      )
  );

}
