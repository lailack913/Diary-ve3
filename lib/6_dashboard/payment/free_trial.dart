import 'package:flutter/material.dart';

import '../add_property/property_type.dart';

class free_trail extends StatefulWidget {
  const free_trail({Key? key}) : super(key: key);

  @override
  State<free_trail> createState() => _free_trailState();
}

class _free_trailState extends State<free_trail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.arrow_back_ios_new, ),
        backgroundColor: Colors.grey,
      ),

      body: Container(
        padding:EdgeInsets.fromLTRB(30, 50, 30, 0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("مبارك, الان لديك 3 اشهر مجانا لمنشور واحد",style: TextStyle(fontSize: 37),),
            Text("مبارك, الن لديك 3 اشهر مجانا لمنشور واحد مبارك, الن لديك 3 اشهر مجانا لمنشور واحد مبارك, الن لديك 3 اشهر مجانا لمنشور واحد مبارك, الن لديك 3 اشهر مجانا لمنشور واحد",
              style: TextStyle(fontSize: 27), textAlign: TextAlign.right,),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              alignment: Alignment.center,
              child:
              ElevatedButton(
                  onPressed: (){

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder:(context) => property_type( )));},
                  child: Text("موافق")),
            )
          ],
        ),
      ),

    );
  }
}
