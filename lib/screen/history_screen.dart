import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  final List<Barcode> results;

  const HistoryScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Color(0xFF2E2E2E),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Implement menu action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Color(0xFF2E2E2E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement scan action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA726), // Button color
                  ),
                  child: const Text('Scan'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement create action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2E2E2E), // Button color
                  ),
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return Card(
                  color: Color(0xFF2E2E2E),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListTile(
                    leading: Icon(Icons.qr_code_2, color: Color(0xFFFFA726)),
                    title: Text(
                      result.code ?? 'No Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      DateFormat('dd MMM yyyy, h:mm a').format(DateTime.now()),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(Icons.lock, color: Color(0xFFFFA726)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF2E2E2E),
        selectedItemColor: Color(0xFFFFA726),
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Set the current index to the History item
        onTap: (index) {
          if (index == 0) {
            // Navigate to Generate screen
          } else if (index == 1) {
            // Stay on History screen
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
