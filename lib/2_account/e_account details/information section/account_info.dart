import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/a_sign%20in/creat_account.dart';
import 'package:diary/dataa.dart';
import 'package:flutter/cupertino.dart';
import 'package:diary/2_account/c_restoration/restor_new_password.dart';
import 'package:diary/2_account/e_account%20details/information%20section/change_account_info.dart';
import 'package:flutter/material.dart';

import '../../c_restoration/restor_PN.dart';

class account_info extends StatefulWidget {
  const account_info({Key? key}) : super(key: key);

  @override
  State<account_info> createState() => _account_infoState();
}

class _account_infoState extends State<account_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),

      body:
     SafeArea(
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Container(
               height: height()/3.5,
               width: width(),
               margin: EdgeInsets.fromLTRB( 0, 0, 37, height()/7),
               child:Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Text("الاسم: مكتب حجي سلطان ", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
                   Text("رقم الهاتف: 07700000 ", style: TextStyle(fontSize: 27), textAlign: TextAlign.right,),
                   Text("تاريخ انتهاء الاشتراك: ('التاريخ مثلا 2022/11/15' او' لست مشتركا') ", style: TextStyle(fontSize: 27), textAlign: TextAlign.right,),
                 ],
               )
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("تسجيل الخروج",style: TextStyle(fontSize: 30),),
               IconButton(
                 icon: Icon(Icons.logout,size: 30,color: Colors.red,),
                 onPressed: (){
                   Login_state= false;
                   Navigator.of(context).
                   push(MaterialPageRoute(builder: (context) => creat_account()));
                 },
               ),
             ],
           ),
           Container(
             margin: EdgeInsets.only(top: 70),
             color: Colors.grey,
             height: height()/10,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 GestureDetector(
                   child: Text("تعديل المعلومات", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
                   onTap: (){
                     Navigator.of(context)
                         .push(MaterialPageRoute(builder: (context) => change_account_info()));
                   },
                 ),
                 GestureDetector(
                   child: Text("تغيير كلمة السر", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
                   onTap: (){
                     Navigator.of(context)
                         .push(MaterialPageRoute(builder: (context) => change_account_info()));
                   },
                 ),
               ],
             ),
           ),
         ],
       ),
     )
    );
  }
  height(){
    var height=MediaQuery.of(context).size.height;
    return height;
  }
  width(){
    var width=MediaQuery.of(context).size.width;
    return width;
  }
}
