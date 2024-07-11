import 'package:flutter/material.dart';

class VisitedPlacesScreen extends StatelessWidget{
  const VisitedPlacesScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visited Places'
        )
      ),
      body: const Center(
        child: Text(
          'Visited Places'
        ),
      )
    );
  }
}