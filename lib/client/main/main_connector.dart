import 'package:flutter/material.dart';

class MainConnector extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main connector'),
      ),
      body: Center(child: Text('Hello!'),),
    );
  }

}