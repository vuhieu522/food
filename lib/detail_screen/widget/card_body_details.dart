import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
   const CardDetails({
    super.key,
    required this.stepName,
  });

  final String stepName;

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Container(
        width: 380,
        height: 180,
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
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
                  child: Text(widget.stepName),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  style: TextStyle(
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