import 'package:flutter/material.dart';
import 'package:foody/helper/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JokePage extends StatelessWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         AppLocalizations.of(context)!.joke,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 24,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AssetsManager.foodDetail1),
              fit: BoxFit.cover,
            )),
          ),
          const Positioned(
            top: 250,
            left: 10.0,
            right: 10.0,
            child: Card(
                child: SizedBox(
              width: 380,
              height: 217,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.',
                      style: TextStyle(fontSize: 20, letterSpacing: 0.5),
                    ),
                    Align(alignment: Alignment.bottomRight, child: Text('1/1/2023', textAlign: TextAlign.center,)),
                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
