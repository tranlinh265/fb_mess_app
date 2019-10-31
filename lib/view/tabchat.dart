import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabChatWidget extends StatefulWidget {
  @override
  _TabChatWidgetState createState() => _TabChatWidgetState();
}

class _TabChatWidgetState extends State<TabChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default"),
      ),
      body: Center(
        child: Text("Default"),
      ),
    );
  }
}
