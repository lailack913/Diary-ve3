import 'package:diary/6_dashboard/payment/free_trial.dart';
import 'package:diary/6_dashboard/payment/pay_for_post.dart';
import 'package:diary/6_dashboard/payment/set_subscribe.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';

class payment_type extends StatefulWidget {
  const payment_type({Key? key}) : super(key: key);

  @override
  State<payment_type> createState() => _payment_typeState();
}

class _payment_typeState extends State<payment_type> {
  other_templates _other_templates = other_templates();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
      body:
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(37, 17, 37, 10),
          child:
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("اهلا بك",style: TextStyle(fontSize: 37),),
                  Text(":لإضافة عقار عليك اختيار احد الخيارات التالية",style: TextStyle(fontSize: 19),)
                ],
              ),
              SizedBox(height: 15,),

              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => free_trail()));
                },
                child:
                other_templates.choice_title_script(height()/5.3,width()/1.2,
                    "التجربة مجانا", "التجربة مجانا التجربة مجانا التجربة مجانا التجربة مجانا التجربة مجانا التجربة مجانا التجربة مجانا",
                    27, 17),
              ),

              SizedBox(height: 15,),

              GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder:(context) => set_subscribe( )));
                  },
                  child:
                  other_templates.choice_title_script(height()/5.3, width()/1.2,
                      "اشتراك شهري او سنوي ", "اشتراك شهري او سنوياشتراك شهري او سنوياشتراك شهري او سنوياشتراك شهري او سنوي",
                      27, 17)
              ),

              SizedBox(height: 15,),

              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder:(context) => pay_for_post( )));
                },
                child:
                other_templates.choice_title_script(height()/5.3, width()/1.2,
                    "الدفع للعقار الواحد", "الدفع للعقار الواحدالدفع للعقار الواحدالدفع للعقار الواحدالدفع للعقار الواحد  ",
                    27, 17),
              ),

            ],
          )

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
