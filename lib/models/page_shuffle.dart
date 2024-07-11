import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/profile_screen.dart';

class PageShuffle extends StatefulWidget{
  const PageShuffle({super.key});

  @override
  State<PageShuffle> createState() => _PageShuffleState();
}

class _PageShuffleState extends State<PageShuffle>{
  int selectedIndex = 0;
  List pages = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index){
          setState((){
            selectedIndex = index;
          });
        },
        items: const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          )
        ]
      )
    );
  }
}