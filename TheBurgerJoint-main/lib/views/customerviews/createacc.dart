import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theburgerjoint/controllers/signup_controller.dart';
import 'package:theburgerjoint/widgets/text_fields/custom_text_field.dart';

class Createacc extends StatefulWidget {
  @override
  _CreateaccState createState() => _CreateaccState();
}

class _CreateaccState extends State<Createacc> {
  final controller = Get.put(SignupController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.formKey = formKey; // Assign formKey to the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Center(
                  child: Image.asset(
                    'assets/images/burgerlogo3.png',
                    width: 110,
                    height: 110,
                  ),
                ),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.nameController,
                  label: "Name",
                  focus: controller.nameFocus,
                  inputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.emailController,
                  label: "Email",
                  focus: controller.emailFocus,
                  inputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.addressController,
                  label: "Address",
                  focus: controller.addressFocus,
                  inputAction: TextInputAction.next,
                  textInputType: TextInputType.streetAddress,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.usernameController,
                  label: "Username",
                  focus: controller.usernameFocus,
                  inputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 20),
                Obx(
                  () => (CustomTextField(
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
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await controller.signUp(context);
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}