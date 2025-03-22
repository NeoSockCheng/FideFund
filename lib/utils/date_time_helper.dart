import 'dart:math';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static final Random _random = Random();

  /// Generates a random date within the past [days] range (default: 30 days).
  static DateTime randomPastDate({int days = 30}) {
    return DateTime.now().subtract(Duration(
      days: _random.nextInt(days),
      hours: _random.nextInt(24),
      minutes: _random.nextInt(60),
    ));
  }

  /// Generates a random date within the next [days] range (default: 30 days).
  static DateTime randomFutureDate({int days = 30}) {
    return DateTime.now().add(Duration(
      days: _random.nextInt(days),
      hours: _random.nextInt(24),
      minutes: _random.nextInt(60),
    ));
  }

  /// Generates a random future date within a wider range (default: 90 to 365 days).
  static DateTime randomLongFutureDate({int minDays = 90, int maxDays = 365}) {
    return DateTime.now().add(Duration(
      days: minDays + _random.nextInt(maxDays - minDays),
      hours: _random.nextInt(24),
      minutes: _random.nextInt(60),
    ));
  }

  /// Formats a DateTime into a readable string (e.g., "21 Mar 2025, 14:30").
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
  }

  /// Formats a DateTime into a simple date string (e.g., "21 Mar 2025").
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  /// Returns a human-readable time difference (e.g., "5 minutes ago", "3 days ago").
  static String timeAgo(DateTime dateTime) {
    final Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} seconds ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else {
      return '${diff.inDays} days ago';
    }
  }

  static String formatDateYearMonthDay(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }
}
