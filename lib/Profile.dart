import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg_mart/Controller/user_Controller.dart';
import 'package:gg_mart/Service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userId = " ";
  @override
  void initState() {
    readUidFromSharedPreferences();
    super.initState();
  }
  //This function is used to read uid from sharedPreferences
  void readUidFromSharedPreferences() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    if(id!= null ){
      setState(() {
        userId = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('View Profile')),
        actions: [
          IconButton(onPressed: (){userController.getAllUsersFromFirebase(); Navigator.of(context).pushNamed('/users-list');} , icon: Icon(Icons.person))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: (userId.isNotEmpty)? Obx((){
                return ListView(
                  children: [
                    ProfileImage(),
                    SizedBox(
                      height: 20,
                    ),
                    BasicDetails(userModel: userController.userModel.value,),
                    SizedBox(
                      height: 20,
                    ),
                    MenuWidgets(
                      title: 'Settings',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MenuWidgets(
                      title: 'Notifications',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MenuWidgets(
                      title: 'About App',
                    ),
                  ],
                );
              }
        ): Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

///This widget is used to display the circular profile images
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/Images/hehe.jpg'),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userModel!= null? Text('Name:${userModel!.fullName}') : Text('Name: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null? Text('Email:${userModel!.emailaddress}'): Text('Email:- '),
          SizedBox(
            height: 5,
          ),
          userModel!=null? Text('Phone:${userModel!.phoneNumber} '): Text('Contact: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null? Text('Address:${userModel!.address} '): Text('Address: -'),
          SizedBox(
            height: 5,
          ),
          userModel!=null? Text('Gender:${userModel!.gender} '): Text('Gender: -'),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed:()=> Navigator.of(context).pushNamed(
                  '/edit-profile',
                  arguments: userModel),
              child: Text('Edit Profile'))
        ],
      ),
    );
  }
}

///This widget is common for creating menus
class MenuWidgets extends StatelessWidget {
  MenuWidgets({required this.title, this.onPressed});

  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}