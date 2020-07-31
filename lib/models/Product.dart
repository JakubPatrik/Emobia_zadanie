class Product{

  Product.fromJson(Map <dynamic, dynamic> json):
    this.name = json["name"],
    this.price = json["price"],
    this.regular_price = json["regular_price"],
    this.image = json["image"];

  String name;
  var price;
  double regular_price;
  String image;

  @override
  String toString() {
    return super.toString();
  }

}