import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:phraseological_dictionary/models/model.dart';
// Adjust the import path according to your project structure

class VocabularyService {
  Future<List<VocabularyItem>> getVocabulary(String jsonPath) async {
    try {
      // Load the JSON file from the assets
      String jsonString = await rootBundle.loadString(jsonPath);

      // Decode the JSON string into a map
      Map<String, dynamic> jsonData = json.decode(jsonString);

      // Access the "vocabulary" array from the map
      List<dynamic> vocabularyList = jsonData['vocabulary'];

      // Map each item in the "vocabulary" array to a VocabularyItem object
      List<VocabularyItem> items = vocabularyList.map((item) {
        // Convert each key-value pair in the array to a VocabularyItem object
        return VocabularyItem(
          englishWord: item['english_word'], // Extract the English word
          uzbekWord: item['uzbek_word'], // Extract the Uzbek word
          russianWord: item['russian_word'], // Extract the Russian word
        );
      }).toList();

      return items; // Return the list of VocabularyItem objects
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error decoding JSON: $e');
      return []; // Return an empty list if an error occurs
    }
  }
}
