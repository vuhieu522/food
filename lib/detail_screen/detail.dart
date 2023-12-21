import 'package:flutter/material.dart';
import 'package:foody/detail_screen/widget/card_body_details.dart';
import '../buttom_navigator/button_bar.dart';
import '../helper/assets_manager.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int indexSelected = 0;
  List<String> buttonText = [
    'Vegan',
    'Dairy Free',
    'Healthy',
    'Vegetarian',
    'Gluten Free',
    'Cheap',
  ];

  List<String> stepText = [
    'Step 1:',
    'Step 2:',
    'Step 3:',
    'Step 4:',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyBottomBar()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.star))],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Overview',
              ),
              Tab(
                text: 'Ingredients',
              ),
              Tab(
                text: 'Instructions',
              ),
            ],
          ),
          title: const Text('Details'),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        child: Image.asset(AssetsManager.foodDetail1, fit: BoxFit.fill,),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Instant Pot Rice Pilaf',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                        6,
                        (index) => Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  indexSelected = index;
                                });
                              },
                              icon: const Icon(
                                Icons.check_circle,
                              ),
                              color: indexSelected == index
                                  ? Colors.green
                                  : Colors.grey,
                              iconSize: 25,
                              splashRadius: 2,
                            ),
                            Text(
                              buttonText[index],
                              style: TextStyle(
                                color: indexSelected == index
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 108,
                        height: 108,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsManager.foodDetail2),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Cinnamon',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('1 Teaspoon'),
                          Text('1 Solid'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: stepText.length,
              itemBuilder: (context, index) {
                return CardDetails(stepName: stepText[index],);
              },
            ),
          ],
        ),
      ),
    );
  }
}

