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
           child: Row(
             children: [
               Text("EXPLORE POPULAR CATEGORIES",
               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),

             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:[
             SizedBox(
               width: 100,
               child:beverageWidget(),
             ),
             SizedBox(
               width:100,
               child:harddrinkWidget(),
             ),
             SizedBox(
               width:100,
               child: ChocolateWidget(),
             ),
             SizedBox(
               width: 100,
               child: SnacksWidget(),
             ),
             SizedBox(
               width:100,
               child: BeautyWidget(),
             ),
             SizedBox(
               width: 100,
               child: KitchenWidget(),
             )
           ],
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

class beverageWidget extends StatelessWidget{
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
            child: Image.asset('assets/Images/bev.jpg', width: 60,)
            ),
          ListTile(
            title: Text('Beverage',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class harddrinkWidget extends StatelessWidget{
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
              child: Image.asset('assets/Images/hard.jpg', width: 60,)
          ),
          ListTile(
            title: Text('Hard Drinks',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class ChocolateWidget extends StatelessWidget{
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
              child: Image.asset('assets/Images/chooo.jpg', width: 85,)
          ),
          ListTile(
            title: Text('Chocolates',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
class SnacksWidget extends StatelessWidget{
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
              child: Image.asset('assets/Images/sna.jpg', width: 85,)
          ),
          ListTile(
            title: Text('Snacks',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class BeautyWidget extends StatelessWidget{
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
              child: Image.asset('assets/Images/beuti.jpg', width: 85,)
          ),
          ListTile(
            title: Text('Beauty Products',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class KitchenWidget extends StatelessWidget{
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
              child: Image.asset('assets/Images/kitchen.jpg', width: 85,)
          ),
          ListTile(
            title: Text('Kitchen Utensils',style:TextStyle(fontSize: 11),textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}


