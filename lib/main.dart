import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicineSearchScreen(),
    );
  }
}

class MedicineSearchScreen extends StatefulWidget {
  @override
  _MedicineSearchScreenState createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  List<String> medicineItems = [
    'Aspirin',
    'Paracetamol',
    'Ibuprofen',
    'Amoxicillin',
    'Ciprofloxacin',
  ];

  List<String> searchResults = [];

  void searchMedicine(String query) {
    setState(() {
      searchResults = medicineItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: searchMedicine,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
