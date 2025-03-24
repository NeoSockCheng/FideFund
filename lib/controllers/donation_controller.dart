import 'package:fidefund/models/donation_model.dart';

class DonationController {

  static List<Donation> mockDonation = [
    Donation(
      id: 'donation_1',
      amount: 0.05,
      currency: 'BTC',
      donorId: 'donor_1',
      charityId: 'charity_1',
      txnHash: '0xkdfaskduheknlsdflkasdf',
      note:
          'Wishing all cancer patients strength and courage in their journey. May this donation help bring hope and healing',
      myrRate: 1500.00,
      createdAt: DateTime(2025, 3, 21, 14, 30, 0),
    ),
    Donation(
      id: 'donation_2',
      amount: 0.05,
      currency: 'ETH',
      donorId: 'donor_2',
      charityId: 'charity_3',
      txnHash: '0xdsfsdfsdfsdkasdf',
      note:
          'Every small act counts! Let\'s recycle and give back to those in need. Together, we can create a cleaner and kinder world.',
      myrRate: 3000.00,
      createdAt: DateTime(2025, 2, 5, 20, 14, 0),
    ),
    Donation(
      id: 'donation_3',
      amount: 0.20,
      currency: 'USDC',
      donorId: 'donor_3',
      charityId: 'charity_2',
      txnHash: '0xsdakfsdjfk128374h3j',
      note:
          'May this contribution bring relief and comfort to those facing hardships. A little kindness goes a long way.',
      myrRate: 6000.00,
      createdAt: DateTime(2024, 7, 5, 8, 30, 0),
    ),
    Donation(
      id: 'donation_4',
      amount: 0.01,
      currency: 'BTC',
      donorId: 'donor_4',
      charityId: 'charity_4',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'Everyone deserves love, care, and support. Hoping this donation helps those affected by HIV/AIDS find strength and a brighter future.',
      myrRate: 3000.00,
      createdAt: DateTime(2023, 3, 12, 15, 25, 10),
    ),
    Donation(
      id: 'donation_5',
      amount: 0.08,
      currency: 'ETH',
      donorId: 'donor_5',
      charityId: 'charity_2',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'Education, food, and shelter should be accessible to all. ',
      myrRate: 1400.00,
      createdAt: DateTime(2025, 3, 21, 23, 00, 00),
    ),
    Donation(
      id: 'donation_6',
      amount: 15.20,
      currency: 'USDC',
      donorId: 'donor_6',
      charityId: 'charity_2',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'May this small gesture bring hope to those who need it most.',
      myrRate: 700.00,
      createdAt: DateTime(2025, 2, 18, 00, 00, 25),
    ),
    Donation(
      id: 'donation_7',
      amount: 0.015,
      currency: 'BTC',
      donorId: 'donor_7',
      charityId: 'charity_2',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'No child should grow up alone. Wishing all children a loving and warm family to call their own.',
      myrRate: 4500.00,
      createdAt: DateTime(2025, 1, 23, 6, 3, 54),
    ),
    Donation(
      id: 'donation_8',
      amount: 0.02,
      currency: 'ETH',
      donorId: 'donor_8',
      charityId: 'charity_3',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'Food waste is preventable, and hunger is solvable. May this contribution help feed more people in need.',
      myrRate: 360.00,
      createdAt: DateTime(2025, 1, 1, 1, 23, 12),
    ),
    Donation(
      id: 'donation_9',
      amount: 0.50,
      currency: 'USDC',
      donorId: 'donor_9',
      charityId: 'charity_5',
      txnHash: '0xdfkjsdfiou239jdss',
      note:
          'Sending love and prayers to those affected by disasters and crises. May this donation aid in relief efforts and healing.',
      myrRate: 235.00,
      createdAt: DateTime(2025, 1, 1, 1, 23, 12),
    ),
  ];

  static List<Donation> getDonationsSortedByMyr() {
    mockDonation.sort((a, b) => (b.myrRate).compareTo(a.myrRate));
    return mockDonation.take(10).toList();
  }

}