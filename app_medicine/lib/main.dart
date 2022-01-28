import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intl/intl.dart';
import 'pallete.dart';
import 'medicamento.dart';
import 'homepage.dart';
import 'form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigation()
    );
  }
}

class MyNavigation extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyNavigationState();
  }
}

class MyNavigationState extends State<MyNavigation> {
  int _currentIndex = 0;
  List<Widget> _pages = List.filled(1, ListaMedicamentos());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              label: "Relatório",
              icon: Icon(Icons.bar_chart)
            ),
            const BottomNavigationBarItem(
              label: "Configurações",
              icon: Icon(Icons.settings)
            )
          ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}



