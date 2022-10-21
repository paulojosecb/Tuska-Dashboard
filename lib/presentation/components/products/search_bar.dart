import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  Function onTap;

  SearchBar({super.key, required this.onTap});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            )),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: () {
            widget.onTap();
          },
          child: const Text("+ Produto"),
        )
      ],
    );
  }
}
