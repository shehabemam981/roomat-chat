import 'package:flutter/material.dart';

class settingview extends StatefulWidget {
static const String RouteName="setting";
  @override
  State<settingview> createState() => _settingviewState();
}

class _settingviewState extends State<settingview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting"),
      ),
    );
  }
}
