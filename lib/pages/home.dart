import 'package:flutter/material.dart';
import 'package:phraseological_dictionary/pages/about.dart';
import 'package:phraseological_dictionary/pages/ph_unit.dart';
import 'package:phraseological_dictionary/pages/proverbsnsaying.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const PhUnitPage(
      path: 'assets/section1.json',
    ),
    const PnSayingPage(),
    const AboutPage()
  ];
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phraseological dictionary"),
      ),
      body: IndexedStack(
        index: selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard_rounded),
            icon: Icon(Icons.space_dashboard_outlined),
            label: 'PHRASEOLOGICAL UNITS',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.space_dashboard),
            icon: Icon(Icons.space_dashboard_outlined),
            label: 'PROVERBS AND SAYINGS',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.help),
            icon: Icon(Icons.help),
            label: 'Haqida',
          ),
        ],
      ),
    );
  }
}
