import 'package:flutter/material.dart';
import 'package:prueba_tecnica/assets/styles/colors.dart';
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Center(
        child: Image.asset('lib/assets/icons/principal_icon.png',
        height: 64),
      ),
      actions: const [SizedBox(
        width: 48,
      )],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

