import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/user_model.dart';

class FirebaseDatabaseService{
  final  studentList=[];
  final user=[];
  final _firestoreDb=FirebaseFirestore.instance;
  Future getUser() async{
    try{
      final CollectionReference _userCollectionReference = await _firestoreDb.collection('user');
      await _userCollectionReference.get().then((querySnapshot){
        for (var result in querySnapshot.docs){
          user.add(result.data);
      }
      });
      return user;
    }on FirebaseException catch (e){
      print('Error in firestore database $e');
    }catch (e){
      print('something went wrong $e');
    }
  }

  Future getUsers() async{
    try{
      final CollectionReference _studentCollectionReference=_firestoreDb.collection('student');
      var student1Details= await _studentCollectionReference.doc('student1').get();
      if(student1Details.exists){
        print('The user Details is ${student1Details.data()}');
      }else{
        print('User Details not found');
      }

      return studentList;
    }on FirebaseException catch(e){
      print('Error in firestore database');
    }
    catch(e){
      print('Something went wrong');
    }

  }

  //// this function is used to create a user in cloud firebase
  void createUserInCloudFirebase({required UserModel userModel}) async {
    try {
      final CollectionReference _userCollectionReference = _firestoreDb
          .collection('users');
      await _userCollectionReference.add(userModel.toJson()).whenComplete(() {
        print('user Created Sucess');
      });
    } catch (e) {
      print('Something went wrong $e');
    }
  }

  //This function is used to get user detail using uId
  Future<UserModel?> getUserDetailUsingUid({required String uId}) async {
    try {
      final CollectionReference _userCollectionReference =
      await _firestoreDb.collection('users');
      final snapShot = await _userCollectionReference.where(
          'id', isEqualTo: uId).get();
      final userModel = snapShot.docs
          .map((doc) =>
          UserModel.fromJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .single;
      return userModel;
    } catch (e) {
      print('something went wrong $e');
    }
    return null;


  }

  ////geting database from user
  Future<List<UserModel>> getUsersFromDatabase() async {
    try {
      final CollectionReference usersCollectionReference = _firestoreDb.collection('users');
      final documentSnapShot = await usersCollectionReference.get();

      if (documentSnapShot.docs.isNotEmpty) {
        final usersList = documentSnapShot.docs.map((doc) =>
            UserModel.fromJson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>)).toList();
        return usersList;
      } else {
        print('User Not Found');
        return [];
      }
    } catch (e) {
      print('Something went wrong $e');
    }
    return [];
  }

  ////Function to update User using UID
  Future<UserModel?> updateUserUsingUID({required String uId, required UserModel userModel}) async{
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      final snapShot = await _usersCollectionReference.where('id', isEqualTo: uId).get();
      if(snapShot.docs.isNotEmpty){
        final documnetId = snapShot.docs.first.id;
        await _usersCollectionReference.doc(documnetId).update(userModel.toJson());
    }else{
        return null;
      }
    }catch(e){
      print('Something went Wrong $e');
    }
    return null;
  }


  //Function to delete user from database using user UID
  Future<List<UserModel>>deleteUserUsingUID({required String uId})async{
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      final snapShot = await _usersCollectionReference.where('id', isEqualTo: uId).get();
      if(snapShot.docs.isNotEmpty){
        final documentId = snapShot.docs.first.id;
        await _usersCollectionReference.doc(documentId).delete();
        final usersList = snapShot.docs
            .map((doc) => UserModel.fromJson(
            doc as QueryDocumentSnapshot<Map<String, dynamic>>)).toList();
        return usersList;

      }
    }catch(e){
      print('something is wrong $e');
    }
    return [];
  }
}