import 'package:flutter/material.dart';
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
                                  ? Colors.purple
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 0
                                ? Colors.purple.shade100
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Flag(Flags.united_states_of_america),
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
                                  ? Colors.purple
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 1
                                ? Colors.purple.shade100
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Flag(Flags.uzbekistan),
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
                                  ? Colors.purple
                                  : Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                            color: lang == 2
                                ? Colors.purple.shade100
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
                        onTap: () {},
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
