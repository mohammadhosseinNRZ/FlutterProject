import 'package:flutter/material.dart';
import 'package:form_validation/models/Product.dart';
import 'package:form_validation/pages/productview/ProductViewHome.dart';
import 'package:hive/hive.dart';

class ProductWidget extends StatelessWidget {
  Function _stateCall;
  Product _myProduct;
  bool _isViewed;
  ProductWidget(this._myProduct, this._stateCall, this._isViewed);
  void _itemDescriptionNavigate(BuildContext context) async {
    Hive.box<Product>("viewedItems").put(_myProduct.productId, _myProduct);
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductViewHome(_myProduct);
    }));
    _stateCall();
  }

  void _deleteViewed() {
    Hive.box<Product>("viewedItems").delete(_myProduct.productId);
    _stateCall();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _itemDescriptionNavigate(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 100,
              width: 100,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(_myProduct.image)),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    _myProduct.description,
                    overflow: TextOverflow.clip,
                  ),
                ),
                _myProduct.price != null
                    ? Column(
                        children: [
                          Text("price : " + _myProduct.price.toString()),
                          _myProduct.offPercent != 0
                              ? Column(
                                  children: [
                                    Text("offcent : " +
                                        _myProduct.offPercent.toString()),
                                    Text("price with offcent : " +
                                        (_myProduct.price *
                                                (100 - _myProduct.offPercent) /
                                                100)
                                            .toString())
                                  ],
                                )
                              : SizedBox()
                        ],
                      )
                    : Text("no item found")
              ],
            ),
            _isViewed
                ? GestureDetector(
                    onTap: _deleteViewed, child: Icon(Icons.close))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
