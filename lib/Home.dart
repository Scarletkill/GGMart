import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:gg_mart/Service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Searchbar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'The Good Grocer',
      home: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget{
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>{
  int _currentIndex = 0;
  List<String> allWords = generateWordPairs().take(100).map((wordPair) => wordPair.asPascalCase).toList();
  List<String> filteredWords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("The Good Grocer"),
          backgroundColor: Colors.lightGreen[400],
          actions: [
            GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Signout user'),
                      content: Text('Are you sure you wnat to Signout?'),
                      actions: [
                        InkWell(
                          child: Text('Ok'),
                          onTap: () async {
                            final firebaseAuthService = FirebaseAuthService();
                            firebaseAuthService.signout();
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.remove('id');
                            Navigator.of(dialogContext).pop();
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                        ),
                        InkWell(
                          child: Text('Cancel'),
                          onTap: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    );
                  });

                },
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.logout),
                ),
            ),
          ],
      ),
      body: Column(
        children:[
          Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  filteredWords = allWords.where((word) =>word.toLowerCase().contains(value.toLowerCase()) ).toList();
                });
              },
              decoration:InputDecoration(
                labelText: "Search",
                hintText: "Type to search..",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: productWidget(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWords.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(filteredWords[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class productWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/Images/bev.jpg', width: 100,)
            ),
          ListTile(
            title: Text('Beverage',textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}





