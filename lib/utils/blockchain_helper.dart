import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class BlockchainHelper {
  /// Generates a mock hash for blockchain transaction
  static String generateMockHash() {
    String randomData =
        DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(100000).toString();
    return sha256.convert(utf8.encode(randomData)).toString();
  }

  /// Converts a full hash string to a shortened format (4 chars + ... + 4 chars)
  static String shortenHash(String hash) {
    if (hash.length <= 8) return hash;
    return hash.substring(0, 4) + "..." + hash.substring(hash.length - 4);
  }

  /// Directly get a shorten hash
  static String generateShortenHash() {
    return shortenHash(generateMockHash());
  }
}
