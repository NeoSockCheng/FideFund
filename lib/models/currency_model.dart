import 'package:fidefund/utils/app_icons.dart';

enum Currency {
  btc(name: "Bitcoin", image: AppIcons.imageBTC, rate: 285000.0),
  eth(name: "Ethereum", image: AppIcons.imageETH, rate: 15000.0),
  usdc(name: "USD Coin", image: AppIcons.imageUSDC, rate: 4.18);

  final String name;
  final String image;
  final double rate;

  const Currency({required this.name, required this.image, required this.rate});

  static Currency fromString(String crypto) {
    switch (crypto.toLowerCase()) {
      case "btc":
        return Currency.btc;
      case "eth":
        return Currency.eth;
      case "usdc":
        return Currency.usdc;
      default:
        throw Exception("Unknown currency: $crypto");
    }
  }
}