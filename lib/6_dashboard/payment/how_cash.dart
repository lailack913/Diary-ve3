import 'package:diary/6_dashboard/add_property/property_type.dart';
import 'package:flutter/material.dart';

class how_cash extends StatefulWidget {
  const how_cash({Key? key}) : super(key: key);

  @override
  State<how_cash> createState() => _cashState();
}

class _cashState extends State<how_cash> {
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("كيف ادفع نقدا",style: TextStyle(fontSize: 37),),
            Text("  كيف ادفع نقدا  كيف ادفع نقدا كيف ادفع نقدا كيف ادفع نقدا كيف ادفع نقدا كيف ادفع نقدا",
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
