import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:eyego_movies_app/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error #FirebaseAuthException# FirebaseAuthService.createUserWithEmailAndPassword : ${e.message} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw const CustomException(message: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        throw const CustomException(
          message: 'The email address is already in use by another account',
        );
      } else if (e.code == 'network-request-failed') {
        throw const CustomException(message: 'No Internet Connection');
      } else {
        throw const CustomException(
          message: 'There is an error in creating an account',
        );
      }
    } catch (e) {
      log(
        'Error FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );
      throw const CustomException(
        message: 'There is an error in creating an account',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error #FirebaseAuthException# FirebaseAuthService.signInWithEmailAndPassword : ${e.message} and code is ${e.code}',
      );
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw const CustomException(message: 'Email or password is incorrect');
      } else if (e.code == 'network-request-failed') {
        throw const CustomException(message: 'No Internet Connection');
      } else {
        throw const CustomException(message: 'there is an error in logging in');
      }
    } catch (e) {
      log(
        'Error FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      throw const CustomException(message: 'there is an error in logging in');
    }
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isUserSignedIn() => FirebaseAuth.instance.currentUser != null;
}
