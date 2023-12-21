import 'package:flutter/material.dart';
import '../../detail_screen/detail.dart';
import '../../helper/assets_manager.dart';

class CardBody extends StatefulWidget {


  CardBody({super.key, required this.isSelected});

  bool isSelected = false;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: widget.isSelected ? Colors.blue[400] : null,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsManager.foodImage),
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailScreen()));
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  'Instant Pot Rice Pilaf',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?',
                  style: TextStyle(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                        Text('100'),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                        ),
                        Text('45'),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.eco,
                          color: Colors.green,
                        ),
                        Text('Vegan'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
