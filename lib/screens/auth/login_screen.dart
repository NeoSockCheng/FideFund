import 'package:flutter/material.dart';
import 'package:fidefund/screens/main_screen.dart';
import 'package:fidefund/screens/auth/forgot_password_screen.dart';
import 'package:fidefund/screens/auth/signup_screen.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/screens/charity_main_screen.dart'; // Import Charity Homepage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = "donor"; // Default selected role

  Widget _buildToggleButton(
    String text,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? AppColors.milkyWhite : Colors.grey.shade300,
          foregroundColor: AppColors.darkBlue,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryBlue, AppColors.darkBlue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.milkyWhite,
                    ),
                  ),
                  Text(
                    "Welcome to FideFund!",
                    style: TextStyle(fontSize: 18, color: AppColors.milkyWhite),
                  ),
                  SizedBox(height: 60),
                ],
              ),

              // Login Section
              const Text(
                "Login as...?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.milkyWhite,
                ),
              ),
              const SizedBox(height: 30),

              //Toggle button
              // 🔹 Role Selection (Toggle Button)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToggleButton("Donor", selectedRole == "donor", () {
                    setState(() {
                      selectedRole = "donor";
                    });
                  }),
                  const SizedBox(width: 10),
                  _buildToggleButton("Charity", selectedRole == "charity", () {
                    setState(() {
                      selectedRole = "charity";
                    });
                  }),
                ],
              ),

              const SizedBox(height: 30),
              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 15),

              // Password TextField
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
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
                    style: TextStyle(color: AppColors.milkyWhite),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button with Role-Based Navigation
              ElevatedButton(
                onPressed: () {
                  if (selectedRole == "donor") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Main()),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CharityMain()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color(0xFFF8F6E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                    style: TextStyle(color: AppColors.milkyWhite),
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
