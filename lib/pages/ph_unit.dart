import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flag/svg_flag.dart';
import 'package:phraseological_dictionary/models/model.dart';
import 'package:phraseological_dictionary/service/service.dart';
import 'package:icons_plus/icons_plus.dart';

class PhUnitPage extends StatefulWidget {
  final String path;
  const PhUnitPage({super.key, required this.path});

  @override
  State<PhUnitPage> createState() => _PhUnitPageState();
}

class _PhUnitPageState extends State<PhUnitPage> {
  late Future<List<VocabularyItem>> vocabulary;
  String searchQuery = ''; // Hold the search query entered by the user
  int lang = 0;
  @override
  void initState() {
    super.initState();
    vocabulary = VocabularyService().getVocabulary(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<VocabularyItem>>(
        future: vocabulary,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Filter the list based on the search query
            List<VocabularyItem> filteredList = snapshot.data!.where((item) {
              return item.englishWord
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  item.uzbekWord
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  item.russianWord
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase());
            }).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Izlash',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // Update the search query
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 0;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lang == 0
                                  ? const Color(0xFF3988FF)
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 0
                                ? const Color(0xFF3988FF).withOpacity(0.4)
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: SvgFlag(FlagData.parse(code: "US"),height: 25,),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lang == 1
                                  ? const Color(0xFF3988FF)
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 1
                                ? const Color(0xFF3988FF).withOpacity(0.4)
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: SvgFlag(FlagData.parse(code: "UZ"),height: 25,),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            lang = 2;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lang == 2
                                  ? const Color(0xFF3988FF)
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 2
                                ? const Color(0xFF3988FF).withOpacity(0.4)
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Flag(Flags.russia),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      VocabularyItem item = filteredList[index];
                      return GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, item.englishWord,
                              item.uzbekWord, item.russianWord);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              lang == 0
                                  ? item.englishWord
                                  : lang == 1
                                      ? item.uzbekWord
                                      : item.russianWord,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

void _showBottomSheet(
    BuildContext context, String text1, String text2, String text3) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flag(Flags.united_states_of_america),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Text(
                    text1,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flag(Flags.uzbekistan),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Text(
                    text2,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flag(Flags.russia),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Text(
                    text3,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Set the border color here
                    width: 0.5, // Set the border width here
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text("YOPISH"),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
