import 'package:flutter/material.dart';

class DiseaseResultScreen extends StatelessWidget {
  const DiseaseResultScreen({super.key});
  static const String screenName = "DiseaseScreen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease result'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * .03, horizontal: size.width * .04),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/disease_result1.png')),
            SizedBox(
              height: size.height * .03,
            ),
            const Image(image: AssetImage('assets/images/disease_result2.png')),
          ],
        ),
      ),
    );
  }
}
