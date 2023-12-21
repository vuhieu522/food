import 'package:flutter/material.dart';
import 'package:foody/buttom_navigator/widget/filter_chip.dart';
import 'widget/card_body.dart';
import '../button_appbar/search_delegate.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<String> mealTypes = [
    'Main course',
    'Snack',
    'Desert',
    'Appetizer',
    'Drink',
    'Salad',
  ];

  List<String> dietTypes = [
    'Vegan',
    'Vegetarian',
    'Ketogenic',
    'Dairy Free',
    'Gluten Free',
    'Paleo',
    'Facto-Vegetarian'
  ];

  List<String> filters = [
    'ALL',
    'Newest',
    'Top Rated',
    'Most Popular',
    'Trendy',
    'Most Liked',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(
              Icons.search,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.filter_list,
                              size: 24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Filters',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 5,
                          children: List.generate(
                            6,
                            (index) =>
                                filterChipWidget(chipName: filters[index]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('APPLY'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.filter_list,
              size: 24,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CardBody(isSelected: selectedIndex == index,));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      height: 367,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Meal type',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 5,
                              children: List.generate(
                                6,
                                (index) => filterChipWidget(
                                  chipName: mealTypes[index],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Die type',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 5,
                              children: List.generate(
                                6,
                                (index) => filterChipWidget(
                                    chipName: dietTypes[index]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('APPLY'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: const Icon(Icons.restaurant),
      ),
    );
  }
}
