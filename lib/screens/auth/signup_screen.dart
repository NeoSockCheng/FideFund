import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isDonor = true;
  int charityStep = 1;
  Map<String, String?> uploadedFiles = {};

  Future<void> _pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedFiles[key] = result.files.single.name;
      });
    }
  }

  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _registrationNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.darkBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button & Title
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ), // Adjust values as needed
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
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.milkyWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Toggle Buttons for Donor or Charity
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildToggleButton("Donor", isDonor, () {
                      setState(() {
                        isDonor = true;
                        charityStep = 1;
                      });
                    }),
                    const SizedBox(width: 10),
                    _buildToggleButton("Charity", !isDonor, () {
                      setState(() {
                        isDonor = false;
                      });
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                isDonor ? _buildDonorForm() : _buildCharityForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    String text,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.milkyWhite : Colors.grey.shade300,
        foregroundColor: isSelected ? AppColors.darkBlue : AppColors.darkBlue,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDonorForm() {
    return Column(
      children: [
        _buildTextField("First name", _firstNameController),
        _buildTextField("Last name", _lastNameController),
        _buildTextField("Email", _emailController),
        _buildTextField("Password", _passwordController, obscureText: true),
        _buildTextField(
          "Confirm password",
          _confirmPasswordController,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        _buildSubmitButton("Sign Up"),
      ],
    );
  }

  Widget _buildCharityForm() {
    if (charityStep == 1) {
      return Column(
        children: [
          _buildTextField("Organization name", _organizationNameController),
          _buildTextField("Registration number", _registrationNumberController),
          _buildTextField("Email", _emailController),
          _buildTextField("Phone number", _phoneNumberController),
          _buildTextField("Password", _passwordController, obscureText: true),
          _buildTextField(
            "Confirm password",
            _confirmPasswordController,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          _buildSubmitButton(
            "Next",
            onPressed: () {
              if (_organizationNameController.text.isEmpty ||
                  _registrationNumberController.text.isEmpty ||
                  _emailController.text.isEmpty ||
                  _phoneNumberController.text.isEmpty ||
                  _passwordController.text.isEmpty ||
                  _confirmPasswordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please fill in all fields")),
                );
              } else {
                setState(() {
                  charityStep = 2;
                });
              }
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          _buildFileUploadField("Upload Registration Certificate"),
          _buildFileUploadField("Upload Representative's ID"),
          _buildFileUploadField("Upload Proof of Authorization"),
          const SizedBox(height: 20),
          _buildSubmitButton("Sign Up"),
        ],
      );
    }
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.white,
          // prefixIcon: obscureText ? const Icon(Icons.lock) : null,
        ),
      ),
    );
  }

  Widget _buildFileUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => _pickFile(label),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const Icon(Icons.upload_file, color: Colors.black),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  uploadedFiles[label] ?? label,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(String text, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            // Navigate back to the login screen
            Navigator.pop(context);
          },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.milkyWhite,
        foregroundColor: AppColors.darkBlue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
