import 'package:flutter/material.dart';
import 'package:mobileapp/colors.dart';

class back extends StatelessWidget {
  const back({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 70, width: 70, margin: const EdgeInsets.only(
      top: 16,
      left: 16
    ),
      decoration: BoxDecoration(
      color: Colours.scaffoldBgColor,
        borderRadius: BorderRadius.circular(8), // Correct usage
      ),
      child: IconButton(onPressed: () {
        Navigator.pop(context);
      },
       icon: const Icon(Icons.arrow_back)),
    
    );
  }
}
