import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final String drug;
  final String text;
  const CustomBottomSheet({super.key, required this.drug, required this.text});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.drug,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the bottom sheet
                    },
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
