import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intl/intl.dart';
import 'pallete.dart';
import 'medicamento.dart';
import 'homepage.dart';
import 'form.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyNavigation());
  }
}

class MyNavigation extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyNavigationState();
  }
}

class MyNavigationState extends State<MyNavigation> {
  var iconList = <IconData>[
    Icons.person,
    Icons.calendar_today,
    Icons.bar_chart,
    Icons.settings
  ];
  var _bottomNavIndex = 0;

  int _currentIndex = 0;
  //List<Widget> _pages = List.filled(1, ListaMedicamentos());
  var _pages = [ListaMedicamentos()];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        break;

      case 1:
        return ListaMedicamentos();

      case 2:
        break;

      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onTap,
        //other params
      ),
      body: Container(
        child: _getPage(_currentIndex),
      ),
    );
  }
}


/*

Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {},
        items: [
          const BottomNavigationBarItem(
            label: "Perfil",
            icon: Icon(Icons.person),
          ),
          const BottomNavigationBarItem(
            label: "Calendário",
            icon: Icon(Icons.calendar_today),
          ),
          const BottomNavigationBarItem(
              label: "Relatório", icon: Icon(Icons.bar_chart)),
          const BottomNavigationBarItem(
              label: "Configurações", icon: Icon(Icons.settings))
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );

*/