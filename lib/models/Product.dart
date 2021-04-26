import 'package:hive/hive.dart';
part 'Product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  int productId;
  @HiveField(1)
  String description;
  @HiveField(2)
  int count;
  @HiveField(3)
  int price;
  @HiveField(5)
  int offPercent;
  @HiveField(4)
  String image;
  Product({
    this.offPercent,
    this.productId,
    this.description,
    this.count,
    this.price,
    this.image,
  });
}
