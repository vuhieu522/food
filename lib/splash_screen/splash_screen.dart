import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../buttom_navigator/button_bar.dart';
import '../helper/assets_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyBottomBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.deepPurple[800],
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.splashImage),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Image.asset(
                AssetsManager.foodLogo,
                fit: BoxFit.fitHeight,
              ),
            ),
            const CupertinoActivityIndicator(
              radius: 20,
              color: Colors.white70,
            ),
          ],
        ),
      ],
    );
  }
}