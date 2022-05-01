class DataModel
{
  final String image;
  final String productName;
  final String size;
  final String color;
  final String price;
  final int quantity;

  DataModel(this.image, this.productName, this.size, this.color, this.price, this.quantity);

}

List<DataModel> data = [
  DataModel("assets/images/slim_jeans.jpg", "Miracle custom cut - Slim jeans for boys", "Medium - 34", "Original Blue", "700", 1),
  DataModel("assets/images/rugged_jacket.jpg", "Rugged handmade jacket", "Medium", "Original Blue", "800", 1)
];