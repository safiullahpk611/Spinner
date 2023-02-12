import 'package:flutter/material.dart';
import 'package:spinzy/core/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final buttonTitle, onPress;
  const CustomButton({super.key, this.buttonTitle, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
          height: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 2.0,
                spreadRadius: 2.0,
              ), //BoxShadow//BoxShadow
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFFBA40), Color(0xFFFFBA40)]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "BurgerQueen",
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}
