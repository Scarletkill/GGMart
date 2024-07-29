import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? uId;
  String? fullName;
  int? phoneNumber;
  String? emailaddress;
  String? address;
  String? gender;

  UserModel({this.uId, this.fullName, this.phoneNumber, this.emailaddress, this.address, this.gender});

  toJson(){
    return{
      'id' : uId,
      'full_Name': fullName,
      'PhoneNumber': phoneNumber,
      'address': address,
      'email_address': emailaddress,
      'Gender': gender,
    };
  }

  factory UserModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>>documentSnapshot){
    final snapshot = documentSnapshot.data();
    return UserModel(
      uId: snapshot['id'],
      fullName: snapshot['full_Name'],
      phoneNumber: snapshot['PhoneNumber'],
      emailaddress: snapshot['email_address'],
      address: snapshot['address'],
      gender: snapshot['Gender']
    );
  }
}