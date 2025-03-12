import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String contactNumber;
  final String email;
  final String address;

  const ProfilePage({
    Key? key,
    required this.userName,
    required this.contactNumber,
    required this.email,
    required this.address,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _userNameController;
  late TextEditingController _contactNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: widget.userName);
    _contactNumberController = TextEditingController(text: widget.contactNumber);
    _emailController = TextEditingController(text: widget.email);
    _addressController = TextEditingController(text: widget.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Existing widgets
            SizedBox(height: 5),
            Center(
              child: Image.asset(
                'assets/images/burgerlogo3.png',
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Profile page',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            buildProfileField("User Name", _userNameController),
            SizedBox(height: 10),
            buildProfileField("Contact Number", _contactNumberController),
            SizedBox(height: 10),
            buildProfileField("Email Address", _emailController),
            SizedBox(height: 10),
            buildProfileField("Address", _addressController),
            SizedBox(height: 30),
            _isEditing ? buildSaveButton() : buildEditButton(),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField(String labelText, TextEditingController controller) {
    return Center(
      child: Card(
        color: Colors.white,
        child: Container(
          width: 550,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Center(
                  child: TextField(
                    controller: controller,
                    enabled: _isEditing,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isEditing = true;
        });
      },
      child: Text(
        'Edit',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () async {
        // Update user data in Firestore
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).update({
          'username': _userNameController.text,
          'contact_number': _contactNumberController.text,
          'email': _emailController.text,
          'address': _addressController.text,
        });

        // Show Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Changes saved successfully!',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
                    
        );

        setState(() {
          _isEditing = false;
        });
      },
      child: Text(
        'Save',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
