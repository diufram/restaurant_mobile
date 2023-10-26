import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';

class MyButtonI extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButtonI({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: secundaryColor, borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
