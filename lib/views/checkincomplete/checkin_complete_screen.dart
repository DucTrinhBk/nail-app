import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/views/checkin/checkin_binding.dart';
import 'package:getx_flutter/views/checkincomplete/checkin_complete_binding.dart';
import 'package:getx_flutter/x_res/my_res.dart';
import 'package:getx_flutter/x_routes/routes.dart';
import 'package:getx_flutter/x_utils/widgets/my_text_form_field.dart';

/// createdby Daewu Bintara
/// Monday, 1/4/21

class CheckInCompleteScreen extends BaseView<CheckInCompleteController> {

  @override
  Widget vBuilder() => Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star,color: Colors.yellow,),
                Icon(Icons.star,color: Colors.yellow,),
                Icon(Icons.star,color: Colors.yellow,),
                Icon(Icons.star,color: Colors.yellow,),
                Icon(Icons.star,color: Colors.yellow,),
              ],
            ),
            Container(
              padding: EdgeInsets.all(MySpace.marginL),
              child: Text("Thank you!",style: TextStyle(color: Colors.white),),
            ),
            Container(
              child: Text("Nguyen van A!",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(MySpace.marginS, 0, 0, MySpace.paddingS),
              child: Text("You checked in successfully",style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
                ),
              ),
            ),
            Container(
              child: Text("Your curent point",style: TextStyle(color: Colors.white),),
            ),
            Container(
              child: Text("10 Pts",style: TextStyle(fontSize: 20,color: Colors.lightGreen,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      )
  );

}
