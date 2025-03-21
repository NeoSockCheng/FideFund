import 'package:fidefund/screens/main_screen.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/screens/auth/forgot_password_screen.dart'; // Updated import
import 'package:fidefund/screens/auth/signup_screen.dart'; // Updated import

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply a gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryBlue,
              AppColors.darkBlue,
            ], // Light to dark blue gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Greeting Text (Hello! Welcome to FideFund)
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.milkyWhite, // Darker blue for contrast
                    ),
                  ),
                  Text(
                    "Welcome to FideFund!",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.milkyWhite, // Matching color tone
                    ),
                  ),
                  SizedBox(height: 80), // Add spacing before the login section
                ],
              ),

              // Login Section
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.milkyWhite,
                ),
              ),
              const SizedBox(height: 15),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded border
                  ),
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white, // White background for input field
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 15),

              // Password TextField
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded border
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white, // White background for input field
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),

              // Forgot Password?
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: AppColors.milkyWhite,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Temporary navigation to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Color(
                    0xFFF8F6E3,
                  ), // Light color to stand out
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFF2C5E72),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Sign Up Button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text(
                    "Don’t have an account? Sign up",
                    style: TextStyle(
                      color: AppColors.milkyWhite,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
