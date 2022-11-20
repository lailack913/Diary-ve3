import 'package:flutter/material.dart';

class test extends StatefulWidget {
 final img;
 test({
   required this.img
});
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:
                Image.file( widget.img )
          ),
        ],
      ),
    );
  }
}
