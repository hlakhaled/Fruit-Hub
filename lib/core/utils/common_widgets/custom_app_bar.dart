import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Styles.style19),
      centerTitle: true,
      actions: [Icon(Icons.arrow_forward_ios_rounded), SizedBox(width: 8)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
