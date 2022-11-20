import 'package:diary/6_dashboard/add_property/form_building.dart';
import 'package:diary/6_dashboard/add_property/form_land.dart';
import 'package:diary/6_dashboard/add_property/form_residential.dart';
import 'package:diary/6_dashboard/add_property/form_store.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';


class property_type extends StatefulWidget {
  const property_type({Key? key}) : super(key: key);

  @override
  State<property_type> createState() => _property_typeState();
}

class _property_typeState extends State<property_type> {
  other_templates _other_templates = other_templates();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         backgroundColor: Diary_appbar_color,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 37),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(":اختر نوع العقار الذي تود نشره",style: TextStyle(fontSize: 23),),
              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => form_residential( ))); },

                child:
                other_templates.property_choices(height()/6.3, width()/1.3, "سكني", "بيت/شقة/مشتمل/فيلا", 37, 23),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => form_land( ))); },

                child:
                other_templates.property_choices(height()/6.3, width()/1.3, "ارض", "سكني/زراعي", 37, 23),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => form_store( ))); },

                child:
                other_templates.property_choices(height()/6.3, width()/1.3, "متجر", "", 37, 23),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => form_building( ))); },

                child:
                other_templates.property_choices(height()/6.3, width()/1.3, "مبنى", "سكنية/تجارية: عمارات الخ", 37, 23),
              ),

            ],
          ),
        )

    );
  }
  height(){
    double height= MediaQuery.of(context).size.height;
    return height;
  }
  width(){
    double width= MediaQuery.of(context).size.width;
    return width;
  }
}
