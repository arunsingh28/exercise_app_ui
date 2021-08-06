import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/svg.dart';

import './widgets/category_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        height: 50,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BottomNavigation(
                title: 'Today',
                imgSrc: "assets/icons/calendar.svg",
              ),
              BottomNavigation(
                title: 'All Exercises',
                imgSrc: "assets/icons/pilates_gpdb.svg",
              ),
              BottomNavigation(
                title: 'Setting',
                imgSrc: "assets/icons/Settings.svg",
              ),
            ]),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xfff5ceb8),
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png")),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 52,
                      decoration: BoxDecoration(
                          color: Color(0xfff2bea1), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    'Good Morning \nArun',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.8)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          icon: SvgPicture.asset("assets/icons/search.svg")),
                    ),
                  ),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(
                        title: "Diet Recommendation",
                        svgSrc: "assets/icons/Hamburger.svg",
                        press: () => print("Tapped!"),
                      ),
                      CategoryCard(
                        title: "Kegel Excrecises",
                        svgSrc: "assets/icons/Excrecises.svg",
                        press: () => print("Tapped!"),
                      ),
                      CategoryCard(
                        title: "Meditation",
                        svgSrc: "assets/icons/Meditation.svg",
                        press: () => print("Tapped!"),
                      ),
                      CategoryCard(
                        title: "Yoga",
                        svgSrc: "assets/icons/yoga.svg",
                        press: () => print("Tapped!"),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final String title;
  final String imgSrc;
  final String press;
  const BottomNavigation({
    Key key,
    this.title,
    this.imgSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[SvgPicture.asset(imgSrc), Text(title)],
      ),
    );
  }
}
