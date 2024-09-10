import 'package:foddie_app/Models/CartItems.dart';

class Cart {
  int getTotalPrice() {
    int sum = 0;

    for (int i = 0; i < CartLists.length; i++) {
      sum = sum + CartLists[i].price;
    }

    return sum;
  }

  double getDiscountedPrice() {
    double sum = 0;

    for (int i = 0; i < CartLists.length; i++) {
      sum = sum + CartLists[i].price;
    }

    double discount = sum * 0.20;

    sum = sum - discount;

    return sum;
  }
}

List<CartItem> CartLists = [];
