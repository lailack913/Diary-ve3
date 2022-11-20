import 'package:diary/6_dashboard/payment/how_cash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../templates/other_templates.dart';

class set_subscribe extends StatefulWidget {
  const set_subscribe({Key? key}) : super(key: key);

  @override
  State<set_subscribe> createState() => _set_subscribeState();
}

class _set_subscribeState extends State<set_subscribe> {
  Future sendstest(stest) async{
    var url = Uri.parse("http://localhost:4000");
    Map<String, String> headers = {
      "Contect-type":"application/json",
      "Access-Control-Allow-Origin":"*"
    };

    String json =
    '{"stest": STEST (month_of_subscribe)}';
    Response response = await post(
    url,
    headers: headers,
    body: json,
    );
    String body1 = response.body;
  }


  other_templates _other_templates = other_templates();
  int month_of_subscribe = 1;
  int monthe_price = 700000;
  int year_of_subscribe = 1;
  int year_price = 6;
  int total_price_year=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),

    body:
    DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children:
        <Widget>[
          Container(
            child: TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'سنوي'),
                Tab(text: 'شهري'),
              ],
            ),
          ),

          Container(
              height: height()/1.3, //height of TabBarView
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
              child: TabBarView(children: <Widget>[

                Container(
                    padding: EdgeInsets.fromLTRB(30, 19, 30, 0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child:Row(
                                    children: [
                                      GestureDetector(
                                        child:  Icon( Icons.add  ),
                                        onTap: (){{ setState(() { year_of_subscribe++;
                                        print(year_of_subscribe);}); };},
                                      ),
                                      SizedBox(width: 7,),
                                      Container(height: 19, width:3, color: Colors.grey,),
                                      SizedBox(width: 7,),
                                      Text("$year_of_subscribe سنة "),
                                      SizedBox(width: 7,),
                                      Container(height: 19, width:3, color: Colors.grey,),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5 ),
                                        child: GestureDetector(
                                          child: Icon( Icons.minimize_outlined  ),
                                          onTap: (){
                                            { setState(() {
                                            if (year_of_subscribe>1) year_of_subscribe--;
                                            total_price_year= calculation_tyear( year_of_subscribe, year_price);

                                            }
                                            );
                                            };
                                            },
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all( color: Colors.grey ,width: 1.5)
                                  ),
                                ),
                                SizedBox(width: 17,),
                                Text("كم سنة تود الاشتراك؟",style: TextStyle(fontSize: 19),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${total_price_year}"),
                                Text("   :المبلغ النهائي",style: TextStyle(fontSize: 19),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(":اختر طريقة الدفع",style: TextStyle(fontSize: 19),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),

                        GestureDetector(
                          onTap: (){ Navigator.of(context)
                              .push(MaterialPageRoute(builder:(context) => how_cash( )));
                            print(year_of_subscribe);},
                          child:
                          other_templates.choice_title_script(height()/5.3,width()/1.2,
                              "نقدا", "نقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقد نقدا نقدا نقدا",
                              27, 17),
                        ),

                        SizedBox(height: 15,),

                        GestureDetector(
                            onTap: (){ },
                            child:
                            other_templates.choice_title_script(height()/5.3, width()/1.2,
                                "ماستر او فيزا ", "ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ",
                                27, 17)
                        ),


                      ],
                    )
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(30, 19, 30, 0),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child:Row(
                                  children: [
                                    GestureDetector(
                                      child:  Icon( Icons.add  ),

                                      onTap: (){{ setState(() { month_of_subscribe++; }); };},
                                    ),
                                    SizedBox(width: 7,),
                                    Container(height: 19, width:3, color: Colors.grey,),
                                    SizedBox(width: 7,),
                                    Text("$month_of_subscribe شهرا "),
                                    SizedBox(width: 7,),
                                    Container(height: 19, width:3, color: Colors.grey,),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5 ),
                                      child: GestureDetector(
                                        child: Icon( Icons.minimize_outlined  ),
                                        onTap: (){{ setState(() {if (month_of_subscribe>1) month_of_subscribe--; }); };},
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all( color: Colors.grey ,width: 1.5)
                                ),
                              ),
                              SizedBox(width: 17,),
                              Text("كم شهرا تود الاشتراك؟",style: TextStyle(fontSize: 19),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              calculation_tmonth( month_of_subscribe , monthe_price),
                              Text("   :المبلغ النهائي",style: TextStyle(fontSize: 19),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(":اختر طريقة الدفع",style: TextStyle(fontSize: 19),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 9,),

                      GestureDetector(
                        onTap: (){ },
                        child:
                        other_templates.choice_title_script(height()/5.5,width()/1.2,
                            "نقدا", "نقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقدانقد نقدا نقدا نقدا",
                            27, 17),
                      ),

                      SizedBox(height: 9,),

                      GestureDetector(
                          onTap: (){ },
                          child:
                          other_templates.choice_title_script(height()/5.5, width()/1.2,
                              "ماستر او فيزا ", "ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ماستر او فيزا ",
                              27, 17)
                      ),


                    ],
                  )
                ),

              ])
          )
        ]
        )
    ),
    );
  }
  calculation_tmonth( int m, int n) {
    int total_price_monthly;
    total_price_monthly=m*n;

    return Row(
      children: [
        Text("  د.ع ",
          style: TextStyle(color: Color(0xff000000),
            fontWeight: FontWeight.bold), ),
        Text("$total_price_monthly",
          style: TextStyle(color: Color(0xff000000), fontWeight:
        FontWeight.bold),),
      ],
    ) ;
  }
  calculation_tyear( int m, int n) {
    int total_price_year;
    total_price_year=m*n;

    return Row(
      children: [
        Text(" مليون د.ع ",
          style: TextStyle(color: Color(0xff000000),
              fontWeight: FontWeight.bold), ),
        Text("$total_price_year",
          style: TextStyle(color: Color(0xff000000), fontWeight:
          FontWeight.bold),),
      ],
    ) ;
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
