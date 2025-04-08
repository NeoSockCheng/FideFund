import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/screens/auth/login_screen.dart'; 

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildProfileHeader(),
          SizedBox(height: 10),
          Expanded(
            child: _buildProfileOptions(context),
          ),
        ],
      ),
    );
  }

  /// Profile Header Section
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.white,
                  child: Icon(Icons.edit, color: AppColors.primaryBlue, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Skeleton",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  /// Profile Menu Options
  Widget _buildProfileOptions(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        _buildListTile(Icons.currency_exchange_outlined, "My Transaction"),
        _buildListTile(Icons.notifications, "Charity Update"),
        _buildListTile(Icons.lock, "Identity Verification"),
        _buildListTile(Icons.nightlight_round, "Preferences"),
        _buildListTile(Icons.settings, "Settings"),
        _buildListTile(Icons.logout, "Logout", onTap: () => _handleLogout(context)),
      ],
    );
  }

  /// Custom ListTile Builder with optional onTap callback
  Widget _buildListTile(IconData icon, String title, {VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 24, color: Colors.black),
          title: Text(title, style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
      ],
    );
  }

  /// Logout Handler
  void _handleLogout(BuildContext context) {
    // Navigate to LoginPage and clear navigation history
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false, // Removes all previous routes
    );
  }
}
