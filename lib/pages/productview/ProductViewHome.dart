import 'package:flutter/material.dart';
import 'package:form_validation/models/Product.dart';
import 'package:form_validation/pages/productview/DescriptionWidget.dart';

class ProductViewHome extends StatelessWidget {
  Product _myProduct;
  ProductViewHome(this._myProduct);
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width * 0.7,
            height: height * 0.51,
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 60),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                )
              ],
            ),
            child: FittedBox(
              // fit: BoxFit.fill,
              child: Image.asset("assets/1.jpeg"),
            ),
          ),
          DescriptionWidget(_myProduct, _myProduct.price != null)
        ],
      ),
    );
  }
}
