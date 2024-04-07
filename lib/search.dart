import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Service/firebase_auth_service.dart';
import 'controller/counter_controller.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {

    final CounterController counterController=Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text('About app'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Signout User'),
                      content: Text('Are you sure you want to Signout?'),
                      actions: [
                        InkWell(
                            child: Text('Ok'),
                            onTap: () async{
                              final firebaseAuthService = FirebaseAuthService();
                              firebaseAuthService.signout();
                              final SharedPreferences prefs=
                              await SharedPreferences.getInstance();

                              await prefs.remove('id');
                              Navigator.of(dialogContext).pop();
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            }),
                        InkWell(
                            child: Text('Cancel'),
                            onTap: () {
                              Navigator.of(dialogContext).pop();
                            }),
                      ],
                    );
                  });
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          // SizedBox(
          //   height: 5,
          // ),
          Image(
            image: Image.asset('assets/Images/hehe.jpg').image,
            height: 500,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            padding:EdgeInsets.all(20),
            child: Column(
              children:[
                Obx(() {
                  return Text('The counter Value is ${counterController.counter}');
                }
                ),
                SizedBox(height: 20,),
                IconButton(icon:Icon(Icons.add),onPressed: (){
                  counterController.increment();
                },),
                SizedBox(height: 20,),
                IconButton(icon: Icon(Icons.remove), onPressed: (){
                  counterController.decrement();
                },),
              ],
            ),
          ),
          Center(
            child: Text(
              'Beautiful scenery',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Beautiful scenery is like a lovely painting. Imagine a big blue sky with fluffy white clouds. '
                'Below, there is a bright green field full of pretty flowers of all colors. A little stream flows gently, '
                'sparkling in the sunlight. Tall trees stand around, their leaves rustling in the wind. Birds are singing sweet '
                'songs, flying high in the sky. Far away, you can see big hills covered with green trees. The sun sets, painting '
                'the sky with colors of orange and pink. This is beautiful scenery, which makes us feel happy and calm. It’s like'
                ' nature’s own art.',

            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),


          Text('Beautiful scenery is like a magical painting come to life. It’s the kind of view that takes your breath'
              ' away and makes your heart feel light. Imagine standing on a hilltop, looking out at a wide, open field. The field is '
              'a bright, vibrant green, full of tall, waving grass. In the distance, there are trees with leaves in all shades of green.'
              'Some trees have flowers in pink, yellow, and white, adding splashes of color to the scene. Beyond the trees, you can see'
              'mountains.',
              style: TextStyle(fontSize: 20))
        ],
      ),

    );
  }
}