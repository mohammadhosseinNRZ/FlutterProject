import 'package:flutter/material.dart';
import 'package:form_validation/main.dart';
import 'package:form_validation/models/Product.dart';
import 'package:form_validation/pages/searchpage/ProductWidget.dart';
import 'package:form_validation/resources/DataHandler.dart';
import 'package:hive/hive.dart';

class SearchPage extends StatefulWidget {
  String userName;
  SearchPage(this.userName);
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  List searchProductsList = <Product>[];
  final _myController = TextEditingController();
  var _myBox = Hive.box<Product>(viewedItems);
  void _changeState() {
    setState(() {});
  }

  void _searchedProducts(String searchedString) {
    // print(searchedString);
    searchProductsList = <Product>[];
    if (searchedString != null && searchedString != "") {
      DataHandler.productList.forEach((element) {
        if ((element as Product).description.contains(searchedString)) {
          searchProductsList.add(element as Product);
          print((element as Product).description);
        }
      });
    }
    _changeState();
  }

  Product _productChoose(int index) {
    if (searchProductsList.isNotEmpty) {
      return searchProductsList[index];
    } else if (_myBox.isNotEmpty) {
      return Hive.box<Product>(viewedItems).getAt(index);
    } else
      return DataHandler.productList[index];
  }

  int _listViewCount() {
    if (searchProductsList.isNotEmpty)
      return searchProductsList.length;
    else if (_myBox.isNotEmpty)
      return _myBox.length;
    else
      return DataHandler.productList.length;
  }

  ProductWidget _listViewfunction(BuildContext context, int index) {
    return ProductWidget(_productChoose(index), _changeState,
        (_myBox.isNotEmpty && searchProductsList.isEmpty) ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue[900], Colors.blue[200]]),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue[400],
                )
              ],
            ),
            padding: EdgeInsets.all(15),
            child: Expanded(
              child: Column(children: [
                Text(widget.userName),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                        width: 200,
                        height: 30,
                        child: TextField(
                          controller: _myController,
                          onChanged: _searchedProducts,
                        ))
                  ],
                ),
              ]),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _listViewCount(),
              itemBuilder: _listViewfunction)
        ],
      ),
    );
  }
}
