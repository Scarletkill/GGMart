import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gg_mart/list_view.dart';
import 'package:gg_mart/login.dart';
import 'package:gg_mart/register.dart';
import 'package:gg_mart/splash.dart';
import 'package:gg_mart/topics.dart';
import 'package:gg_mart/user_list.dart';
import 'package:gg_mart/utlis/Edit_profile.dart';

import 'Home.dart';
import 'Profile.dart';
import 'firebase_options.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  runApp(
    MaterialApp(
      title: "The Good Grocer",
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen)
      ),
        routes:{
        '/':(BuildContext context) =>Splash(),
         '/Home':(context) => Searchbar(),
          '/ListviewScreen': (context) => ListviewScreen(),
          '/login':(context) => Login(),
          //'/TopPicks':(context) => TopPicks(),
          '/register':(context) => Register(),
          '/profile':(context) => Profile (),
          '/edit-profile':(context) => EditProfile(),
          '/users-list':(context) => UserLists()
    },
    )
  );
}
void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}


