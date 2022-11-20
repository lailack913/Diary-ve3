import 'package:flutter/material.dart';
//import packages
import 'package:responsive_sizer/responsive_sizer.dart';

//import dart files
import 'package:diary/templates/other_templates.dart';
import 'package:diary/templates/view_building.dart';
import 'package:diary/templates/view_land.dart';
import 'package:diary/templates/view_residential.dart';
import 'package:diary/templates/view_store.dart';

 class post_templates   {
// make a function to build the posts of residential

   static post_residential(var context,String main_img,
       String residential_type, String sell_rent,
       String city,String district, String location_link,
       int area, double interface, double depth,
       double price, String price_type,
       int room,int hall, int kitchen,int bathroom,
       bool garden, bool carage,
       String owner, String owner_phone,
       String property_describtion,
       bool property_state,
       )
   {
     return  GestureDetector(
       child: Container(
         height: 37.h,
         decoration: BoxDecoration(
             border: Border.all(color: Colors.grey, width: 2),
             borderRadius: BorderRadius.all(Radius.circular(19))
         ),
         child: Column(
           children: [

             Stack(
               children: [
                 Container(
                     height: 21.h,
                     decoration: BoxDecoration(
                         color: Colors.grey,
                         image: DecorationImage(
                           image: NetworkImage("$main_img",),
                           fit: BoxFit.cover,
                         ),
                         borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                     )
                 ),
                 Positioned(
                   top: 6,
                   right: 10,
                   child: Container(
                       padding: EdgeInsets.only(left: 0),
                       width: 10.w, height: 5.h,
                       decoration: BoxDecoration(
                           color: Colors.white.withOpacity(0.7),
                           borderRadius: BorderRadius.circular(13),
                           boxShadow: [
                           ]
                       ),
                       child:
                       Icon( Icons.bookmark_border, color: main_color, size: 23.sp,)
                   ),
                 )
               ],
             ),

             Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("المساحة:$area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   Text("$residential_type-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                 ],
               ),
             ),

             Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 1.h),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                 ],
               ),
             ),
             Padding(padding: EdgeInsets.fromLTRB(1.w, 0, 2.w, 1.h),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Row(
                     children: [
                       Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                       Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                     ],
                   ),

                   Container(
                     height: 4.5.h, width: 18.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("حمام",style: TextStyle(fontSize: 16.5.sp),),
                         Text("$bathroom",style: TextStyle(fontSize: 16.5.sp),),
                         Icon(Icons.bathtub_outlined, size: 17.sp,)
                       ],
                     ),
                   ),
                   Container(
                     height:  4.5.h, width: 18.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("مطبخ",style: TextStyle(fontSize: 16.5.sp),),
                         Text("$kitchen",style: TextStyle(fontSize: 16.5.sp),),
                         Icon(Icons.soup_kitchen_outlined, size: 17.sp,)
                       ],
                     ),
                   ),
                   Container(
                     height:  4.5.h, width: 18.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("صالة",style: TextStyle(fontSize: 16.5.sp),),
                         Text("$hall",style: TextStyle(fontSize: 16.5.sp),),
                         Icon(Icons.living_outlined, size: 17.sp,)
                       ],
                     ),
                   ),
                   Container(
                     height:  4.5.h, width: 18.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("غرف",style: TextStyle(fontSize: 16.5.sp),),
                         Text("$room",style: TextStyle(fontSize: 16.5.sp),),
                         Icon(Icons.bed_rounded, size: 19.sp,)
                       ],
                     ),
                   ),
                 ],
               ),
             ),

           ],
         ),
       ),
       onTap: (){
         Navigator.of(context).
         push(MaterialPageRoute(builder: (context) => view_residetial(
             residential_type2: residential_type,
             sell_rent2: sell_rent,
             city2: city,
             district2: district,
             area2: area,
             interface2: interface,
             depth2: depth,
             price2: price,
             price_type2: price_type,
             room2: room,
             hall2: hall,
             kitchen2: kitchen,
             bathroom2: bathroom,
             garden2: garden, carage2: carage,
             owner2: owner, owner_phone2: owner_phone,
             property_describtion2: property_describtion,
             property_state2: property_state,
             location_link2: location_link,
         )));
       },
     );


   }

   // make a function to build the posts of store

   static post_store(var context,String main_img,
       String sell_rent,
       String city,String district, String location_link,
       String area, String interface, String depth,
       String price,String price_type,
       String owner, String owner_phone, String property_describtion,
       bool property_state,
       )
   {
     return GestureDetector(
         child: Container(
           height: 37.h,
           decoration: BoxDecoration(
               border: Border.all(color: Colors.grey, width: 2),
               borderRadius: BorderRadius.all(Radius.circular(19))
           ),
           child: Column(
             children: [

               Stack(
                 children: [
                   Container(
                       height: 21.h,
                       decoration: BoxDecoration(
                           color: Colors.grey,
                           image: DecorationImage(
                             image: NetworkImage("$main_img",),
                             fit: BoxFit.cover,
                           ),
                           borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                       )
                   ),
                   Positioned(
                     top: 6,
                     right: 10,
                     child: Container(
                         padding: EdgeInsets.only(left: 0),
                         width: 10.w, height: 5.h,
                         decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.7),
                             borderRadius: BorderRadius.circular(13),
                             boxShadow: [
                             ]
                         ),
                         child:
                         Icon( Icons.bookmark_border, color: main_color, size: 23.sp,)
                     ),
                   )
                 ],
               ),

               Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
                 child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("المساحة:$area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     Text("متجر-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                   ],
                 ),
               ),
               Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                 child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   ],
                 ),
               ),
               Padding(padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 0),
                 child:
                 Row(
                   children: [
                     Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                     Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                   ],
                 ),
               )


             ],
           ),
         ),
         onTap:(){
           Navigator.of(context).
           push(MaterialPageRoute(builder: (context) => view_store(
             sell_rent2: sell_rent,
             city2: city, district2: district,
             area2: area, interface2: interface, depth2: depth,
             location_link2: location_link,
             price2: price, price_type2: price_type,
             owner2: owner, owner_phone2: owner_phone,
             property_describtion2: property_describtion,
             property_state2: property_state,
           )
           )
           );
         }
     );

   }


   // make a function to build the posts of land
  static post_land(var context, String main_img,
      String land_type, String city, String district, String location_link,
      int area, String area_type, double interface, double depth,
      double price, String price_type,
      String owner, String owner_phone, String property_describtion,
      bool property_state,
      )
  {

    return GestureDetector(
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [
            // img
            Stack(
              children: [
                Container(
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("$main_img",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 10.w, height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: main_color, size: 23.sp,)
                  ),
                )
              ],
            ),

            // land type & area
            Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$area م² ", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                  Text("ارض-$land_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $price $price_type", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                  Text("$city-$district", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0.5.h),
              child:
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                  Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>  view_land(
            land_type2: land_type,
            city2: city,
            district2: district,
            location_link2: location_link,
            area2: area,
            interface2: interface,
            depth2: depth,
            area_type2: area_type,
            price2: price,
            price_type2: price_type,
            owner2: owner,
            owner_phone2: owner_phone,
            property_describtion2: property_describtion,
            property_state2: property_state
         )
         )
        );
      },
    );
  }

// make a function to build the posts of buildings

  static post_buildings(var context, String main_img,
      String building_type, String sell_rent,
      String city,String district, String location_link,
      int area, double interface, double depth,
      double price, String price_type,
      int floors,
      String owner, String owner_phone,
      String property_describtion,
      bool property_state,
      )
  {
    return GestureDetector(
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("$main_img",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 10.w, height: 5.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: main_color, size: 23.sp,)
                  ),
                )
              ],
            ),

            Padding(padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$area م² ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("مبنى-$building_type-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new, size: 17.sp,),
                      Text("المزيد ", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 4.5.h, width: 25.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("طابق", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                        Text("$floors", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                        Icon(Icons.layers, size: 19.sp,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>   view_building(
            building_type2: building_type,
            sell_rent2: sell_rent,
            city2: city, district2: district, location_link2: location_link,
            area2: area, interface2: interface, depth2: depth,
            price2: price, price_type2: price_type,
            floors2: floors,
            owner2: owner, owner_phone2: owner_phone,
            property_describtion2: property_describtion,
            property_state2: property_state)
          )
        );
      },
    );
  }
}
