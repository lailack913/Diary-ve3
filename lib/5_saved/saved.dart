import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';

import '../templates/post_templates.dart';

class saved extends StatefulWidget {
  const saved({Key? key}) : super(key: key);

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  post_templates _post_templates = post_templates();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            child: Icon(Icons.arrow_back),
          onTap: (){
              Navigator.of(context).pop();
          },
        ),
        backgroundColor: Diary_appbar_color,
      ),

      body:
       SafeArea(
         child:
         SingleChildScrollView(
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Padding(
                     padding: EdgeInsets.fromLTRB(0, 17, 23, 13),
                     child: Text(
                       "العقارات المحفوظة",
                       style: TextStyle(
                         color: Colors.teal,
                         fontWeight: FontWeight.bold,
                         fontSize: 27,
                       ),
                     ),
                   ),
                 ],
               ),
               Container(
                 width: other_templates.width(context),
                 alignment: Alignment.center,
                 child:   Container(
                   width: MediaQuery.of(context).size.width/1.07,
                   alignment: Alignment.center,
                   child: ListView.builder(
                       itemCount: 1,
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context, pos){
                         return
                           Center(
                             child:Column(
                               children: [

                                 post_templates.post_residential(context,
                                   'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                   "مشتمل", "بيع",
                                   "بغداد", "الدورة",'www.google.org',
                                   150,10,15, 12, "مليون د.ع",
                                   1, 2, 3, 4, true, false,
                                   "مكتب النور للعقار", "07700000",
                                   "property_describtion", true,
                                 ),

                                 SizedBox(height: MediaQuery.of(context).size.height/17,),

                                 post_templates.post_land(context,
                                   'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                   "سكنية","بغداد", "العامرية", 'www.google.com',
                                   30,"دونم",15,10, 120, "مليون د.ع",
                                   "مكتب السلطان للعقار", "07700000",
                                   "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                                 ),

                                 SizedBox(height: MediaQuery.of(context).size.height/17,),

                                 post_templates.post_store(context,
                                   'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                    "بيع", "البصرة", "شارع اجزائر", 'www.google.org',
                                   "300","10","30", "32.0", "مليون د.ع",
                                   "مكتب السلطان للعقار", "07700000",
                                   "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true, ),

                                 SizedBox(height: MediaQuery.of(context).size.height/17,),

                                 post_templates.post_buildings(context,
                                   'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                   "تجاري", "للبيع", "البصرة", "الجزائر",'www.google.com',
                                   150,10,15, 12, "مليون د.ع",
                                   3,
                                   "مكتب السلطان للعقار", "07700000",
                                   "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                                 ),

                                 SizedBox(height: MediaQuery.of(context).size.height/17,),


                               ],
                             )
                           );
                       }),
                 ),
               ),
             ],
           ),
         ),
       )
    );
  }
}
