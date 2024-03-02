import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phraseological_dictionary/pages/about.dart';
import 'package:phraseological_dictionary/pages/ph_unit.dart';
import 'package:phraseological_dictionary/pages/proverbsnsaying.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  final List<Widget> _pages = [
    const PhUnitPage(
      path: 'assets/section1.json',
    ),
    const PnsayingPage(
      path: 'assets/section2.json',
    ),
    const AboutPage()
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // Center the columns in the row
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 0;
                        selectedPageIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Center(
                            child: Icon(
                          Icons.dashboard_rounded,
                          color: selectedPageIndex == 0
                              ? const Color(0xFF3988FF)
                              : Colors.black,
                        )), // Center the icon
                        Text(
                          'PHRASEOLOGICAL UNITS',
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedPageIndex == 0
                                ? const Color(0xFF3988FF)
                                : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Center(
                            child: Icon(
                          Icons.space_dashboard,
                          color: selectedPageIndex == 1
                              ? const Color(0xFF3988FF)
                              : Colors.black,
                        )), // Center the icon
                        Text(
                          'PROVERBS AND SAYINGS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedPageIndex == 1
                                ? const Color(0xFF3988FF)
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Center(
                            child: Icon(
                          Icons.help,
                          color: selectedPageIndex == 2
                              ? const Color(0xFF3988FF)
                              : Colors.black,
                        )), // Center the icon
                        Text(
                          'Haqida',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedPageIndex == 2
                                ? const Color(0xFF3988FF)
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
