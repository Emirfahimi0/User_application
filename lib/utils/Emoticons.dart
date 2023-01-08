import 'package:flutter/material.dart';
import 'package:user_application/Home_pages/UserProfile.dart';


class EmoticonFace extends StatelessWidget {
  final String emoticonFace;

  const EmoticonFace({Key? key,
  required this.emoticonFace
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(emoticonFace,
            style:TextStyle(
              fontSize: 14,
              color: Colors.blue[600]
            ),
        ),
      ),

      );
  }
}
