import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart';
import 'dart:convert';

//read it
// import 'dart:js'; ir didnt run until i stop this line so check it pls <<<<<<<<<<
import '../../dataa.dart';
import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/b_login/login.dart';

var nameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var password_confirmController = TextEditingController();

class creat_account extends StatefulWidget {
  @override
  State<creat_account> createState() => _creat_accountState();
}

class _creat_accountState extends State<creat_account> {

  bool office=true;
  bool person=false;
  bool merchant=false;
  bool company=false;

  late String _account_typeup;

  bool check = false;
  Future Add_data() async {
    var url = Uri.parse("http://lockalhost:4000/r");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"fullname": "$nameup",'
        ' "u_phone": "$phoneup",'
        ' "password": "$passwordup",'
        ' "usertype": "$usertypeup"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Diary_appbar_color,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(70, 30, 70, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                      fontSize: 31,
                    ),
                  ),
                  Text(
                    "اهلا بك",
                    style: TextStyle(
                      fontSize: 31,
                    ),
                  ),
                  Text(":اختر نوع الحساب",style: TextStyle(
                    fontSize: 25,
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [

                        GestureDetector(
                          child: type("شخص",person),
                          onTap: (){
                            setState(() {
                              usertypeup="person";
                               office=false;
                               person=true;
                               merchant=false;
                               company=false;
                            });
                          },
                        ),

                        SizedBox(width: 5,),

                        GestureDetector(
                          child: type("تاجر",merchant),
                          onTap: (){
                            setState(() {
                              usertypeup="merchant";
                               office=false;
                               person=false;
                               merchant=true;
                               company=false;
                            });
                          },
                        ),

                        SizedBox(width: 5,),

                        GestureDetector(
                          child: type("مكتب",office),
                          onTap: (){
                            setState(() {
                              usertypeup="office";
                               office=true;
                               person=false;
                               merchant=false;
                               company=false;
                            });
                          },
                        ),

                        SizedBox(width: 5,),

                        GestureDetector(
                          child: type("شركة",company),
                          onTap: (){
                            setState(() {
                              usertypeup="company";
                               office=false;
                               person=false;
                               merchant=false;
                               company=true;
                            });
                          },
                        )

                      ],
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      labelStyle: TextStyle(color: main_color, ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),

                  TextField(
                    controller: phoneController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      labelStyle: TextStyle(color: main_color, ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  TextField(
                    controller: passwordController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      labelStyle: TextStyle(color: main_color, ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  TextField(
                    // controller: password_confirmController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'تأكيد كلمة المرور',
                      labelStyle: TextStyle(color: main_color, ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h,),

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
                                  nameup = nameController.text;
                                  phoneup = phoneController.text;
                                  passwordup = passwordController.text;
                                  password_confirmup = password_confirmController.text;
                                  account_typeup=usertypeup;
                                  Add_data();

                                });
                              },
                              child: Text("أنشئ حسابي", style: TextStyle(fontSize: 17.sp),),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),

                          SizedBox(height: 1.h,),

                          Row(
                            children: [
                              GestureDetector(
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      fontSize: 19,
                                      decoration: TextDecoration.underline,
                                      color: Diary_button_color),
                                ),
                                onTap: (){
                                  Navigator.of(context).
                                  push(MaterialPageRoute(builder: (context) => login()));
                                },
                              ),
                              SizedBox(width: 7,),
                              Text(
                                "لديك حساب بالفعل؟",
                                style: TextStyle(fontSize: 19),
                              ),

                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  type(String type, bool btype){
    return Container(
        height: 7.h,
        width: 15.5.w,
        decoration: BoxDecoration(
          border: Border.all(color: btype? Colors.teal.shade300: Colors.grey, width: 2 ),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Center(
          child:  Text("$type",style: TextStyle(
            color: btype? Colors.teal.shade300: Colors.grey,
            fontSize: 18.sp,
          ),),
        )
    );
  }
}
