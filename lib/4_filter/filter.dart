import 'dart:convert';
import 'package:diary/templates/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:diary/templates/other_templates.dart';
import '../templates/post_templates.dart';

class fliter extends StatefulWidget {
  @override
  State<fliter> createState() => _fliterState();
}

class _fliterState extends State<fliter> {
  bool frent = false;
  bool fbuy = false;
  bool house = false;
  bool department = false;
  bool vila = false;
  bool mushtamal = false;
  bool residential_land = false;
  bool agrarian_land = false;
  bool residential_building = false;
  bool commercial_building = false;
  bool store = false;

  post_templates _post_templates = post_templates();
  @override
  final bc = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x23494A),
      Colors.white,
    ],
  );
  final List<Map<String, dynamic>> _all = [
    {"sale_or_rent": "", "type_build": "", "name": ""}
  ];
  Future getData() async {
    var url = Uri.parse("http://localhost:4000");
    Response response = await get(url);
    String body = response.body;
    List<dynamic> list1 = json.decode(body);
    _all.clear();

    for (int i = 0; i < list1.length; i++) {
      _all.add(list1[i]["sale_or_rent"]);
      _all.add(list1[i]["type_build"]);
      _all.add(list1[i]["name"]);
    }
  }

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _all;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _all;
    } else {
      results = _all
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.arrow_back_ios_new,
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF23494A),
                Color(0xFFBFFFC7),
              ],
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: SizedBox(
                              height: 50,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  onChanged: (value) => _runFilter(value),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(20),
                                      filled: false,
                                      border: InputBorder.none,
                                      hintText: "بحث عن ",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11,
                      width() / 2.7,
                      35,
                      "استئجار",
                      frent,
                    ),
                    onTap: () {
                      setState(() {
                        frent = !frent;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11,
                      width() / 2.7,
                      35,
                      "شراء",
                      fbuy,
                    ),
                    onTap: () {
                      setState(() {
                        fbuy = !fbuy;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11.5,
                      width() / 5.7,
                      27,
                      "متجر",
                      house,
                    ),
                    onTap: () {
                      setState(() {
                        house = !house;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11.5,
                      width() / 5.7,
                      27,
                      "فيلا",
                      house,
                    ),
                    onTap: () {
                      setState(() {
                        house = !house;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11.5,
                      width() / 5.7,
                      23,
                      "مشتمل",
                      mushtamal,
                    ),
                    onTap: () {
                      setState(() {
                        mushtamal = !mushtamal;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11.5,
                      width() / 5.7,
                      27,
                      "شقة",
                      department,
                    ),
                    onTap: () {
                      setState(() {
                        department = !department;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 11.5,
                      width() / 5.7,
                      27,
                      "بيت",
                      house,
                    ),
                    onTap: () {
                      setState(() {
                        house = !house;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 7.9,
                      width() / 4.7,
                      27,
                      "مبنى  تجاري  ",
                      commercial_building,
                    ),
                    onTap: () {
                      setState(() {
                        commercial_building = !commercial_building;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 7.9,
                      width() / 4.7,
                      27,
                      "مبنى  سكني  ",
                      residential_building,
                    ),
                    onTap: () {
                      setState(() {
                        residential_building = !residential_building;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 7.9,
                      width() / 4.7,
                      27,
                      "ارض  زراعية  ",
                      agrarian_land,
                    ),
                    onTap: () {
                      setState(() {
                        agrarian_land = !agrarian_land;
                      });
                    },
                  ),
                  GestureDetector(
                    child: other_templates.selsection(
                      height() / 7.9,
                      width() / 4.7,
                      27,
                      "ارض  سكنية  ",
                      residential_land,
                    ),
                    onTap: () {
                      setState(() {
                        residential_land = !residential_land;
                      });
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 17),
                width: MediaQuery.of(context).size.width / 1.05,
                alignment: Alignment.center,
                child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, pos) {
                      return Center(
                        child:Column(
                          children: [

                            post_templates.post_residential(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "مشتمل", "بيع",
                              "بغداد", "الدورة",'www.google.org',
                              150,10,15, 12, "مليون د.ع",
                              1, 2, 3, 4, true, false,
                              "مكتب النور للعقار", "07700000",
                              "property_describtion", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_land(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "سكنية","بغداد", "العامرية", 'www.google.com',
                              30,"دونم",15,10, 120, "مليون د.ع",
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_store(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "بيع", "البصرة", "شارع اجزائر", 'www.google.org',
                              "300","10","30", "32.0", "مليون د.ع",
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true, ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_buildings(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "تجاري", "للبيع", "البصرة", "الجزائر",'www.google.com',
                              150,10,15, 12, "مليون د.ع",
                              3,
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),


                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  height() {
    var height;
    return height = MediaQuery.of(context).size.height;
  }

  width() {
    var width;
    return width = MediaQuery.of(context).size.width;
  }
}
