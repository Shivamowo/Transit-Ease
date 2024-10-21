import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isCaptchaChecked = false; // Simulates CAPTCHA verification

  // Function to handle login and navigation to HomePage
  void _handleSignIn() {
    if (_isCaptchaChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Navigate to HomePage
      );
    } else {
      // Show alert if CAPTCHA is not checked
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("CAPTCHA Required"),
          content: Text("Please verify that you are not a robot."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: SingleChildScrollView(
        // Scroll view to handle overflow with keyboard
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bus image icon
              Container(
                height: 150,
                child: Image.asset(
                    'lib/assets/bus.png'), // Add your bus icon in assets
              ),
              SizedBox(height: 40),

              // Username text field
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password text field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // CAPTCHA placeholder (using a switch to simulate CAPTCHA)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: _isCaptchaChecked,
                    onChanged: (bool value) {
                      setState(() {
                        _isCaptchaChecked = value;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    "I'm not a robot",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Sign In button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[900],
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _handleSignIn, // Call the sign-in handler
                child: Text('Sign In'),
              ),

              SizedBox(height: 20),

              // Sign up text
              GestureDetector(
                onTap: () {
                  // Handle sign up tap
                },
                child: Text(
                  "Not Already an user? Sign up",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page (After successful sign in)

