import 'package:flutter/material.dart';

class VariantButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final bool isSelected;
  final bool isTrue;
  final bool isFalse;

  const VariantButton({
    super.key,
    required this.name,
    required this.onTap,
    required this.isSelected,
    required this.isTrue,
    required this.isFalse,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isTrue ? Colors.green : (isFalse ? Colors.red : Colors.white),
          borderRadius: BorderRadius.circular(6),
          border: isTrue
              ? null
              : Border.all(
                  color: isSelected ? Colors.black : Colors.white,
                  width: 2,
                ),
        ),
        width: double.infinity,
        height: 56,
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isTrue
                ? Colors.white
                : (isSelected ? Colors.black : Colors.grey),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
