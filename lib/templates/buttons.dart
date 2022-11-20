import 'package:flutter/material.dart';

class button {

  static default_buttonG(double height, double width,
      String type, bool isPressed,
      )
  {
    return
      AnimatedContainer(
        duration: Duration(microseconds: 100),
        width: 90,
        height: 90,
        child: Center(
          child: Text("$type",style: TextStyle(fontSize: 19),),
        ),
        decoration: BoxDecoration(
          color: (isPressed == false ) ?  Color(0xFF23494A) :  Color(0xFF23494A),
          borderRadius: BorderRadius.circular(19),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: (isPressed == false ) ? [Color(0xFF23494A), Color(0xFF5C9596),]
                : [Color(0xFF23494A), Color(0xFF4A7979)],

          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x2cd8d7d7),
              offset: isPressed ?  Offset(-5.3, 5.3) : Offset(-9.3, 7.3),
              blurRadius: isPressed ? 17.0 : 17.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: Color(0xbb3a3a3a) ,
              offset: isPressed ? Offset(5.3, -5.3) : Offset(9.3, -7.3),
              blurRadius: isPressed ? 7.0 : 17.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
      );
  }

  static default_button(double height, double width,
      String type, bool isPressed,
      )
  {
    return
      Container(
        width: 90,
        height: 90,
        child: Center(
          child: Text("$type",style: TextStyle(fontSize: 19),),
        ),
        decoration: BoxDecoration(
          color: (isPressed == false ) ?  Color(0xffefeeee) :  Color(0xffefeeee),
          borderRadius: BorderRadius.circular(19),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: (isPressed == false ) ? [Color(0xfff3f3f3), Color(0xffefeeee),] : [Colors.white, Colors.white,],

          ),
          boxShadow: [
            BoxShadow(
              color: isPressed ? Colors.white : Color(0xffd8d7d7),
              offset: isPressed ?  Offset(-9.3, 7.3):Offset(-5.3, 5.3),
              blurRadius: isPressed ? 17.0 : 7.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color:  isPressed ? Color(0xffd8d7d7) : Color(0xffd8d7d7) ,
              offset: isPressed ?  Offset(-9.3, 7.3):Offset(-5.3, 5.3),
              blurRadius: isPressed ? 17.0 : 7.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
      );
  }


 // srtatic  linkbotton(){
   // return ElevatedButton(
 //     onPressed: () => setState(() {
  //      _launched = _launchInBrowser(toLaunch);
  //    }),
   //   child: const Text('Launch in browser'),
//    ),
  //}
}