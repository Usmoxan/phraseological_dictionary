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
    const PnsayingPage(
      path: 'assets/section2.json',
    ),
    const AboutPage()
  ];
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Phraseological dictionary"),
      ),
      body: IndexedStack(
        index: selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        currentIndex: selectedPageIndex,
        onTap: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'PHRASEOLOGICAL UNITS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard),
            label: 'PROVERBS AND SAYINGS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Haqida',
          ),
        ],
      ),
    );
  }
}
