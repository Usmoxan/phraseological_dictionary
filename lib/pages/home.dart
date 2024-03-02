import 'package:flutter/cupertino.dart';
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
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: selectedPageIndex,
              children: _pages,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            child: const Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.dashboard_rounded),
                    Text(
                      'PHRASEOLOGICAL UNITS',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                      children: [
                        Icon(Icons.space_dashboard),
                        Text(
                          'PROVERBS AND SAYINGS',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )),
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.help),
                    Text(
                      'Haqida',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedLabelStyle: const TextStyle(
      //     fontSize: 12,
      //   ),
      //   backgroundColor: Theme.of(context).brightness == Brightness.light
      //       ? Colors.white
      //       : Colors.black,
      //   currentIndex: selectedPageIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       selectedPageIndex = index;
      //     });
      //   },
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard_rounded),
      //       label: 'PHRASEOLOGICAL UNITS',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.space_dashboard),
      //       label: 'PROVERBS AND SAYINGS',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.help),
      //       label: 'Haqida',
      //     ),
      //   ],
      // ),
    );
  }
}
