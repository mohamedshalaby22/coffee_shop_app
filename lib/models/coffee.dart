class Coffee {
  String name;
  String price;
  String imagePath;
  int quantity;
  int id;
  Coffee(
      {required this.name,
      required this.price,
      required this.id,
      required this.imagePath,
      this.quantity = 1});
}
