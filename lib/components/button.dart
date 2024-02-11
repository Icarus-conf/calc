import 'package:calc/components/text_format.dart';
import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  const KButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF468faf),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: () {
        onPressed(label);
      },
      child: PoppinsText(
        text: label,
        fontS: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
