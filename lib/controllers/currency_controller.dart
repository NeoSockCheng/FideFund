import 'package:fidefund/models/currency_model.dart';
import 'package:fidefund/utils/app_icons.dart';

class CurrencyController {
  
  static List<Currency> mockCurrencies = [
    Currency(
      symbol: 'BTC',
      name: 'Bitcoin',
      myrRate: 100000.00, 
      icon: AppIcons.iconBTC, 
    ),
    Currency(
      symbol: 'ETH',  
      name: 'Ethereum',  
      myrRate: 2500.00,  
      icon: AppIcons.iconETH,  
    ),
    Currency(
      symbol: 'USDC', 
      name: 'USD Coin',  
      myrRate: 0.75,  
      icon: AppIcons.iconUSDC,  
    ),
  ];

  static Currency? getCurrencyBySymbol(String symbol) {
    try {
      return mockCurrencies.firstWhere((currency) => currency.symbol == symbol);
    } catch (e) {
      return null; 
    }
  }
}