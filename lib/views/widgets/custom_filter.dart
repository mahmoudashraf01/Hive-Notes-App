import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
      child: Container(
        decoration: const BoxDecoration(
          color: transparent,
        ),
      ),
    );
  }
}
