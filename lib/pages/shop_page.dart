import 'package:shoe_store/components/shoe_tile.dart';
import 'package:shoe_store/models/cart.dart';
import 'package:shoe_store/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Successfully added!'),
            content: Text('Check your cart'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              //search bar
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Search", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              //message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  "Everyone flies... some fly longer than others.",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              //hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              //list of shoes
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
                child: Divider(color: Colors.white),
              ),
            ],
          ),
    );
  }
}
