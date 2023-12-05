import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
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
                child: Container(
                  width: double.infinity, // Adjust the width as needed
                  child: TextField(
                    controller: _searchController,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Search for drugs...",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none, // Remove default border
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Handle search button press
                          _handleSearch();
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
    );
  }

  Widget _buildSuggestions() {
    return Column(
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

  void _handleSearch() {
    // Implement logic to handle search
    // For simplicity, just print the selected drug
    print("Searching for $_selectedDrug...");
    // Navigate to results screen or update UI with results
  }
}
