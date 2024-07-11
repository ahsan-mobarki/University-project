import 'package:flutter/material.dart';
import 'flights_screen.dart';
import '../services/recommendations.dart';
import '../services/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Travel App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.blue[900],
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.flight, color: Colors.blue[900]!),
                        iconSize: 35,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FlightsScreen()
                            )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Categories(
                              title: 'place',
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Popular destinations',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Recommendations.inside(
                              isRow: false,
                              width: 150,
                              insideContainerHeight: 80,
                              insideContainerWidth: double.maxFinite,
                              showSaveButton: true,
                              title: Text(
                                'place',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              title2: Text(
                                'Country',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Places You Might Like',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: double.maxFinite,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Recommendations.outside(
                              isRow: true,
                              height: 150,
                              outsideFirstContainerHeight: double.maxFinite,
                              outsideFirstContainerWidth: 100,
                              outsideSecondContainerHeight: double.maxFinite,
                              outsideSecondContainerWidth: MediaQuery.of(context).size.width - 110,
                              showSaveButton: true,
                              title: const Text(
                                'place',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              title2: const Text(
                                'A summary of features that describes the best things about the place which is shown in the card or suggestion',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
