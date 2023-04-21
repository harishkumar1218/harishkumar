import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryPage extends StatefulWidget {
  const SearchHistoryPage({Key? key}) : super(key: key);

  @override
  _SearchHistoryPageState createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  late List<String> _searchHistory = [
    // 'Flutter',
    // 'Dart',
    // 'Mobile Development',
    // 'UI Design',
  ];
  Future<void> deleteNameFromCollection(String documentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ismemer = prefs.getBool('ismemer') ?? false;
    String person = ismemer ? "memer" : "customer";
    try {
      await _firestore
          .collection('$person/$uid/history')
          .doc(documentId)
          .delete();
      print('Name deleted successfully!');
    } catch (e) {
      print('Error deleting name: $e');
    }
  }

  Future<List<String>> getNamesFromCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ismemer = prefs.getBool('ismemer') ?? false;
    String person = ismemer ? "memer" : "customer";

    List<String> namesList = [];

    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('$person/$uid/history').get();
      querySnapshot.docs.forEach((doc) {
        String name = doc['name'];
        _searchHistory.add(name);
      });
      print('Names retrieved successfully!');
      setState(() {});
    } catch (e) {
      print('Error retrieving names: $e');
    }

    return namesList;
  }

  @override
  void initState() {
    // TODO: implement initState

    getNamesFromCollection();
    setState(() {});
    super.initState();
  }

  void _clearHistory() {
    setState(() {
      _searchHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Search History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _searchHistory.isEmpty ? null : _clearHistory,
          ),
        ],
      ),
      body: _searchHistory.isEmpty
          ? Center(
              child: Text('Your search history is empty.'),
            )
          : ListView.builder(
              itemCount: _searchHistory.length,
              itemBuilder: (context, index) {
                final query = _searchHistory[index];
                return ListTile(
                  title: Text(query),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        deleteNameFromCollection(
                            _searchHistory.elementAt(index));
                        _searchHistory.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    // Implement your logic to search for the query here.
                    print('Searching for: $query');
                  },
                );
              },
            ),
    );
  }
}
