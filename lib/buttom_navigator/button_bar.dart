import 'package:flutter/material.dart';
import 'package:foody/buttom_navigator/favorites.dart';
import 'package:foody/buttom_navigator/joke.dart';
import 'package:foody/buttom_navigator/recipes.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int myCurrentIndex = 0;
  List pages = [
    const RecipesPage(),
    const FavoritesPage(),
    const JokePage(),
  ];

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            selectedFontSize: 22,
            unselectedFontSize: 15,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined), label: 'Recipes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tag_faces_rounded), label: 'Joke'),
            ]),
        body: pages[myCurrentIndex],
      );
}
