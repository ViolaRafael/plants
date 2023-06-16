import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/plants.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late List<Plant> plants;

  @override
  void initState(){
    //TODO: implement initState
    super.initState();
        plants = [];
  }
  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    // ...
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
