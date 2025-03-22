import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.darkBlue,
            ], // Gradient Colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              // Top bar with back button and title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, // Reduced horizontal padding for top bar
                  vertical: 10.0, // Small vertical padding
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8), // Small space
                    const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 18, // Smaller size
                        fontWeight: FontWeight.bold,
                        color: AppColors.milkyWhite,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Space between top bar and content
              // Main content with wider padding
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, // Wider padding for main content
                  ),
                  child: Column(
                    children: [
                      // Image above the text
                      Center(
                        child: Image.asset(
                          'assets/images/forgot_password.png', // Replace with your image asset
                          height: 300, // Adjust size
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Instruction Text
                      const Center(
                        child: Text(
                          "Enter your email to reset your password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: AppColors.milkyWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Email Input
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Rounded border
                          ),
                          prefixIcon: const Icon(Icons.email),
                          filled: true,
                          fillColor:
                              Colors.white, // White background for input field
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 50),

                      // Reset Password Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement password reset logic
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: AppColors.milkyWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
