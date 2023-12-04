import 'package:flutter/material.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SizedBox(child: SearchField())),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.local_grocery_store),
            iconSize: 30,
            color: Color.fromRGBO(250, 241, 228, 5),
          ),
        ],
      ),
    );
  }
}
