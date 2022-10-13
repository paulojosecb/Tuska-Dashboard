import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Function onTap;

  SearchBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 2,
          child: SearchBarTextField(),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: const Text("+ Produto"),
        )
      ],
    );
  }
}

class SearchBarTextField extends StatefulWidget {
  const SearchBarTextField({super.key});

  @override
  State<SearchBarTextField> createState() => _SearchBarTextFieldState();
}

class _SearchBarTextFieldState extends State<SearchBarTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("aaaaa"),
          SizedBox(
            width: 8,
          ),
          SizedBox(
            child: Icon(
              Icons.search,
            ),
          )
        ],
      ),
    );
  }
}
