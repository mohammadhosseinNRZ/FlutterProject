import 'package:flutter/material.dart';
import 'package:form_validation/pages/LoginProfile.dart';
import 'package:form_validation/pages/searchpage/SearchPage.dart';

class AppBody extends StatefulWidget {
  String username;
  AppBody(this.username);
  @override
  State<StatefulWidget> createState() {
    return AppBodyState();
  }
}

class AppBodyState extends State<AppBody> with SingleTickerProviderStateMixin {
  TabController _myTabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myTabController = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Colors.blue[200],
            child: TabBar(
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                controller: _myTabController,
                tabs: [
                  Tab(icon: Icon(Icons.portrait)),
                  Tab(icon: Icon(Icons.search)),
                  Tab(icon: Icon(Icons.shop))
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _myTabController, children: [
              LoginProfile(false),
              SearchPage(widget.username),
              Text("asd")
            ]),
          )
        ],
      ),
    );
  }
}
