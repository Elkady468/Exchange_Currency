import 'package:exchange/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.onChanged});
  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.end,
      onChanged: onChanged,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
      style: Styles.Mediume18(context),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(right: 6),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffE9E9E9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0),
        ),
      ),
    );
  }
}
