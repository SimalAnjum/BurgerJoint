import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  RxBool obscureText = true.obs;
  Rx<IconData> suffixIcon = Icons.add.obs;

  GlobalKey<FormState>? formKey; // Add this property

  void showOrHidePassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.visibility : Icons.visibility_off;
  }

  Future<void> signUp(BuildContext context) async {
    print('Starting signUp() function');

    if (formKey == null) {
      print('Form key is null');
      return;
    }

    if (!formKey!.currentState!.validate()) {
      print('Form validation failed');
      return;
    }

    print('Form validation successful');

    try {
      // Display a loading snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Creating account...",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          backgroundColor: Colors.deepPurple,
          duration: Duration(seconds: 5),
        ),
      );

      // Sign up with email and password
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Get current user
      final User? currentUser = userCredential.user;

      if (currentUser != null) {
        // Perform additional actions like saving user data to Firestore
        // Here, you can use Firestore or any other backend service to store user data
        // Example:
        await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.uid)
            .set({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "address": addressController.text.trim(),
          "username": usernameController.text.trim(),
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Account created successfully!",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
        );
      }
    } on FirebaseAuthException catch (error) {
      // Show error message if signup fails
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