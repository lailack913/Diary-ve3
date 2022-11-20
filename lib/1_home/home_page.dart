import 'package:diary/2_account/b_login/login.dart';
import 'package:diary/dataa.dart';
import 'package:flutter/material.dart';

// import packages
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:responsive_sizer/responsive_sizer.dart';

//import dart files
import 'package:diary/templates/other_templates.dart';
import 'package:diary/1_home/Carousel.dart';
import '../2_account/e_account details/information section/account_info.dart';
import '../templates/post_templates.dart';
import '../4_filter/filter.dart';
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  post_templates _post_templates = post_templates();
  var litems = ["1","2","Third","4"];
  var building_typeitems=[];
  var building_sell_rentitems = [];
  var building_cityitems = [];
  var building_districtitems = [];
  var building_location_linkitems = [];
  var building_areaitems = [];
  var building_interfaceitems=[];
  var building_depthitems=[];

  var building_priceitems = [];
  var building_price_typeitems = [];
  var building_floorsitems = [];
  var building_descriptionitems=[];
  var property_stateitems=[];
  Future getData() async{
    var url=Uri.parse("http://localhost:4000");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    List<dynamic> list2=json.decode(body);

    print(list1);
    litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      //litems.add(list1[i]["sale_or_rent"]);
      building_typeitems.add(list1[i]["building_type"]);
      building_sell_rentitems.add(list1[i]["building_sell_rent"]);
      building_cityitems.add(list1[i]["building_city"]);
      building_districtitems.add(list1[i]["building_district"]);
      building_location_linkitems.add(list1[i]["building_location_link"]);
      building_areaitems.add(list1[i]["building_area"]);
      building_interfaceitems.add(list1[i]["building_interface"]);
      building_depthitems.add(list1[i]["building_depth"]);

      building_priceitems.add(list1[i]["building_price"]);
      building_price_typeitems.add(list1[i]["building_price_type"]);
      building_floorsitems.add(list1[i]["building_floors"]);
      building_descriptionitems.add(list1[i]["building_description"]);
      property_stateitems.add(list1[i]["property_state"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }
  @override



  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
    ];


    return Scaffold(
        body: SafeArea(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(1.w, 7.w, 3.w, 3.w),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade50,
                                  offset: Offset(0, 9.w),
                                  blurRadius: 6,
                                  spreadRadius: 3
                              )
                            ]
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.account_circle_outlined, size: 27.sp,
                                color: main_color,),
                              onPressed: () {
                                Navigator.of(context).
                                push(MaterialPageRoute(builder: (context) =>
                                Login_state
                                    ? account_info()
                                    : login(),));
                              },
                            ),

                            IconButton(
                              icon: Icon(CupertinoIcons.line_horizontal_3_decrease,
                                size: 27.sp, color: main_color,),
                              onPressed: () {

                              },
                            )
                          ],
                        )
                    ),

                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 13.w,
                            height: 6.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()
                            ),
                            child: Icon(Icons.search),
                          ),

                          SizedBox(width: 3.w,),

                          Expanded(
                              child: SizedBox(
                                  height: 6.h,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              2.w, 1.h, 2.w, 2.h),
                                          filled: false,
                                          border: InputBorder.none,
                                          hintText: "بحث عن ",
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      ),
                                    ),)
                              )),
                        ],
                      ),
                    ),

                    CarouselWithDotsPage(imgList: imgList),

                    SizedBox(height: 1.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 11, 23, 11),
                          child: Text(
                            "المعروض",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 21.sp,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 95.w,
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, pos) {
                            return
                              Column(
                                children: [
                                  post_templates.post_buildings(context,'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
                                      ,building_price_typeitems[index], building_sell_rentitems[index],  building_cityitems[index], building_districtitems[index], building_location_linkitems[index], building_areaitems[index], building_interfaceitems[index], building_depthitems[index], building_priceitems[index], building_price_typeitems[index], building_floorsitems[index], "owner", "owner_phone", building_depthitems[index], building_priceitems[index]),
                                  SizedBox(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 17,),

                                  post_templates.post_store(
                                    context,
                                    'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                    "بيع",
                                    "البصرة",
                                    "شارع اجزائر",
                                    'www.google.org',
                                    "300",
                                    "10",
                                    "30",
                                    "32.0",
                                    "مليون د.ع",
                                    "مكتب السلطان للعقار",
                                    "07700000",
                                    "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا",
                                    true,),

                                  SizedBox(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 17,),

                                  post_templates.post_buildings(
                                    context,
                                    'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                    "تجاري",
                                    "للبيع",
                                    "البصرة",
                                    "الجزائر",
                                    'www.google.com',
                                    150,
                                    10,
                                    15,
                                    12,
                                    "مليون د.ع",
                                    3,
                                    "مكتب السلطان للعقار",
                                    "07700000",
                                    "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا",
                                    true,
                                  ),

                                  SizedBox(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 17,),


                                ],
                              );
                          }),
                    ),
                  ],
                );
              }
          ),
        )
    );
  }
}
