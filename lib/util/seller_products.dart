class AddProducts {
  String image;
  String category;
  String price;

  AddProducts(
    this.image,
    this.category,
    this.price,
  );

  Map<String, dynamic> toJson() => {
        'image': image,
        'category': category,
        'price': price,
      };
}
