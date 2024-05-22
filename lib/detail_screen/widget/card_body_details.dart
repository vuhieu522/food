import 'package:flutter/material.dart';

import '../../model/instruction_model.dart';

class CardDetails extends StatelessWidget {
  final List<RecipeStep> stepMeal;
  final String nameMeal;
  final int index;

  const CardDetails(
      {super.key, required this.nameMeal, required this.stepMeal, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Container(
        width: 380,
        height: 180,
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.check_circle,
                color: Colors.lightGreen,
                size: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text('Number: ${stepMeal[index].number}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    nameMeal,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  stepMeal[index].step,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
