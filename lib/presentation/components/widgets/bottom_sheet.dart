import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final String drug;
  final Map<String, dynamic> keyValuePairs;
  const CustomBottomSheet(
      {super.key,
      required this.drug,
      required this.keyValuePairs});

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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            if (widget.keyValuePairs.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.keyValuePairs.entries
                    .map(
                      (entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (entry.value is List<String>)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (entry.value as List<String>)
                              .map(
                                (item) => Text(
                              '- $item',
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                              .toList(),
                        )
                      else
                        Text(
                          entry.value.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
                    .toList(),
              ),

            // if (widget.keyValuePairs.isNotEmpty)
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: widget.keyValuePairs.entries
            //         .map(
            //           (entry) => Text(
            //             '${entry.key}: ${entry.value}',
            //             style: const TextStyle(fontSize: 16),
            //           ),
            //         )
            //         .toList(),
            //   ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
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
