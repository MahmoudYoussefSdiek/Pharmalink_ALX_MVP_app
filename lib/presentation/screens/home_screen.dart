import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pharmalink/presentation/components/widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = '/home_screen';

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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Image(
                    //height: 200,
                    image: AssetImage('assets/logo.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(30), // Adjust the value as needed
                        right:
                            Radius.circular(30), // Adjust the value as needed
                      ),
                      color: Colors
                          .grey[200], // Adjust the background color as needed
                    ),
                    child: SizedBox(
                      width: double.infinity, // Adjust the width as needed
                      child: TextField(
                        controller: _searchController,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 12,
                            // fontWeight: FontWeight.w700,
                            // letterSpacing: 0.50,
                          ),
                        decoration: InputDecoration(
                          hintText: "Search for drugs...",
                          hintStyle: const TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.50,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
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
                  _suggestedDrugs.isNotEmpty
                      ? _buildSuggestions()
                      : Container(height: 200,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20), // Adjust the value as needed
          bottom: Radius.circular(20), // Adjust the value as needed
        ),
        color: Colors
            .grey[200], // Adjust the background color as needed
      ),
      height: 200,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
    Map<String, dynamic> keyValuePairs = await fetchDataFromUrl(drug);
    _showBottomSheet(drug, keyValuePairs);

  }

  Future _showBottomSheet(String drug, Map<String, dynamic> keyValuePairs) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          // bottom: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return CustomBottomSheet(drug: drug, keyValuePairs: keyValuePairs,);
      },
    );
  }

  Future<Map<String, dynamic>> fetchDataFromUrl(String item) async {
    try {
      final url = Uri.parse('https://api.fda.gov/drug/event.json?search=$item');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final drugInfo = jsonDecode(response.body);

        List<String> reaction = drugInfo['results'][0]['patient']['reaction'].map((element) => element['reactionmeddrapt']).toList().cast<String>();
        String medicinal_product = drugInfo['results'][0]['patient']['drug'][0]['medicinalproduct'];
        List<String> brand_name = drugInfo['results'][0]['patient']['drug'][0]['openfda']['brand_name'].map((element) => element).toList().cast<String>();
        List<String> generic_name = drugInfo['results'][0]['patient']['drug'][0]['openfda']['generic_name'].map((element) => element.toString()).toList().cast<String>();
        List<String> product_type = drugInfo['results'][0]['patient']['drug'][0]['openfda']['product_type'].map((element) => element.toString()).toList().cast<String>();
        List<String> route = drugInfo['results'][0]['patient']['drug'][0]['openfda']['route'].map((element) => element.toString()).toList().cast<String>();
        List<String> substance_name = drugInfo['results'][0]['patient']['drug'][0]['openfda']['substance_name'].map((element) => element.toString()).toList().cast<String>();


        return {
          'medicinal product': medicinal_product,
          'product type': product_type,
          'route': route,
          'reaction': reaction,
          'substance name': substance_name,
          'generic name': generic_name,
          'brand name': brand_name,
        };
      } else {
        throw Exception('Failed to load data from the server');
      }
    } catch (e) {
      return {'error': 'Something went wrong'};
    }
  }
}
