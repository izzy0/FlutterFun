import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Jordan',
      price: '236',
      imagePath: 'lib/images/air-jordan.png',
      description: 'wow, cool shoes here mate',
    ),
    Shoe(
      name: 'Air Jordan Pros',
      price: '226',
      imagePath: 'lib/images/air-jordan-2.jpg',
      description: 'wow, cool shoes here mate',
    ),
    Shoe(
      name: 'Low Dunks',
      price: '250',
      imagePath: 'lib/images/low-dunk.png',
      description: 'wow, cool shoes here mate',
    ),
    Shoe(
      name: 'Low Dunk 2\'s',
      price: '216',
      imagePath: 'lib/images/low-dunk-2.png',
      description: 'wow, cool shoes here mate',
    ),
    Shoe(
      name: 'THE COURT',
      price: '246',
      imagePath: 'lib/images/nike-court.png',
      description: 'wow, cool shoes here mate',
    ),
  ];

  // list of items in the user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
