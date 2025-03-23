import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/controllers/charity_controller.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/models/charity_model.dart';

class CharityUpdateProfilePage extends StatelessWidget {
  CharityUpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // xxcontroller.method(parameter)
    final Charity charity = CharityController.getCharityById("charity_1");
    final Campaign campaign = CampaignController.getCampaignById("1");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Update Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Add edit functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Charity Name
            Text(
              charity.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Charity Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                campaign.coverImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // About Section
            Text(
              "About us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(charity.about),
            SizedBox(height: 20),

            // Reach Out Section
            Text(
              "Reach Out to Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text(charity.email),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 10),
                Text(charity.website ?? "No website available"),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(charity.phone),
              ],
            ),
            SizedBox(height: 20),

            // Campaign Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Projects",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      campaign.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(campaign.description),
                    SizedBox(height: 10),
                    Text(
                      "MYR ${campaign.raisedAmount} raised",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Goal: MYR ${campaign.targetAmount}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CharityUpdateProfilePage extends StatelessWidget {
//   CharityUpdateProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Update Profile"),
//         backgroundColor: Colors.blue, // You can change the color
//       ),
//       body: const Center(
//         child: Text(
//           "Update Charity Profile",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
