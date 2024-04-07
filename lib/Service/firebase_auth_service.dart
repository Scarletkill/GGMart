import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUpUserWithEmailAndPassword(String email, String password)async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthService catch(e){
      print('Firebase Auth Exception $e');
    }
    catch (e) {
      print('something went wrong');
    }
    return null;
  }
  //This function is to login user with email and password
  Future<User?>loginWithEmailAndPassword(String email, String password)async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthService catch(e){
      print('Firebase Auth Exception $e');
    } catch(e){
      print('Something went wrong');
    }
    return null;
  }
  // This function is to signout user from firebase
  Future<void> signout() async{
    try{
      await _auth.signOut();
    } catch(e){
      print('Error while signout');
    }
  }
}