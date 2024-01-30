import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 4),
          Image.asset('assets/Images/Tp.jpg',
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit:BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Driving Licence Test", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 15),
          Text("This is the image of driving licence Test")
        ],
      ),
    );
  }
}
