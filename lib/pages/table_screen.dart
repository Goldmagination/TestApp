import 'dart:convert';

import 'package:aufgabe/pages/orientation/landscape_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TablePage extends StatefulWidget {
  static const routeName = '/table-page';
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TablePage> {
  List<dynamic> jsonData; //here will be saved result from json-decoding
  //load data from json-file
  Future<String> getJson() {
    return rootBundle.loadString('assets/adressen.json');
  }

  //get data from loaded file
  void _getData() async {
    var mydata = json.decode(await getJson());
    setState(() {
      jsonData = mydata['results'];
    });
  }

//initialize this data to the value to have a valuable when screen is opened
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Information about users"),
        ),
        //here we will see different screens depending on the position of our device
        body: LandScapeView(jsonData));
  }
}
