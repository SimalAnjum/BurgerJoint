import 'package:flutter/material.dart';

class Forgotpass extends StatelessWidget {
  const Forgotpass({Key? key}); // Added Key? key

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
            'Recover your account', // Updated title text
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          buildCardField("Username", "Enter your username"),
          SizedBox(height: 20),
          buildCardField("Email", "Enter your email"),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
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
            onPressed: () {},
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
    );
  }

  Widget buildCardField(String labelText, String hintText) {
    return Center(
      child: Card(
        color: Colors.white, // Set card background color to white
        child: Container(
          width: 550, // Set width of the container
          padding: EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Align children vertically to the center
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children with space between
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, // Set text color to black
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 300, // Set constant width of the text field
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.black38), // Set hint text color to black38
                    border: InputBorder.none, // Remove border for text field
                  ),
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
