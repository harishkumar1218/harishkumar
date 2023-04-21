import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class trend extends StatefulWidget {
  const trend({super.key});

  @override
  State<trend> createState() => _trendState();
}

class _trendState extends State<trend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending page'),
        backgroundColor: Color.fromARGB(255, 190, 113, 238),
      ),
    );
  }
}
