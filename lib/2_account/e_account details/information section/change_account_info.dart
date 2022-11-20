import 'package:flutter/material.dart';

class change_account_info extends StatefulWidget {
  const change_account_info({Key? key}) : super(key: key);

  @override
  State<change_account_info> createState() => _change_account_infoState();
}

class _change_account_infoState extends State<change_account_info> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: height()/3,
              width: width()/1.2,
              margin: EdgeInsets.only(bottom:  height()/4),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      hintText:  'الاسم قبل التغيير: مكتب حجي سلطان',
                      labelStyle: TextStyle( ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف ',
                      hintText:  'رقم الهاتف قبل التغيير: 07700000 ',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              )
          ),
          Container(
            color: Colors.grey,
            height: height()/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text("احفظ التعديل", style: TextStyle(fontSize: 27,), textAlign: TextAlign.right,),
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
