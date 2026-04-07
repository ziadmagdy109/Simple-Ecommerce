class Accessories {
  late num id;
  late dynamic title;
  late num price;
  late String thumbnail;

  Accessories({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  Accessories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json['title'];
    price = json["price"];
    thumbnail = json["thumbnail"];
  }
}
