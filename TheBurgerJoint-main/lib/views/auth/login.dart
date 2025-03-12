import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theburgerjoint/controllers/login_controller.dart';
import 'package:theburgerjoint/views/customerviews/createacc.dart';
import 'package:theburgerjoint/widgets/text_fields/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // Initialize controller
  final controller = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/images/2.png', 
              width: 300,
              height: 300,
            ),
            Text(
              'Log-In', // Updated title text
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'Kanit',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Container(
            width: 600,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email field
                CustomTextField(
                  controller: controller.emailController, 
                  label: 'Email Address', 
                  focus: controller.emailFocus, 
                  inputAction: TextInputAction.next, 
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                // Password field
                Obx(() => CustomTextField(
                  controller: controller.passwordController, 
                  label: 'Password', 
                  focus: controller.passwordFocus, 
                  inputAction: TextInputAction.done, 
                  textInputType: TextInputType.visiblePassword,
                  obsecureText: controller.obscureText.value,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.showOrHidePassword();
                    }, 
                    icon: Icon(
                      controller.suffixIcon.value,
                      color: Colors.grey, 
                      size: 40.0,
                    ),
                  ),
                )),
              ],
            ),
          ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await controller.allowAdminToLogin(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Add functionality for creating account
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Createacc()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text('Create Account'),
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    // Add functionality for resetting password
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  
}
