import 'package:flutter/material.dart';
import 'package:foody/buttom_navigator/favorites.dart';
import 'package:foody/buttom_navigator/joke.dart';
import 'package:foody/buttom_navigator/recipes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.menu_book_outlined), label: AppLocalizations.of(context)!.recipes),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.star), label: AppLocalizations.of(context)!.favorites),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.tag_faces_rounded), label: AppLocalizations.of(context)!.joke),
            ]),
        body: pages[myCurrentIndex],
      );
}
