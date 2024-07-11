import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  final String title;
  final VoidCallback onTap;

  const Categories({
    required this.onTap,
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          elevation: 5,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                )
              ),
            )
          )
        ),
      )
    );
  }
}