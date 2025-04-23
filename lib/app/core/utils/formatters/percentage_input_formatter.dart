import 'package:flutter/services.dart';

class PercentageInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String numeric = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeric.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final formatted = '$numeric%';

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length - 1),
    );
  }
}
