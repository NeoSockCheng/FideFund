import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/models/campaign_model.dart';

class PaymentPage extends StatefulWidget {
  final Campaign report;

  const PaymentPage({Key? key, required this.report}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCryptoSelected = true;
  bool isTnCChecked = false;
  double btcRate = 384113.61;
  TextEditingController cryptoController = TextEditingController();
  TextEditingController myrController = TextEditingController();

  void _convertCryptoToMYR(String value) {
    if (value.isEmpty) {
      myrController.clear();
      return;
    }
    double btc = double.tryParse(value) ?? 0;
    myrController.text = (btc * btcRate).toStringAsFixed(2);
  }

  void _convertMYRToCrypto(String value) {
    if (value.isEmpty) {
      cryptoController.clear();
      return;
    }
    double myr = double.tryParse(value) ?? 0;
    cryptoController.text = (myr / btcRate).toStringAsFixed(8);
  }

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(), 
    child: Scaffold(
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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Donate To",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.report.title,
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
              isCryptoSelected ? _buildCryptoForm() : _buildCardForm(),
              SizedBox(height: 40),
              // Terms and Continue button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTnCChecked = !isTnCChecked;
                      });
                    },
                    child: Icon(
                      isTnCChecked ? Icons.check_circle : Icons.circle_outlined,
                      color: AppColors.darkBlue,
                      size: 20,
                    ),
                  ),
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
                onPressed: isTnCChecked ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Continue", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
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
        minimumSize: Size(0, 60), 
        padding: EdgeInsets.symmetric(horizontal: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 12),
          Flexible(
            child: Text(
              label, 
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
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
          controller: cryptoController,
          onChanged: _convertCryptoToMYR,
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
          controller: myrController,
          onChanged: _convertMYRToCrypto,
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
    TextEditingController? controller,
    Function(String)? onChanged,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
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