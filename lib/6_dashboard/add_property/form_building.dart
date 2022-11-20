import 'dart:convert';

import 'package:diary/0_welcoming/a_splash%20screen/splash.dart';
import 'package:diary/2_account/a_sign%20in/creat_account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../1_home/home_page.dart';
import '../../dataa.dart';
var csaleorrent = TextEditingController();
var ctypebuild = TextEditingController();
var cfloornumper = TextEditingController();
var croomnump = TextEditingController();
var ckichen = TextEditingController();
var cinterface = TextEditingController();
var cspace = TextEditingController();
var cpric = TextEditingController();
var clocation = TextEditingController();
//var cmainimg = TextEditingController();
//var cimg = TextEditingController();
var cotherinfo = TextEditingController();

class form_building extends StatefulWidget {
  const form_building({Key? key}) : super(key: key);

  @override
  State<form_building> createState() => _form_buildingState();
}

class _form_buildingState extends State<form_building> {
  String dropdownValue ="البيع";
  String dropdownValue2 ="سكني";
  String dropdownValue3 ="1";

  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/add");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"sale_or_rent": "$saleorrentup",'
        ' "type_build": "$typebuildup",'
        ' "floor_number": "$floornumperup",'
        ' "room_number": "$roomnumberup",'
        ' "kichen": "$kichenup",'
        ' "interace": "$interfaceup",'
        ' "space": "$spaceup",'
        ' "price": "$priceup",'
        ' "location": "$locationup",'
        ' "mainimg": "$mainimgup",'
        ' "img": "$imgup",'
        ' "other_information": "$otherinfoup"}';
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
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.withOpacity(0.010),
          elevation: 1,
          leading: GestureDetector(
              onTap: ()
              {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)),
          actions: [
            SizedBox(width: 5,),
            Center(
              child: Text("اضافة عقار - مبنى",style: TextStyle(color: Colors.black,fontSize: 25),),
            ),
            SizedBox(width: 5,),
          ],
        ),

        backgroundColor: Colors.white,
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:1,
            itemBuilder: (BuildContext context, int i) {
              return
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(":هل تود",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                          Text(":هل تريده للبيع او للايجار",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),

                          SizedBox(height: 5,),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: csaleorrent,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelText: 'اكتب هنا',
                                labelStyle: TextStyle(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),
                          Text(":نوع المنى",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                          Text(":هل تريده سكني او تجاري",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                          SizedBox(height: 5,),

                        ],
                      ),

                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: ctypebuild,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اكتب هنا',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: cfloornumper,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelText: 'اكتب هنا',
                                labelStyle: TextStyle(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(":عدد الطوابق",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: croomnump,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelText: 'اكتب هنا',
                                labelStyle: TextStyle(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(":عدد الغرف",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller: ckichen,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                labelText: 'اكتب هنا',
                                labelStyle: TextStyle(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(":عدد المطاخ",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(":السعر ",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: cpric,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اكتب هنا',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(":مساحة ",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: cspace,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اكتب هنا',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(":واجهية ",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: cinterface,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اكتب هنا',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("الموقع ",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: clocation,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اكتب هنا',
                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                                child: Icon(Icons.add, color: Colors.black, size: 20,)
                            ),
                          ),

                          SizedBox(width: 10,),
                          Text("اضافة الصورة الرئيسية",
                            style: TextStyle(color: Colors.black, fontSize: 22,),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(":اضافة صور للملحق",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          height: 55,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.add, size: 20, color: Colors.black,),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("معلومات اخرى",
                        style: TextStyle(color: Colors.black, fontSize: 22,),),
                      SizedBox(height: 20,),
                      Center(
                        child:
                        TextField(
                          controller: cotherinfo,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: 'ادخل المعلومات',

                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50, // <-- match-parent
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              saleorrentup=csaleorrent.text;
                              typebuildup=ctypebuild.text;
                              floornumperup=cfloornumper.text;
                              roomnumberup=croomnump.text;
                              kichenup=ckichen.text;
                              spaceup=cspace.text;
                              interfaceup=cinterface.text;
                              otherinfoup=cotherinfo.text;
                              priceup=cpric.text;
                              locationup=clocation.text;
                              Add_data();
                            });
                            //getData();
                          },
                          child: Text(
                            "التالي ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff04a794),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              primary: Color(0xffffffff),
                              // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                              side: BorderSide(
                                width: 0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ))),
                        ),
                      ),
                      /*
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (
                        context) => splash()));
                    setState(() {
                       saleorrentup=csaleorrent.text;
                       typebuildup=ctypebuild.text;
                       floornumperup=cfloornumper.text;
                       otherinfoup=cotherinfo.text;
                      Add_data();

                    });
                  },

                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("معاينة", style: TextStyle(
                          fontSize: 20, color: Colors.white),),
                    ),
                  ),
                ),
              ),

               */
                    ],
                  ),
                );
            }
        )
    );
  }
/*
  GestureDetector button (Textname){
    return GestureDetector(
      onTap: ()
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => form_building()));
      },
      child: Container(
        height: 60,
        width: 180,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: Text(Textname,style: TextStyle(fontSize: 22,color: Colors.white),)
        ),
      ),
    );
  }

 */


}
