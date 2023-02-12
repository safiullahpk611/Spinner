import 'package:flutter/material.dart';
import 'package:spinzy/core/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final hintText;
  const CustomTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: greyColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: "WorkSans",
              color: greyColor,
            )
          ),
        ),
      ),
    );
  }
}
