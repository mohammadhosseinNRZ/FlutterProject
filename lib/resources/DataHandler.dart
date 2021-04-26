import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:form_validation/models/Product.dart';

class DataHandler {
  static String response;
  static List myList;
  static List productList;
  // [
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image: "images/product-image.jpg"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  //   Product(
  //       description: "پودر خامه كيك و شيريني با طعم وانيل فلورا - 200 گرم",
  //       productId: 4839,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm"),
  //   Product(
  //       description: "پودر كيك رد ولوت رشد مقدار 600 گرم",
  //       productId: 4837,
  //       image:
  //           "http://37.152.187.237:7070/image/y4_k2si6wl1x5s/7d02c074b5b97d987d132fa108a9adf4_sm",
  //       price: 12800.0,
  //       offPercent: 10.0),
  // ];

  static readJson() async {
    response = await rootBundle.loadString('assets/productList.json');
    myList = await json.decode(response);
    producListFiller();
  }

  static void producListFiller() {
    productList = myList
        .map((e) => Product(
            count: 0,
            description: e["name"],
            image: "assets/1.jpeg",
            price: e["cost"],
            productId: e["productId"],
            offPercent: e["offPercent"]))
        .toList();
  }
}
