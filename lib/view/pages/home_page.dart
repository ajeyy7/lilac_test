import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.sort),
          actions: [Icon(Icons.notifications_none)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                BoxContainer(
                  image: 'assets/images/1.png',
                  text: '100',
                  text1: 'total vehicles',
                ),
                BoxContainer(
                  image: 'assets/images/2.png',
                  text: '50',
                  text1: 'total vehicles',
                )
              ],
            ),
            Row(
              children: [
                BoxContainer(
                  image: 'assets/images/3.png',
                  text: '25',
                  text1: 'total vehicles',
                ),
                BoxContainer(
                  image: 'assets/images/4.png',
                  text: '35',
                  text1: 'total vehicles',
                )
              ],
            ),
          ],
        ));
  }
}

class BoxContainer extends StatelessWidget {
  final String image;
  final String text;
  final String text1;

  const BoxContainer(
      {super.key,
      required this.image,
      required this.text,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text1,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
