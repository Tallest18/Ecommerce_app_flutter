import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //function to handle user sign up
  Future<String?> signUp(
    String name,
    String email,
    String password,
    String role
  ) async {
    try {
      // create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // save additional user info in Firestore
      await _firestore
      .collection('users')
      .doc(userCredential.user!.uid)
      .set({
        'name': name.trim(),
        'email': email.trim(),
        'role': role, //role determines if user is admin or user
      });

      return null; // success : no error message
    } catch (e) {
      return e.toString(); // error : return the exception message 
    }
  } 

  //function to handle user login
  Future<String?> login(
    String email,
    String password
  ) async {
    try {
      // sign in with users using firebase authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // fetching user role from firestore
      DocumentSnapshot userDoc = await _firestore
      .collection('users')
      .doc(userCredential.user!.uid)
      .get();

      return userDoc.get('role'); //return the user's role (admin/user)
    } catch (e) {
      return e.toString(); // error : return the exception message 
    }
  }
}

//for user logout
signOut() async {
  await FirebaseAuth.instance.signOut();
}