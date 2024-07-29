import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gg_mart/Controller/user_Controller.dart';
import 'package:gg_mart/Service/firebase_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>{
  var gender;
  final UserController userController = Get.find();
  //underscore : private
  //function to set default usermodel value to form controllers
//Function to set default usermodel value to form controllers
  void setValuesFromUserModelInFormControllers(){
    final UserModel? userModelDetails = ModalRoute.of(context)!.settings.arguments as UserModel;


    if(userModelDetails!= null){
      if(userModelDetails.fullName != null){
        userController.fullNameController.text = userModelDetails.fullName!;
      }
      if(userModelDetails.emailaddress!=null){
        userController.emailAddressController.text= userModelDetails.emailaddress!;
      }
      if(userModelDetails.phoneNumber!= null){
        userController.phoneNumberController.text = userModelDetails.phoneNumber!.toString();
      }
      if(userModelDetails.address!= null){
        userController.streetAddressController.text= userModelDetails.address!;
      }
       if(userModelDetails.gender!=null){
        gender = userModelDetails.gender!;
       }
    }
  }

  @override
  void didChangeDependencies() {
    setValuesFromUserModelInFormControllers();
    super.didChangeDependencies();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfile'),
        centerTitle: true,
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          width: MediaQuery.of(context).size.width/1.5,
          child: ListView(
            children: [
              EditProfileImage(),
              SizedBox(height: 10,),
              TextFormField(
                controller: userController.fullNameController,
                keyboardType: TextInputType.name,
                maxLength: 30,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter full name',
                ),
                validator: (fullNameValue){
                  if (fullNameValue==null || fullNameValue.trim().isEmpty){
                    return 'Please Enter Full Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: userController.emailAddressController,
                maxLength: 30,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                ),
                validator: (emailValue){
                  if (emailValue==null || emailValue.trim().isEmpty){
                    return 'Please enter your email address';
                  }
                  final regex= RegExp(userController.emailRegexPattern);
                  if (!regex.hasMatch(emailValue)){
                    return'Please enter a valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: userController.phoneNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your phone number',
                ),
                validator: (phoneNumberValue){
                  if (phoneNumberValue==null || phoneNumberValue.trim().isEmpty){
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: userController.streetAddressController,
                keyboardType: TextInputType.streetAddress,
                maxLength: 20,
                maxLines: 4, //lines or height of box
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your address',
                ),
                validator: (streetAddressValue){
                  if (streetAddressValue==null || streetAddressValue.trim().isEmpty){
                    return 'Please Enter address';
                  }
                  return null;
                },
              ),
              Text('Select your gender'),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Radio(value: 'Male', groupValue: gender, onChanged: (newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  },),
                  Text('Male'),
                  Radio(value: 'Female', groupValue: gender, onChanged: (newValue){
                    setState(() {
                      if(newValue!= null){
                        gender = newValue;
                      }
                    });
                  }),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async {
                final SharedPreferences prefs = await SharedPreferences
                    .getInstance();
                final uId = prefs.getString('id');
                if (uId != null) {
                  final userModelRequest = UserModel(
                    uId: uId,
                    fullName: userController.fullNameController.text,
                    emailaddress: userController.emailAddressController.text,
                    phoneNumber: int.parse(userController.phoneNumberController.text),
                    address: userController.streetAddressController.text,
                    gender: gender,
                  );
                  print('user Model Request  ${userModelRequest.toJson()}');

                  final userModelResponse = await FirebaseDatabaseService()
                      .updateUserUsingUID(
                      uId: uId, userModel: userModelRequest);
                  if (userModelRequest != null) {
                    print('Data update success');
                    Navigator.of(context).pop();
                  } else {
                    print('error updating');
                  }
                }
              },
                child: Text('Update'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

///This class is used to create an editable profiile image
class EditProfileImage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/Images/hehe.jpg'),
          )
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }

}