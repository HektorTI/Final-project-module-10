import 'package:flutter/material.dart';

import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0;
  double _left = 0;
  String text = 'Olá';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Column(children: [
              Image.asset(
                'assets/image/pic_slide.jpg',
                fit: BoxFit.cover,
              ),
            ]),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: () {
                // ignore: avoid_print
                print('TOP= $_top LEFT = $_left');
              },
              onPanUpdate: (details) {
                _top = max(0, _top + details.delta.dy);
                _left = max(0, _left + details.delta.dx);
                // ignore: avoid_print
                print('TOP= $_top LEFT = $_left');
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.add_reaction,
                  color: Colors.blueAccent,
                  size: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
