class Product {
  late int id;
  late String title;
  late String description;
  late num price;
  late String thumbnail;

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
    thumbnail = json["thumbnail"];
  }
}
