import 'package:diary/2_account/b_login/login.dart';
import 'package:diary/2_account/e_account%20details/information%20section/account_info.dart';
import 'package:diary/2_account/e_account%20details/information%20section/my_deals.dart';
import 'package:diary/2_account/e_account%20details/information%20section/my_properties.dart';
import 'package:diary/5_saved/saved.dart';
import 'package:diary/6_dashboard/payment/payment_type.dart';
import 'package:flutter/material.dart';
import 'package:diary/1_home/home_page.dart';
import '../dataa.dart';

class bottomN extends StatefulWidget {

  @override
  State<bottomN> createState() => _bottomNState();
}

class _bottomNState extends State<bottomN> {

  var cureenrIndex = 3;

  Widget callPage(){

    return _widgetOptions[cureenrIndex];
  }

  static List<Widget> _widgetOptions = <Widget>[

    my_properties(),
    subscription_state ?  saved() : payment_type(),
    saved(),
    home_page(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.my_library_books_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            label: 'save',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.home),
            label: 'home',
          ),



        ],
        onTap: (v){
          setState(() {
            cureenrIndex = v;
          });
        },
      ),
      body: callPage(),
    );
  }
}
