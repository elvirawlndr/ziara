import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(int amount) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11 || phoneNumber.length == 12) {
      return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)} ${phoneNumber.substring(8)}';
    }
    return phoneNumber;
  }
}