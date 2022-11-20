import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/c_restoration/restor_new_password.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'restor_PN.dart';
import 'package:firebase_auth/firebase_auth.dart';


class restor_verify extends StatefulWidget {
  const restor_verify({Key? key}) : super(key: key);

  @override
  State<restor_verify> createState() => _restor_verifyState();
}

class _restor_verifyState extends State<restor_verify> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _onEditing = true;
  String _code="";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Diary_appbar_color,
      ),
      body: Column(
        children: [
          SizedBox(height: 25.h,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'يرجى ادخل الرمز هنا',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          VerificationCode(
            textStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Theme.of(context).primaryColor),
            keyboardType: TextInputType.number,
            underlineColor: Colors
                .amber, // If this is null it will use primaryColor: Colors.red from Theme
            length: 6,
            cursorColor:
            Colors.blue,

            // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'حذف',
                style: TextStyle(
                    fontSize: 17.0,
                    decoration: TextDecoration.underline,
                    color: Colors.teal[700]),
              ),
            ),
            margin: const EdgeInsets.all(3),
            onCompleted: (String value) {
              setState(() {
                _code = value;

              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),

          SizedBox(
            height: 5.h,
          ),


          Container(
            height: 6.h, width: 20.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Diary_button_color
              ),
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: restor_pn.verify, smsCode: _code);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                setState(() {


                  Navigator.of(context).
                  push(MaterialPageRoute(builder: (context) => restor_new_password()));
                });
              },
              child: Text("التالي", style: TextStyle(fontSize: 19),),
            ),
          ),
        ],
      ),
    );
  }
}