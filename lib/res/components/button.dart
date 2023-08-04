import 'package:flutter/material.dart';

import '../color/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.color = AppColor.primaryColor,
      this.width = 60,
      this.heigth = 40,
      required this.text,
      required this.onPress,
      required this.loading});
  final heigth;
  final width;
  final VoidCallback onPress;
  final Color color;
  final String text;
  final loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: heigth,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading ?const Center(child: CircularProgressIndicator()) : Center(child: Text(text,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),),
      ),
    );
  }
}
