import 'dart:convert';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../dataa.dart';
var newpasswordController=TextEditingController();
var confirmpasswordController=TextEditingController();

class restor_new_password extends StatefulWidget {
  const restor_new_password({Key? key}) : super(key: key);

  @override
  State<restor_new_password> createState() => _restor_new_passwordState();
}

class _restor_new_passwordState extends State<restor_new_password> {
  bool check = false;
  Future Update_data() async {
    var url = Uri.parse("http://localhost:4000/add");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"password": "$passwordup"}';
    // make POST request
    Response response = await put(url, headers: headers, body: json);
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
          title: Icon(Icons.arrow_back, ) ,
          backgroundColor: Diary_appbar_color,
        ),

        body:
        SafeArea(
          child:
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(70, 190, 70, 0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("كلمة مرور جديدة",
                    style: TextStyle( fontSize: 31,  ),) ,
                  Text("يرجى تعيين كلمة مرور جديدة",
                    style: TextStyle( fontSize: 19,),) ,

                  SizedBox(height: 17,),

                  TextField(
                    controller: newpasswordController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور الجديدة',
                      labelStyle: TextStyle(

                      ),
                      border: OutlineInputBorder(
                      ),
                    ),
                  ),

                  SizedBox(height: 17,),

                  TextField(
                    controller: confirmpasswordController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'تأكيد كلمة المرور الجديدة',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 19,),

                  Center(
                    child:
                    Container(
                      height: 6.h, width: 20.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Diary_button_color
                        ),
                        onPressed: () {
                          setState(() {
                            passwordup=newpasswordController.text;
                            if (passwordup==confirmpasswordController.text)
                              Update_data();
                          });
                        },
                        child: Text("حفظ", style: TextStyle(fontSize: 19),),
                      ),
                    ) ,

                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
