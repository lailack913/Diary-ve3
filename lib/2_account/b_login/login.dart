import 'package:diary/2_account/c_restoration/restor_PN.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../dataa.dart';
import '../../1_home/home_page.dart';
import '../a_sign in/creat_account.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../c_restoration/restor_new_password.dart';


var phoneController = TextEditingController();
var passController = TextEditingController();

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool check = false;
  var litems = [];

  Future getData() async {
    var url = Uri.parse("http://localhost:4000");
    Response response = await get(url);
    String body = response.body;

    List<dynamic> list1 = json.decode(body);
    print(list1);
    litems.clear();
    for (int i = 0; i < list1.length; i++) {
      litems.add(list1[i]["fullname"]);
      litems.add(list1[i]["u_phone"]);
      litems.add(list1[i]["password"]);
      litems.add(list1[i]["password_confirm"]);

      setState(() {
        if (list1[i]["u_phone"] == u_phone &&
            list1[i]["password"] == password) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => home_page()));
        } else
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => creat_account()));
      });
    }

    // print(litems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Diary_appbar_color,
       ),
        body: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 5.h,),

              Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 31,
                ),
              ),
              Text(
                "اهلا بعودتك",
                style: TextStyle(
                  fontSize: 31,
                ),
              ),

              SizedBox(height: 2.h,),

              TextField(
                controller: phoneController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Text(
                      "هل نسيت كلمة السر؟",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: main_color),
                    ),
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => restor_pn(
                        title: "استرجاع الحساب",
                        message: "يرجى ادخال رقم الهاتف لاسترجاع الحساب",
                        note:  "سيتم ارسال رمز تاكيد الى رقم الهاتف المدخل لاسترجاع الحساب لذا يرجى التأكد من كتابته بشكل صحيح",
                      )));
                    },
                  ),
                  
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 6.h, width: 20.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Diary_button_color
                          ),
                          onPressed: () {
                            setState(() {
                              u_phone = phoneController.text;
                              password = passController.text;
                            });
                            getData();

                            Login_state=true;
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (context) => home_page()));
                          },
                          child: Text("تسجيل الدخول", style: TextStyle(fontSize: 17.sp),),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(fontSize: 19),
                      ),
                      GestureDetector(
                        child: Text(
                          "انشاء حساب",
                          style: TextStyle(
                              fontSize: 19,
                              decoration: TextDecoration.underline,
                              color: main_color),
                        ),
                        onTap: (){
                          Navigator.of(context).
                          push(MaterialPageRoute(builder: (context) => creat_account()));
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
