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
            ], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // Top bar with back button and title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, 
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8), 
                    const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: AppColors.milkyWhite,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), 
              // Main content with wider padding
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, 
                  ),
                  child: Column(
                    children: [
                      // Image above the text
                      Center(
                        child: Image.asset(
                          'assets/images/forgot_password.png', 
                          height: 300, 
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
                              Colors.white, 
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
