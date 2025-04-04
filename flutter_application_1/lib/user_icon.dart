import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  // ignore: use_super_parameters
  const UserIcon({
    Key? key,
    this.size = 80,
    this.backgroundColor = const Color(0xFFD8C8E8),
    this.iconColor = const Color(0xFF7E57C2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person_outline,
        size: size * 0.5,
        color: iconColor,
      ),
    );
  }
}

