import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/views/home/home_binding.dart';
import 'package:getx_flutter/views/login/login_binding.dart';
import 'package:getx_flutter/x_res/my_res.dart';
import 'package:getx_flutter/x_routes/routes.dart';
import 'package:getx_flutter/x_utils/utilities.dart';
import 'package:getx_flutter/x_utils/widgets/my_text_form_field.dart';

/// createdby DucTrinh
/// Monday, 8/7/22

class LoginScreen extends BaseView<LoginController> {

  @override
  Widget vBuilder() => Scaffold(
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(controller.title),
              Text("${XR().string.login_notify}"),
              Container(
                padding: EdgeInsets.all(MySpace.marginM),
                margin: EdgeInsets.all(MySpace.marginS),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${XR().string.account}'),
                        SizedBox(height:10),
                        MyTextFormField(
                          obscureText: false,
                          labelText: XR().string.account,
                          hint: XR().string.account,
                          prefixIcon: Icons.account_box,

                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${XR().string.password}'),
                        SizedBox(height:5),
                        MyTextFormField(
                          obscureText: true,
                          labelText: XR().string.password,
                          hint: XR().string.password,
                          prefixIcon: Icons.key ,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child:  ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('CheckIn',style: TextStyle(fontSize: 12)),
                            leading: Radio<SwitchMode>(
                              value: SwitchMode.checkin,
                              groupValue: controller.switchMode,
                              onChanged: (SwitchMode value) {
                                controller.changeSwithMode(value);
                              },
                              fillColor: MaterialStateProperty.all(MyColor.TEXT_COLOR_DARK),
                            ),
                          ),
                        ),
                        SizedBox(width: 150,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('CheckOut',style: TextStyle(fontSize: 12),),
                            leading: Radio<SwitchMode>(
                              value: SwitchMode.checkout,
                              groupValue: controller.switchMode,
                              onChanged: (SwitchMode value) {
                                controller.changeSwithMode(value);
                              },
                              fillColor: MaterialStateProperty.all(MyColor.TEXT_COLOR_DARK),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  Get.toNamed(RouterName.checkin)
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Text(XR().string.login,),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,//change background color of button
                  onPrimary: Colors.white,//change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
              )
            ],
          ),
        ),
      ),
    )
  );

}
