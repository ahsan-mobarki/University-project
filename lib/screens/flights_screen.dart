import 'package:flutter/material.dart';

class FlightsScreen extends StatefulWidget{
  const FlightsScreen({super.key});

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffdfe3ff),
              Color(0xffdfe3ff),
              Color(0xffe3ffff),
            ]
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Flights',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: SearchBar(
                      hintText: 'Search...',
                      hintStyle: WidgetStateProperty.all(
                        const TextStyle(
                          fontStyle: FontStyle.italic,
                        )
                      ),
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: (){}
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ]
          )
        ),
      )
    );
  }
}