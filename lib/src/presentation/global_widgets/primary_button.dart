import 'package:basic_authentication_flutter_challenge/src/presentation/global_widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Color? lableColor;
  final bool isLoading;
  final Function() onPressed;

  const PrimaryButton({
    super.key,
    this.isLoading = false,
    this.lableColor,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: isLoading
            ? const LoadingIndicator()
            : Text(
                label,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: lableColor,
                ),
              ),
      ),
    );
  }
}
