import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foody/detail_screen/widget/card_body_details.dart';
import '../buttom_navigator/button_bar.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import '../model/detail_modal.dart';
import '../model/instruction_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<RecipeDetails> fetchDetail(int id) async {
  String apiUrl =
      'https://api.spoonacular.com/recipes/$id/information?apiKey=26aa0d4d45a5481a9f34bfdd4a2aee50';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return RecipeDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Detail');
  }
}

Future<List<Recipe>> fetchInstruction(int id) async {
  String apiUrl =
      'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=26aa0d4d45a5481a9f34bfdd4a2aee50';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<Recipe> instructions = jsonResponse.map((item) {
      return Recipe.fromJson(item);
    }).toList();
    return instructions;
  } else {
    throw Exception('Failed to load Instructions');
  }
}


class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final subject = BehaviorSubject<RecipeDetails>();
  final subject2 = BehaviorSubject<List<Recipe>>();


  List<String> buttonText = [
    'Vegan',
    'Dairy Free',
    'Healthy',
    'Vegetarian',
    'Gluten Free',
    'Cheap',
  ];


  @override
  void initState() {
    super.initState();
    fetchApi();
    fetchApi2();
  }

  void fetchApi() async {
    final result = await fetchDetail(widget.id);
    subject.add(result);
  }

  void fetchApi2() async {
    final result2 = await fetchInstruction(widget.id);
    subject2.add(result2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyBottomBar()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.star))],
          bottom: TabBar(
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.overview,
              ),
              Tab(
                text: AppLocalizations.of(context)!.ingredients,
              ),
              Tab(
                text: AppLocalizations.of(context)!.instructions,
              ),
            ],
          ),
          title:  Text(AppLocalizations.of(context)!.details),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<RecipeDetails>(
              stream: subject,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                } else {
                  RecipeDetails result = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            child: Image.network(result.image ?? ''),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 370,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 330,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          result.title ?? '',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: double.infinity,
                        height: 100,
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          children: List.generate(
                            buttonText.length,
                                (index) => Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.check_circle,
                                  ),
                                  color: result.listpotrice[index]
                                      ? Colors.green
                                      : Colors.grey,
                                  iconSize: 25,
                                  splashRadius: 2,
                                ),
                                Text(
                                  buttonText[index],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          AppLocalizations.of(context)!.description,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          result.instructions ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            StreamBuilder<RecipeDetails>(
              stream: subject,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.extendedIngredients?.length,
                  itemBuilder: (context, index) {
                    var ingredient = snapshot.data!.extendedIngredients![index];
                    return Card(
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 108,
                            height: 108,
                            child: Image.network(ingredient.getFullLinkImage()),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 250,
                                child: Text(
                                  ingredient.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('1 Teaspoon'),
                              const Text('1 Solid'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            StreamBuilder<List<Recipe>>(
              stream: subject2,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                }
                List<Recipe> instructions = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: instructions.length,
                  itemBuilder: (context, index) {
                    Recipe instruction = instructions[index];
                    return CardDetails(
                      index: index,
                      nameMeal: instruction.name,
                      stepMeal: instruction.steps,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
