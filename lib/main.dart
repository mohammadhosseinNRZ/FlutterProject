import 'package:flutter/material.dart';

import 'package:form_validation/models/Product.dart';
import 'package:form_validation/pages/AppBody.dart';
import 'package:form_validation/pages/LoginProfile.dart';
import 'package:form_validation/resources/DataHandler.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

String cardListBox = "cardListbox";
String userNames = "userNames";
String viewedItems = "viewedItems";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>(cardListBox);
  await Hive.openBox(userNames);
  await Hive.openBox<Product>(viewedItems);
  DataHandler.readJson();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "test",
      home: FutureBuilder(
        future: Hive.openBox("UserNames"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            } else {
              return Scaffold(
                body: Hive.box(userNames).isEmpty
                    ? LoginProfile(true)
                    : AppBody(Hive.box(userNames).getAt(0)),
              );
            }
          } else {
            return Scaffold(
              backgroundColor: Colors.blue,
            );
          }
        },
      ),
    );
  }
}
