import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VoterSearchScreen extends StatefulWidget {
  @override
  _VoterSearchScreenState createState() => _VoterSearchScreenState();
}

class _VoterSearchScreenState extends State<VoterSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> searchResult = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voter Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter Voter ID',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchVoter();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: searchResult.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      columns: [
                        DataColumn(label: Text('Field')),
                        DataColumn(label: Text('Value')),
                      ],
                      rows: searchResult.entries.map((entry) {
                        return DataRow(cells: [
                          DataCell(Text(
                            entry.key,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text(entry.value.toString())),
                        ]);
                      }).toList(),
                    ),
                  )
                : SizedBox(), // Placeholder when no search result
          ),
        ],
      ),
    );
  }

  void _searchVoter() async {
    String searchText = _searchController.text;
    if (searchText.isEmpty) {
      return;
    }

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Voter Data')
        .where('Voter_Id', isEqualTo: searchText)
        .get();

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        searchResult = snapshot.docs.first.data() as Map<String, dynamic>;
      });
    } else {
      setState(() {
        searchResult = {}; // Clear search result if not found
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: VoterSearchScreen(),
  ));
}

