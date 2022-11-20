import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../dataa.dart';
import 'package:diary/2_account/c_restoration/restor_verify.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

var phoneController = TextEditingController();
var phone_number="";

class restor_pn extends StatefulWidget {

  static String verify="";

  late final String title;
  late final String message;
  late final String note;
  restor_pn({
    required this.title,
    required this.message,
    required this.note,
  });

  @override
  State<restor_pn> createState() => _restor_pnState();
}

class _restor_pnState extends State<restor_pn> {
  var litems = [];



  Future getData() async {
    var url = Uri.parse("http://localhost:4000");
    Response response = await get(url);
    String body = response.body;

    List<dynamic> list1 = json.decode(body);
    print(list1);
    litems.clear();
    for (int i = 0; i < list1.length; i++) {
      litems.add(list1[i]["u_phone"]);
      setState(() {
        if (list1[i]["u_phone"] == u_phone) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => restor_verify()));
        }
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(70, 170, 70, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 31,
                  ),
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                TextField(
                  keyboardType:  TextInputType.phone,
                  onChanged: (value){
                    phone_number=value;
                    u_phone = phoneController.text;
                  },
                  controller: phoneController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(color: main_color),
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
                Text(
                 widget.note,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 19,
                ),

                Center(
                  child: Container(
                    height: 6.h, width: 20.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Diary_button_color
                        ),

                      onPressed: () {
                        setState(() async {

                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+964${phone_number}',
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) {
                             restor_pn.verify=verificationId;
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );

                          if (u_phone!=''){
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (context) => restor_verify()));
                          }

                        });
                        getData();
                      },
                      child: Text(
                        "التالي",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
