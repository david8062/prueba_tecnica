import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.grey,
            onPressed: () {
              // Add your search functionality here
            },
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese el Municio o DANE',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
