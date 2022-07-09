
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/views/checkinsuccess/checkin_success_binding.dart';
import 'package:getx_flutter/x_res/my_res.dart';
import 'package:getx_flutter/x_routes/routes.dart';
import 'package:getx_flutter/x_utils/widgets/my_text_form_field.dart';
import 'package:intl/intl.dart';

/// createdby DucTrinh
/// Monday, 8/7/22

class CheckInSuccessScreen extends BaseView<CheckInSuccessController> {

  @override
  Widget vBuilder() => Scaffold(
    body:
    SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(XR().string.checkin_title),
              Text("You’re almost done \n Please enter your infomation",textAlign: TextAlign.center,),
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
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(XR().string.first_name),
                              subtitle: MyTextFormField(
                                obscureText: false,
                                labelText: XR().string.first_name,
                                hint: XR().string.first_name,
                                prefixIcon: Icons.switch_account_sharp ,
                              )
                          ),
                        ),
                        SizedBox(
                          width: MySpace.paddingM,
                        ),
                        Expanded(
                          child:ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(XR().string.last_name),
                            subtitle:  MyTextFormField(
                              obscureText: false,
                              labelText: XR().string.last_name,
                              hint: XR().string.last_name,
                              prefixIcon: Icons.switch_account_sharp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${XR().string.email}'),
                        SizedBox(height:10),
                        MyTextFormField(
                          obscureText: false,
                          labelText: '${XR().string.email}(${XR().string.option})',
                          hint: XR().string.email,
                          prefixIcon: Icons.mail_outline_outlined ,

                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${XR().string.dob}'),
                        SizedBox(height:5),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: (){
                              _selectDate(controller.dob , (date)=> controller.setDob(date));
                            },
                            icon: Icon(Icons.today_outlined), //icon data for elevated button
                            label: Text(controller.formattedDateTime(format:"dd/MM",date: controller.dob)), //label text
                            style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, //elevated btton background color
                                    onPrimary: Colors.white,
                                    padding: EdgeInsets.all(MySpace.paddingM),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                        width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    )
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
                  Get.toNamed(RouterName.selectservice)
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Text('Next',),
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
    ),
  );


  _selectDate(DateTime date,Function callback) async {
    if(GetPlatform.isAndroid || GetPlatform.isFuchsia || GetPlatform.isLinux || GetPlatform.isWindows){
      buildMaterialDatePicker(date,callback);
    }
    if(GetPlatform.isIOS || GetPlatform.isMacOS){
      buildCupertinoDatePicker(date,callback);
    }
  }
  /// This builds material date picker in Android
  buildMaterialDatePicker(DateTime date,Function callback) async {
    final DateTime picked = await showDatePicker(
      context: Get.context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != date && callback != null){
      callback(picked);
    }
  }
  /// This builds cupertion date picker in iOS
  Future<DateTime> buildCupertinoDatePicker(DateTime dateTime,Function callback) {
    showModalBottomSheet(
        context: Get.context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(Get.context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != dateTime && callback!=null)
                 {
                   callback(picked);
                 }
              },
              initialDateTime: dateTime,
              minimumYear: 1900,
              maximumYear: 2025,
            ),
          );
        });
  }
}
