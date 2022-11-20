import 'package:flutter/material.dart';

import '../../templates/other_templates.dart';
import 'how_cash.dart';

class pay_for_post extends StatefulWidget {
  const pay_for_post({Key? key}) : super(key: key);

  @override
  State<pay_for_post> createState() => _pay_for_postState();
}

class _pay_for_postState extends State<pay_for_post> {
  other_templates _other_templates = other_templates();
  int monthes_post= 1;
  int post_price = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),

    body:
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
                            onTap: (){{ setState(() { monthes_post++; }); };},
                          ),
                          SizedBox(width: 7,),
                          Container(height: 19, width:3, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text("$monthes_post شهرا "),
                          SizedBox(width: 7,),
                          Container(height: 19, width:3, color: Colors.grey,),
                          Container(
                            padding: EdgeInsets.only(bottom: 5 ),
                            child: GestureDetector(
                              child: Icon( Icons.minimize_outlined  ),
                              onTap: (){{ setState(() {if (monthes_post>1) monthes_post--; }); };},
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
                    calculation_tmonth( monthes_post , post_price),
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
              onTap: (){ },
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
  height(){
    double height= MediaQuery.of(context).size.height;
    return height;
  }
  width(){
    double width= MediaQuery.of(context).size.width;
    return width;
  }
}
