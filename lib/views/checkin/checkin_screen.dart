import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/views/checkin/checkin_binding.dart';
import 'package:getx_flutter/x_res/my_res.dart';
import 'package:getx_flutter/x_routes/routes.dart';
import 'package:getx_flutter/x_utils/widgets/my_text_form_field.dart';

/// createdby Daewu Bintara
/// Monday, 1/4/21

class CheckInScreen extends BaseView<CheckInController> {

  @override
  Widget vBuilder() => Scaffold(
    body: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items:
                    controller
                        .banners
                        .map((item) => Container(
                      child: Center(
                          child:
                          Image.network(item.imageUrl, fit: BoxFit.cover, width: 150)),
                    ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 10,),
                Text("CONTACTLESS CHECK-IN"),
                SizedBox(height: 10,),
                Image.network('https://vi.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png', fit: BoxFit.cover, width: 150),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Chính sách dữ liệu của chúng tôi giải thích cách  chúng tôi thu thập và sử dụng dữ liệu cá nhân của bạn để quyết định hiển thị cho bạn quảng cáo nào, cũng như để cung cấp tất cả các dịch vụ khác được mô tả bên dưới.',style: TextStyle(fontSize: 10),),
                  value: controller.isPolicyChecked,
                  onChanged: (bool value) {
                    controller.policyCheck(value);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  selectedTileColor: Colors.transparent,
                )
              ],
            ),
          ),
        ),
        Container(
          child: Center(
            child: Column(
              children: [
                Text(XR().string.checkin_title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text(
                  "Please enter your cell phone number \n Your info will not be shared",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 5,),
                Text(controller.phoneNumber,style: TextStyle(fontSize: 20),),
                SizedBox(height: MySpace.marginL,),
                Column(
                  children: [
                    Row(
                      children: [
                        _phoneButton("1"),
                        _phoneButton("2"),
                        _phoneButton("3"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        _phoneButton("4"),
                        _phoneButton("5"),
                        _phoneButton("6"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        _phoneButton("7"),
                        _phoneButton("8"),
                        _phoneButton("9"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        _phoneButton(
                              "Del",
                              execute: () => controller.delPhoneNumber(),
                              backgroundColor: Colors.grey,
                              borderColor: Colors.transparent
                        ),
                        _phoneButton("0"),
                        _phoneButton(
                            "Next",
                            execute: (){
                              Get.toNamed(RouterName.checkinsuccess);
                            },
                            backgroundColor: Colors.blue,
                            borderColor: Colors.transparent
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    )
  );

  Widget _phoneButton(String value,{Function execute,Color backgroundColor = Colors.transparent,Color color = Colors.white,Color borderColor = Colors.white}){
    return ElevatedButton(
          onPressed: execute == null? 
              () => controller.enterPhoneNumber(value)
              :execute,
          child: Text(value),
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,//change background color of button
            onPrimary: color,//change text color of button
            shape: CircleBorder(side: BorderSide(
              width: 1,
              color: borderColor,
            )),
            elevation: 15.0,
            padding: EdgeInsets.all(MySpace.marginL),
          ),
    );
  }
}
