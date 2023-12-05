import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedDrug = "";
  final List<String> _allDrugs = [
    // Your list of top 100 drugs here
    "Paracetamol",
    "Panadol",
    "Aspirin",
    "Ibuprofen",
    "Amoxicillin",
    "Omeprazole",
    "Vitamin D",
    "Codeine",
    "Loratadine",
    "Cetirizine",
    "Flucloxacillin",
    "Metformin",
    "Atorvastatin",
    "Salbutamol",
    "Ciprofloxacin",
    "Sertraline",
    "Ramipril",
    "Co-codamol",
    "Fluoxetine",
    "Tramadol",
    "Simvastatin",
    "Amlodipine",
    "Lansoprazole",
    "Losartan",
    "Levothyroxine",
    "Gabapentin",
    "Bendroflumethiazide",
    "Fluticasone",
    "Pregabalin",
    "Prednisolone",
    "Diazepam",
    "Citalopram",
    "Doxycycline",
    "Furosemide",
    "Candesartan",
    "Metoprolol",
    "Tamsulosin",
    "Fluconazole",
    "Clopidogrel",
    "Amoxicillin",
    "Prednisone",
    "Metronidazole",
    "Ciprofloxacin",
    "Levetiracetam",
    "Cephalexin",
    "Cefalexin",
    // ...
  ];
  List<String> _suggestedDrugs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Drug Search"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  height: 200,
                  image: AssetImage('assets/logo.png'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30), // Adjust the value as needed
                      right: Radius.circular(30), // Adjust the value as needed
                    ),
                    color: Colors.grey[200], // Adjust the background color as needed
                  ),
                  child: SizedBox(
                    width: double.infinity, // Adjust the width as needed
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Search for drugs...",
                        hintStyle: const TextStyle(color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none, // Remove default border
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search, color: Colors.green),
                          onPressed: () {
                            // Handle search button press
                            _handleSearch(_searchController.text);
                          },
                        ),
                      ),
                      onChanged: (value) {
                        // Update suggestions dynamically based on user input
                        _updateSuggestions(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _suggestedDrugs.isNotEmpty ? _buildSuggestions() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _suggestedDrugs
              .map((drug) => GestureDetector(
            onTap: () {
              // Handle suggestion tap
              setState(() {
                _selectedDrug = drug;
                _searchController.text = drug;
                _suggestedDrugs.clear();
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                drug,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ))
              .toList(),
        ),
      ),
    );
  }

  void _updateSuggestions(String input) {
    // Filter drugs based on user input
    setState(() {
      _suggestedDrugs = _allDrugs
          .where((drug) => drug.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  void _handleSearch(String drug) async {
    print("Searching for $_selectedDrug...");
    final url = Uri.parse('https://api.fda.gov/drug/event.json?search=$drug');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final drugInfo = jsonDecode(response.body);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(drug),
            content: Text(drugInfo['results'][0]['patient']['drug'][0]['medicinalproduct']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to fetch drug information.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
