import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(home: CreateImpactReportPage()));
}

class CreateImpactReportPage extends StatefulWidget {
  @override
  _CreateImpactReportPageState createState() => _CreateImpactReportPageState();
}

class _CreateImpactReportPageState extends State<CreateImpactReportPage> {
  int _selectedMilestone = 1; 
  final _formKey = GlobalKey<FormState>();
  bool isCreating = true;
  Map<String, String?> uploadedFiles = {};

  Future<void> _pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedFiles[key] = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Create Impact Report",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black, 
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Campaign Title
              buildSectionTitle("Campaign Title"),
              buildDisabledTextField("Girls’ Education Fundraising Project"),

              // Category
              buildSectionTitle("Category"),
              buildDisabledTextField("Education"),

              // Campaign Milestones
              buildSectionTitle("Campaign Milestones"),
              buildMilestoneTile(1, "Buy mouse for students", "MYR20,000"),
              const SizedBox(height: 10),
              buildMilestoneTile(2, "Buy keyboard for students", "MYR40,000"),
              const SizedBox(height: 10),
              buildMilestoneTile(3, "Buy speaker for students", "MYR60,000"),
              const SizedBox(height: 10),
              buildMilestoneTile(4, "Buy monitor for students", "MYR80,000"),

              // About Section
              buildSectionTitle("About"),
              buildLargeInputField(),

              // Upload Financial Proof
              buildSectionTitle("Upload Financial Proof"),
              _buildFileUploadField(
                "upload relevant documents for verification (maximum 10MB)",
              ),

              // Upload Photos & Videos
              buildSectionTitle("Upload Photos & Videos"),
              _buildFileUploadField("upload relevant photos (maximum 10MB)"),

              SizedBox(height: 50),

              // Create Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showCreatingDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                    backgroundColor: AppColors.darkBlue,
                  ),
                  child: Text(
                    "Create Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build section title
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Function to build a read-only text field
  Widget buildDisabledTextField(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: AppColors.black)),
    );
  }

  // Function to build a milestone tile
  Widget buildMilestoneTile(int value, String milestone, String amount) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: _selectedMilestone,
          activeColor: AppColors.darkBlue,
          onChanged: (int? newValue) {
            setState(() {
              _selectedMilestone = newValue!;
            });
          },
        ),
        Expanded(child: buildDisabledTextField(milestone)),

        // Add spacing after milestone
        SizedBox(width: 10),

        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.secondaryBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            amount,
            style: TextStyle(fontSize: 16, color: AppColors.black),
          ),
        ),

        const SizedBox(width: 8),
      ],
    );
  }

  Widget buildLargeInputField() {
    return TextFormField(
      maxLines: 5, 
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, 
        ),
        hintText: "Enter details here...",
        contentPadding: EdgeInsets.all(12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field cannot be empty";
        }
        return null;
      },
    );
  }

  Widget _buildFileUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () => _pickFile(label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryBlue,
              width: 1.5,
            ), 
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondaryBlue, 
          ),
          child: Row(
            children: [
              const Icon(Icons.upload_file, color: AppColors.grey),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  uploadedFiles[label] ?? label,
                  style: const TextStyle(fontSize: 16, color: AppColors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreatingDialog() {
    setState(() {
      isCreating = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                isCreating = false; 
              });
            });

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isCreating
                        ? CircularProgressIndicator()
                        : Icon(
                          Icons.check_circle,
                          color: AppColors.green,
                          size: 50,
                        ),
                    SizedBox(height: 16),
                    Text(
                      isCreating ? "Creating..." : "Created Successfully!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                if (!isCreating)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
