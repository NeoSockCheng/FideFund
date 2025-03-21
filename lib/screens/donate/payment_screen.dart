import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCryptoSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donate To",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "Girls' Education Fundraising Project",
              style: TextStyle(fontSize: 20, color: AppColors.black),
            ),
            SizedBox(height: 20),
            
            // Payment method toggle
            Row(
              children: [
                _buildPaymentMethodButton(
                  icon: Image.asset('assets/icons/payment/binance.png', height: 30),
                  label: "Binance Pay",
                  isSelected: isCryptoSelected,
                  onPressed: () => setState(() => isCryptoSelected = true),
                ),
                SizedBox(width: 10),
                _buildPaymentMethodButton(
                  icon: Icon(Icons.credit_card, size: 30),
                  label: "Credit/Debit Card",
                  isSelected: !isCryptoSelected,
                  onPressed: () => setState(() => isCryptoSelected = false),
                ),
              ],
            ),
            SizedBox(height: 30),
            
            // Payment form
            isCryptoSelected ? _buildCryptoForm() : _buildCardForm(),
            
            SizedBox(height: 40),
            
            // Terms and Continue button
            Row(
              children: [
                Icon(Icons.check_circle, color: AppColors.darkBlue, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "By proceeding the donation, you agree with our Terms of Use and Privacy Policy.",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text("Continue", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodButton({
    required Widget icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.darkBlue : AppColors.lightGrey,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 12),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _buildCryptoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(
          label: "Crypto",
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/currency/icon_btc.png', height: 24),
              SizedBox(width: 10),
              Text("BTC", style: TextStyle(fontSize: 20)),
              SizedBox(width: 6),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text("Rate: 1 BTC = MYR 384,113.61", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        SizedBox(height: 16),
        Center(child: Text("≈", style: TextStyle(fontSize: 20, color: Colors.grey[600]))),
        SizedBox(height: 16),
        _buildInputField(
          label: "Amount",
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/payment/icon_myr.png', height: 24),
              SizedBox(width: 10),
              Text("MYR", style: TextStyle(fontSize: 20)),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(
          label: "Amount",
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/payment/icon_myr.png', height: 24),
              SizedBox(width: 10),
              Text("MYR", style: TextStyle(fontSize: 20)),
              SizedBox(width: 20),
            ],
          ),
        ),
        SizedBox(height: 16),
        _buildInputField(label: "CARD NUMBER", hintText: "1234 1234 1234 1234"),
        SizedBox(height: 16),
        _buildInputField(label: "CARDHOLDER NAME", hintText: "Name"),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildInputField(label: "EXPIRE DATE", hintText: "MM / YY"),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _buildInputField(label: "CVV", hintText: "123"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.darkBlue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.darkBlue, width: 1.5),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}