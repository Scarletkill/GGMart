import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gg_mart/Service/firebase_database_service.dart';

import 'Model/user_model.dart';

class UserLists extends StatelessWidget{
  const UserLists({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'users List',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseDatabaseService().getUsersFromDatabase(),
        builder: (context, snapShot){
          if(snapShot.connectionState == ConnectionState.done){
            if(snapShot.hasError){
              return Center(
                child: Text('Error loading users'),
              );
            }

            ////connection us established and firebase returned some data
            if(snapShot.hasData){
              final usersList = snapShot.data;
              if(usersList!= null && usersList.isNotEmpty){
                return ListView.builder(itemCount:usersList.length,
                itemBuilder: (context, index){
                  final userModel = usersList[index];
                  return BasicDetails(
                    userModel: userModel,
                  );
                },
                );
              }else{
                return Center(
                  child: Text('No user Found'),
                );
              }
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
          },
      ),
    );
  }
}
///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
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
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.orangeAccent,
            ),
                onPressed: (){
                  showDialog(context: context, builder: (dialogContext){
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Delete User'),
                      content: Text('Are you sure you want to delete?'),
                      actions: [
                        TextButton(onPressed: ()async{
                          final firebaseDatabaseService = FirebaseDatabaseService();
                          if(userModel!=null){
                            if(userModel!.uId!= null){
                              print('User Id ${userModel!.uId!}');
                              await firebaseDatabaseService.deleteUserUsingUID(uId: userModel!.uId!);
                              Navigator.of(dialogContext).pop();
                            }
                          }
                          },
                            child: Text('Yes')),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text('Yes'))
                      ],

                    );
                  });
                },
          ))
        ],
      ),
    );
  }
}