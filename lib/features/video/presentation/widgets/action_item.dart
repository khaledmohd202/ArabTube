import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionItem extends StatelessWidget {
  const ActionItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title, icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * .014,
            ),
          )
        ],
      ),
    );
  }
}
