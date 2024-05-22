import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int id;

  const CardBody(
      {super.key,
        required this.title,
        required this.imageUrl,
        required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.network(
                  imageUrl,
                  height: 150,
                  fit: BoxFit.fitHeight,
                )),
            Expanded(
              flex: 2,
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20),
                      maxLines: 2,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Icon(
                              Icons.favorite,
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
                        SizedBox(width: 15),
                        Column(
                          children: <Widget>[
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
            ),
          ],
        ),
      ),
    );
  }
}
