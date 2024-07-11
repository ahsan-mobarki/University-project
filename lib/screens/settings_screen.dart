import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key});

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
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                      'Setting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                title: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20
                  )
                ),
                trailing: Icon(Icons.keyboard_arrow_right)
              ),
              const Divider(indent: 8, endIndent: 8),
              const ListTile(
                title: Text(
                  'Currency',
                  style: TextStyle(
                    fontSize: 20
                  )
                ),
                trailing: Icon(Icons.keyboard_arrow_right)
              ),
              const Divider(indent: 8, endIndent: 8),
              const ListTile(
                title: Text(
                  'Units',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                trailing: Icon(Icons.keyboard_arrow_right)
              )
            ]
          ),
        ),
      )
    );
  }
}