import 'package:flutter/material.dart';
import 'package:form_validation/models/Product.dart';

class DescriptionWidget extends StatefulWidget {
  Product _myProduct;
  bool _inStock;
  DescriptionWidget(this._myProduct, this._inStock);
  @override
  State<StatefulWidget> createState() {
    return DiscriptionWIdgetState();
  }
}

class DiscriptionWIdgetState extends State<DescriptionWidget> {
  void _stateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget._myProduct.description,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget._inStock ? "Price Details : " : "out of stock",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              SizedBox(
                width: 65,
                child: Visibility(
                  visible: widget._myProduct.count == 0 ? false : true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget._myProduct.count = --widget._myProduct.count;
                          _stateChanged();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Icon(Icons.remove)),
                      ),
                      Text(
                        "${widget._myProduct.count}",
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget._myProduct.count = ++widget._myProduct.count;
                          _stateChanged();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: SingleChildScrollView(
                  child: widget._myProduct.price != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("price : " +
                                widget._myProduct.price.toString()),
                            widget._myProduct.offPercent != 0
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("offPercent : " +
                                          widget._myProduct.offPercent
                                              .toString()),
                                      Text("price with offPercent : " +
                                          (widget._myProduct.price *
                                                  (100 -
                                                      widget._myProduct
                                                          .offPercent) /
                                                  100)
                                              .toString())
                                    ],
                                  )
                                : SizedBox()
                          ],
                        )
                      : Text("no item found"))),
          Row(
            children: [
              Visibility(
                visible: (widget._myProduct.count < 1 && widget._inStock)
                    ? true
                    : false,
                child: ElevatedButton(
                  onPressed: () {
                    widget._myProduct.count = ++widget._myProduct.count;
                    _stateChanged();
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 40)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text(
                    "Add to cart",
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
