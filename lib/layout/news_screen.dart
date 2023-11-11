import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/moduls/search.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/style/icon_broken.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class news_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonNavtheme = Theme.of(context).bottomNavigationBarTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text(' EgNews '), Icon(Icons.language_outlined)],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => search(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              news_cubit.get(context).changemod();
            },
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
          ),
        ],
      ),
      body: news_cubit
          .get(context)
          .appscreens[news_cubit.get(context).currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        backgroundColor:
            news_cubit.get(context).isDark ? HexColor("333739") : Colors.white,
        currentIndex: news_cubit.get(context).currentIndex,
        onTap: (n) {
          news_cubit.get(context).change_screen(n);
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        //inkColor: Colors.black12, //optional, uses theme color if not specified
        items: [
          BubbleBottomBarItem(
              backgroundColor:
                  BottomNavigationBarTheme.of(context).backgroundColor,
              icon: Icon(
                Icons.monetization_on_rounded,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.monetization_on_rounded,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text(
                "business",
                style: TextStyle(fontSize: 12.0),
              )),
          BubbleBottomBarItem(
              backgroundColor: buttonNavtheme.backgroundColor,
              icon: Icon(
                Icons.live_tv_outlined,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.live_tv_outlined,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text(
                "entertainment",
                style: TextStyle(fontSize: 10.0),
              )),
          BubbleBottomBarItem(
              backgroundColor: buttonNavtheme.backgroundColor,
              icon: Icon(
                Icons.health_and_safety,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.health_and_safety,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text("health")),
          BubbleBottomBarItem(
              backgroundColor: buttonNavtheme.backgroundColor,
              icon: Icon(
                Icons.science,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.science,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text("science")),
          BubbleBottomBarItem(
              backgroundColor: buttonNavtheme.backgroundColor,
              icon: Icon(
                Icons.sports,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.sports,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text("sports")),
          BubbleBottomBarItem(
              backgroundColor: buttonNavtheme.backgroundColor,
              icon: Icon(
                Icons.computer,
                color: buttonNavtheme.unselectedItemColor,
              ),
              activeIcon: Icon(
                Icons.computer,
                color: buttonNavtheme.selectedItemColor,
              ),
              title: Text("technology")),
        ],
      ),
    );
  }
}

Widget bbb() {
  return Swiper(
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: (() {}),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
                child: Image.network(
                  'https://new.nile4.com/wp-content/uploads/2022/12/ايفون-14-برو-ماكس.jpg',
                  fit: BoxFit.cover,
                  height: 400.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 350.0, 0.0, 0),
              child: Container(
                height: 200.0,
                width: 750.0,
                child: Material(
                  borderRadius: BorderRadius.circular(35.0),
                  elevation: 10.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Text(
                          'روسيا وأوكرانيا: حاكم لوهانسك يقول إن مقرا لقيادة مجموعة \"فاغنر\" الروسية تعرض للقصف - BBC',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        ' 2022-12-11T20:04:52Z',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
    itemCount: 3,
    viewportFraction: 0.7,
    scale: 0.9,
    autoplay: true,
  );
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.blue,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: ("Settings"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.blue,
    ),
  ];
}
