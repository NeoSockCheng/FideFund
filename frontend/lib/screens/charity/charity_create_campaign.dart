import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fidefund/theme/colors.dart';

class CharityCreateCampaignPage extends StatefulWidget {
  @override
  _CharityCreateCampaignPageState createState() =>
      _CharityCreateCampaignPageState();
}

class _CharityCreateCampaignPageState extends State<CharityCreateCampaignPage> {
  final _formKey = GlobalKey<FormState>();
  bool isCreating = true;
  List<TextEditingController> milestoneNameControllers = [];
  List<TextEditingController> milestoneAmountControllers = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  TextEditingController milestoneController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Map<String, String?> uploadedFiles = {};

  Future<void> _pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedFiles[key] = result.files.single.name;
      });
    }
  }

  //Initialize the First Milestone
  @override
  void initState() {
    super.initState();
    addMilestone(); 
  }

  //Dispose Controllers to Prevent Memory Leaks
  @override
  void dispose() {
    for (var controller in milestoneNameControllers) {
      controller.dispose();
    }
    for (var controller in milestoneAmountControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Create a New Campaign",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),

              buildTextField("Campaign Title", titleController),
              const SizedBox(height: 12),
              buildTextField("Category", categoryController),
              const SizedBox(height: 12),
              buildTextField("About", aboutController, maxLines: 4),
              const SizedBox(height: 12),
              buildTextField("Goal of Campaign", goalController),
              const SizedBox(height: 12),

              //build milestone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Campaign Milestones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: List.generate(milestoneNameControllers.length, (
                      index,
                    ) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            // Milestone Name Field
                            Expanded(
                              flex: 3,
                              child: buildTextField(
                                "Milestone ${index + 1}",
                                milestoneNameControllers[index],
                              ),
                            ),
                            SizedBox(width: 10),
                            // Amount Field
                            Expanded(
                              flex: 1,
                              child: buildTextField(
                                "Amount",
                                milestoneAmountControllers[index],
                              ),
                            ),
                            SizedBox(width: 10),
                            // Add/Remove Buttons
                            if (index == milestoneNameControllers.length - 1 &&
                                milestoneNameControllers.length < 3)
                              IconButton(
                                icon: Icon(Icons.add, color: AppColors.green),
                                onPressed: addMilestone,
                              )
                            else if (milestoneNameControllers.length > 1)
                              IconButton(
                                icon: Icon(Icons.remove, color: AppColors.red),
                                onPressed: () => removeMilestone(index),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                "Campaign Period",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: buildTextField("Start Date", startDateController),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: buildTextField("End Date", endDateController),
                  ),
                ],
              ),
              SizedBox(height: 12),

              _buildFileUploadField("Upload Registration Certificate"),
              const SizedBox(height: 12),
              _buildFileUploadField("Upload Representative's ID"),
              const SizedBox(height: 12),
              _buildFileUploadField("Upload Proof of Authorization"),

              SizedBox(height: 50),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.secondaryBlue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
            validator: (value) {
              if (value == null || value.isEmpty)
                return "This field is required";
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildUploadSection(
    String title,
    String description,
    File? selectedFile,
    VoidCallback onUploadPressed,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.upload_file, size: 40, color: Colors.black54),
            onPressed: onUploadPressed,
          ),
          SizedBox(height: 8),
          Text(
            selectedFile != null
                ? "Selected: ${selectedFile.path.split('/').last}"
                : description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
              const Icon(Icons.upload_file, color: AppColors.black),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  uploadedFiles[label] ?? label,
                  style: const TextStyle(fontSize: 16, color: AppColors.black),
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

  void addMilestone() {
    if (milestoneNameControllers.length < 3) {
      setState(() {
        milestoneNameControllers.add(TextEditingController());
        milestoneAmountControllers.add(TextEditingController());
      });
    }
  }

  void removeMilestone(int index) {
    setState(() {
      milestoneNameControllers[index].dispose();
      milestoneAmountControllers[index].dispose();
      milestoneNameControllers.removeAt(index);
      milestoneAmountControllers.removeAt(index);
    });
  }
}
