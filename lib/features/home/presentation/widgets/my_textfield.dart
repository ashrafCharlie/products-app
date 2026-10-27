import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Search products here...",
                  filled: true,
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15,)
                  )
                ),
              );
  }
}