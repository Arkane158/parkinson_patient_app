import 'package:flutter/material.dart';

class ServicesWidgets extends StatelessWidget {
  const ServicesWidgets(
      {super.key, required this.imagePath, required this.tittle});
  final String imagePath;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            width: size.width * .3,
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            tittle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
