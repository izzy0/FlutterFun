import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_ecom/components/shoe_tile.dart';
import 'package:shoe_ecom/models/shoe.dart';

import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert user, shoe was added to the cart
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.green,
          size: 30,
        ),
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          // hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.shoeShop.length,
              itemBuilder: (context, index) {
                // get a shoe from the shop list
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
