import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.maxDigits = 10});
  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    final oldValueText = oldValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String newValueText = newValue.text;

    // We manually remove the value we want to remove
    // If oldValueText == newValue.text it means we deleted a non digit number.
    if (oldValueText == newValue.text) {
      newValueText = newValueText.substring(0, newValue.selection.end - 1) +
          newValueText.substring(newValue.selection.end, newValueText.length);
    }

    double value = double.parse(newValueText);
    final formatter = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
