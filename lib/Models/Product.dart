class Product {
  String imagePath;
  String title;
  int starLength;
  String comments;
  String description;
  int price;

  Product(
      {required this.imagePath,
      required this.title,
      required this.starLength,
      required this.comments,
      required this.description,
      required this.price});
}

List<Product> Products = [
  Product(
      price: 500,
      imagePath: "assets/9.jpg",
      title: "Break Fast",
      starLength: 4,
      comments: "1234 comments",
      description: "hi lets do breakfast"),
  Product(
      price: 400,
      imagePath: "assets/10.jpg",
      title: "Frice",
      starLength: 5,
      comments: "2395 comments",
      description: "very tasty frice"),
  Product(
      price: 600,
      imagePath: "assets/4.jpg",
      title: "Juice",
      starLength: 3,
      comments: "7345 comments",
      description: "Delious Juice"),
  Product(
      price: 800,
      imagePath: "assets/5.jpg",
      title: "Burger",
      starLength: 2,
      comments: "2375 comments",
      description: "very tasty Burger yummy"),
];

Product Search(String Name) {
  for (int i = 0; i < Products.length; i++) {
    if (Name == Products[i].title) {
      print("Product Found!");
      return Products[i];
    }
  }

  return Product(
      imagePath: "1",
      title: "",
      starLength: 0,
      comments: "",
      description: "",
      price: 0);
}
