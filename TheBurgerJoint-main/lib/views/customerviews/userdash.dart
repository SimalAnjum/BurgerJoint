import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theburgerjoint/views/auth/login.dart';
import 'package:theburgerjoint/views/customerviews/profile.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({Key? key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    Future<void> _getUserData(BuildContext context) async {
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final userData = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
          final address = userData.data()?['address'] ?? 'No address available';
          final contactNumber = userData.data()?['contact_number'] ?? 'No contact number available';
          final email = userData.data()?['email'] ?? 'No email available';

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                userName: userName,
                address: address,
                contactNumber: contactNumber,
                email: email,
              ),
            ),
          );
        }
      } catch (error) {
        print("Error fetching user data: $error");
        // Handle error
      }
    }

    Widget buildIconButton(IconData icon, String label) {
      return ElevatedButton.icon(
        onPressed: () {
          if (label == 'User Profile') {
            _getUserData(context); // Call method to retrieve user data
          } else {
            // Handle other button clicks
            // ...
          }
        },
        icon: Icon(icon),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          minimumSize: Size(200, 55), // Set a fixed size for all buttons
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Existing UI elements
          SizedBox(height: 5),
          Center(
            child: Image.asset(
              'assets/images/burgerlogo3.png',
              width: 200,
              height: 200,
            ),
          ),
          Text(
            'The Burger Joint',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome $userName!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 70),
          Container(
            width: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconButton(Icons.account_circle, 'User Profile'),
                    buildIconButton(Icons.shopping_cart, 'Place Order'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconButton(Icons.history, 'Order History'),
                    buildIconButton(Icons.star, 'Reviews'),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              // Logout user
              await FirebaseAuth.instance.signOut();
              // Navigate to the login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 24,
            ),
            label: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              minimumSize: Size(150, 50), // Set a fixed size for all buttons
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
