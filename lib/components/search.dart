import 'package:flutter/material.dart';
import 'package:prueba_tecnica/assets/styles/colors.dart';
import '../views/municipality_view.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Alinear el contenido del Row al centro horizontalmente
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Municipality(),
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(AppColors.background),
            ),
            child: const Row(
              children: [
                Icon(Icons.home),
                Text(
                  "Inicio",
                  style: TextStyle(color: AppColors.textColors),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
