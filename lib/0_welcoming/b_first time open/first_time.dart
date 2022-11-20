import 'package:diary/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'items_model.dart';
import 'colors.dart';
import 'components.dart';

class first_time extends StatefulWidget {
  const first_time({Key? key}) : super(key: key);

  @override
  State<first_time> createState() => _first_timeState();
}

class _first_timeState extends State<first_time> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animation(
      int index,
      int delay,
      Widget child,
      ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [

                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: listOfItems.length,
                    onPageChanged: (newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Column(
                          children: [
                            /// IMG
                            Container(

                              margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                              width: size.width,
                              height: size.height / 2.5,
                              child: animation(
                                  index,
                                  100,
                                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIX5PrGjcl9_3tL3e98EVo06IfDOqFCr-7ksYo7v4TL89yC_inb4Mgu9wOXUqNR4iteK4&usqp=CAU")
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.only(top: 25, bottom: 15),
                                child: animation(
                                  index,
                                  300,
                                  Text(
                                    listOfItems[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30
                                    ),
                                  ),
                                )),


                            animation(
                              index,
                              500,
                              Text(
                                listOfItems[index].subTitle,
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                    fontSize: 10
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: listOfItems.length,
                        effect: const ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          expansionFactor: 3.8,
                          dotColor: Colors.grey,
                          activeDotColor: MyColors.btnColor,
                        ),
                        onDotClicked: (newIndex) {
                          setState(() {
                            currentIndex = newIndex;
                            pageController.animateToPage(newIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          });
                        },
                      ),
                      currentIndex == 2


                          ? GetStartBtn(size: size, textTheme: textTheme)


                          : SkipBtn(
                        size: size,
                        textTheme: textTheme,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder:(context) => bottomN( )));
                          setState(() {
                            pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}