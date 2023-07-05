import 'package:flutter/material.dart';
import 'package:money/constant/size.dart';

class LottoNumberContainer extends StatelessWidget {
  const LottoNumberContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.orange,
          width: 5,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size24,
          ),
        ),
      ),
    );
  }
}
