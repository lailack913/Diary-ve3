import 'package:flutter/material.dart';
import 'dart:async';
import 'package:diary/templates/other_templates.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class view_residetial extends StatefulWidget {

  final String  residential_type2;
  final  String sell_rent2;
  final String  city2;
  final String  district2;
  final String location_link2;
  final int area2;
  final double interface2;
  final double depth2;
  final double price2;
  final String price_type2;
  final  int room2;
  final int hall2;
  final int kitchen2;
  final int bathroom2;
  final bool garden2;
  final bool carage2;
  final String owner2;
  final String owner_phone2;
  final String property_describtion2;
   bool property_state2;


  view_residetial ({

    required this.residential_type2,
    required this.sell_rent2,
    required this.city2,
    required this.district2,
    required this.location_link2, /// must be between single quotations '' not double ""
    required this.area2,
    required this.interface2,
    required this.depth2,
    required this.price2,
    required this.price_type2,
    required this.room2,
    required this.hall2,
    required this.kitchen2,
    required this.bathroom2,
    required this.garden2,
    required this.carage2,
    required this.owner2,
    required this.owner_phone2,
    required this.property_describtion2,
    required this.property_state2,

  });

  @override
  State<view_residetial> createState() => _view_residetialState();
}

class _view_residetialState extends State<view_residetial> {

  Future<void>? _launched;

  @override

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {


    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
    Uri(scheme: 'https', host: widget.location_link2, );  /// <<<<<<<<<<<<<<<!!! here will be the location link
    ///
    ///
    ///
    ///


    return Scaffold(
      body:
        SafeArea(
          child: Container(
            child: ListView(
              children: [

                Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          color: Colors.blueAccent,
                        ),
                        Container(
                          color: Colors.brown,
                        ),
                        Container(
                          color: Colors.green,
                        )
                      ],
                      options:
                      CarouselOptions(
                        height: other_templates.height(context)/3,
                        aspectRatio: 16/9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: true,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 7),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        scrollDirection: Axis.horizontal,
                      ),

                    ),

                    Positioned(
                      top: 13,
                      right: 10,
                      child: Container(
                          width: other_templates.width(context)/9,
                          height: other_templates.height(context)/15,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(13),
                              ),
                          child: Center(
                            child:  Icon(
                              Icons.bookmark_border,
                              color: Colors.grey,
                              size: 45,
                            ),
                          )
                      ),
                    )
                  ],
                ),
                

                Container(
                  padding: EdgeInsets.fromLTRB(0, 33, 19, 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.residential_type2+"-"+widget.sell_rent2,style: TextStyle(fontSize: 27),),
                      Text(widget.city2+"-"+widget.district2,style: TextStyle(fontSize: 27),),
                      Text(" السعر: ${widget.price2}"+widget.price_type2,style: TextStyle(fontSize: 27),),
                      Text("المساحة: ${widget.area2} م²", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          Text("النزال: ${widget.interface2} م ", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                          SizedBox(width: other_templates.width(context)/20,),
                          Text("الواجهة: ${widget.depth2} م ", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    rooms("حمام", widget.bathroom2, Icon(Icons.bathtub_outlined, size: 30,)),
                    rooms("غرف", widget.room2, Icon(Icons.bed_outlined, size: 37,)),

                  ],
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    rooms("مطبخ", widget.kitchen2, Icon(Icons.soup_kitchen_outlined, size: 37,)),
                    rooms("صالة", widget.hall2, Icon(Icons.living_outlined, size: 37,)),
                  ],
                ),

                Padding(padding:EdgeInsets.fromLTRB(0, 17, 37, 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("حديقة", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                          SizedBox(width: other_templates.width(context)/20,),
                          Icon( widget.garden2 ?  Icons.check:Icons.close,),
                        ],
                      ),
                      SizedBox(width: other_templates.width(context)/5,),
                      Row(
                        children: [
                          Text("كراج", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),),
                          SizedBox(width: other_templates.width(context)/20,),
                          Icon( widget.carage2 ?  Icons.check:Icons.close,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container( height: 7, color: Colors.grey.shade300,),
                Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Link(
                      uri: Uri.parse(
                          'https://pub.dev/documentation/url_launcher/latest/link/link-library.html'),
                      target: LinkTarget.blank,
                      builder: (BuildContext ctx, FollowLink? openLink) {
                        return TextButton.icon(
                          onPressed: () => setState(() {
                            _launched = _launchInBrowser(toLaunch);
                          }),
                          label: const Text('رابط الموقع',style: TextStyle(fontSize:27),),
                          icon: const Icon(Icons.read_more,color: Colors.white,),
                        );
                      },
                    ),
                    Image(
                        height: 70, width: 70,
                        image: NetworkImage("https://cdn.pixabay.com/photo/2016/03/22/04/23/map-1272165_960_720.png")),

                    Padding(padding: EdgeInsets.all(16.0)),
                    FutureBuilder<void>(future: _launched, builder: _launchStatus),
                  ],
                ),
                ),
                Container( height: 7, color: Colors.grey.shade300,),
                    Padding(padding: EdgeInsets.fromLTRB(0, 17, 37, 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(":معلومات اخرى",style: TextStyle(fontSize:27),),
                          Text(" معلومات اخرى معلومات اخرى معلومات اخرى معلومات اخرى:معلومات اخرى",style: TextStyle(fontSize:17),textAlign: TextAlign.right ,)
                        ],
                      ),
                    ),
                Container( height: 7, color: Colors.grey.shade300,),
                Padding(padding: EdgeInsets.fromLTRB(0, 17, 37, 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("ًالمالك: "+widget.owner2,style: TextStyle(fontSize:23),),
                      Text("رقم الهاتف: "+widget.owner_phone2,style: TextStyle(fontSize:23),),

                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: other_templates.height(context)/13.5,
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text("حجز",style: TextStyle(fontSize: 29),) ,
                    ),
                  ),
                  onTap: (){
                    widget.property_state2 = ! widget.property_state2;
                  } ,
                )

              ],
            )
          ),
        )
    );
  }
  
  
  
  rooms(String  type, int number, Icon icona
      ){
    return Container(
      height: other_templates.height(context)/15,
      width: other_templates.width(context)/2.35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(11))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$type",style: TextStyle(fontSize: 30),),
          Text("$number",style: TextStyle(fontSize: 30),),
          icona,
        ],
      ),
    );
  }
}
