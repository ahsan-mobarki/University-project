import 'package:flutter/material.dart';
import 'search_bar_screen.dart';
import '../services/recommendations.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  final FocusNode _onTapFocus = FocusNode();

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Places',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.blue[900]
                      )
                    ),
                    const SizedBox(height: 10),
                    SearchBar(
                      focusNode: _onTapFocus,
                      hintText: 'Search...',
                      hintStyle: WidgetStateProperty.all(
                        const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        )
                      ),
                      trailing: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 5)
                      ],
                      onTap: (){
                        setState((){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchBarScreen()
                            )
                          );
                        });
                        _onTapFocus.unfocus();
                      }
                    ),
                  ]
                )
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Near You',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index){
                            return const Recommendations.inside(
                              isRow: false,
                              showSaveButton: true,
                              width: 250,
                              insideContainerHeight: 80,
                              insideContainerWidth: double.maxFinite,
                              title: Text(
                                'place',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                )
                              ),
                              title2: Text(
                                'Features',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )
                              ),
                            );
                          }
                        )
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Trending Places',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )
                        )
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index){
                          return Recommendations.inside(
                            isRow: false,
                            showSaveButton: true,
                            insideContainerHeight: 80,
                            insideContainerWidth: double.maxFinite,
                            title: Text(
                              'place ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              )
                            ),
                          );
                        }
                      )
                    ]
                  )
                )
              )
            ]
          )
        ),
      )
    );
  }
}