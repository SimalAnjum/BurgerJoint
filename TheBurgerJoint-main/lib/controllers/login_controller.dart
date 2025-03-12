import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theburgerjoint/views/adminviews/admindash.dart';
import 'package:theburgerjoint/views/customerviews/userdash.dart'; // Import the customer dashboard view

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.add.obs;
  final GlobalKey<FormState> globalKey = GlobalKey();

  void showOrHidePassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.visibility : Icons.visibility_off;
  }

  Future<void> allowAdminToLogin(BuildContext context) async {
  try {
    // Display a loading snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Loading...",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.deepPurple,
        duration: Duration(seconds: 5),
      ),
    );

    // Sign in with email and password
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // Get current user
    final User? currentUser = userCredential.user;

    if (currentUser != null) {
      // Check if the user is an admin in Firestore
      final adminSnapshot = await FirebaseFirestore.instance.collection("admins").doc(currentUser.uid).get();

      // Get user data from Firestore
      final userData = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();

      if (adminSnapshot.exists) {
        // Navigate to AdminDashboard if admin exists
        Navigator.push(context, MaterialPageRoute(builder: (c) => const AdminDashboard()));
      } else {
        // Get the username from the user data
        final username = userData.data()?['username'];

        // Navigate to CustomerDashboard with the username
        Navigator.push(context, MaterialPageRoute(builder: (c) => CustomerDashboard(userName: username)));
      }
    }
  } on FirebaseAuthException catch (error) {
    // Show error message if login fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Error Occurred: ${error.message}",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
}