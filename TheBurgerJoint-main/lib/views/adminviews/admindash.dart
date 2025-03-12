import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theburgerjoint/views/auth/login.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}); // Added Key? key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 5),
          Center(
            child: Image.asset(
              'assets/images/burgerlogo3.png',
              width: 200,
              height: 200,
            ),
          ),
          Text(
            'The Burger Joint', // Updated title text
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome Admin!',
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
                    buildIconButton(Icons.settings, 'Manage Orders'),
                    buildIconButton(Icons.menu_book, 'Manage Menu'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconButton(Icons.star, 'Reviews'),
                    buildIconButton(Icons.bar_chart, 'Sales Report'),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              // Logout admin
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
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
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
}
