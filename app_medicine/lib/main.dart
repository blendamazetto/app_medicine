import 'package:flutter/material.dart';
import 'utils/pallete.dart';
import 'pages/lista_medicamentos_page.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyNavigation(),
      title: 'Adicionar Medicamento',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: ThemeData(
        primarySwatch: Palette.pinkToWhite,
        fontFamily: 'Montserrat',
        backgroundColor: const Color(0xffe5e5e5),
      ),
    );
  }
}

class MyNavigation extends StatefulWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyNavigationState();
  }
}

class MyNavigationState extends State<MyNavigation> {
  final _pageController = PageController();

  int _currentIndex = 0;
  //List<Widget> _pages = List.filled(1, ListaMedicamentos());
  final _pages = [
    Container(color: Colors.blue),
    const ListaMedicamentos(),
    Container(color: Colors.red),
    Container(color: Colors.greenAccent.shade700),
  ];

  _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  _onTap(int index) {
    _pageController.jumpToPage(index);
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentIndex,
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Início'),
            activeColor: Palette.pinkToWhite,
          ),
          BottomBarItem(
            icon: const Icon(Icons.medication),
            title: const Text('Medicações'),
            activeColor: Palette.pinkToWhite,
          ),
          BottomBarItem(
            icon: const Icon(Icons.bar_chart),
            title: const Text('Estatísticas'),
            activeColor: Palette.pinkToWhite,
          ),
          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Configurações'),
            activeColor: Palette.pinkToWhite,
          ),
        ],
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
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