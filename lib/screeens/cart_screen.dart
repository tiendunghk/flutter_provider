import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart.dart';
import 'package:flutter_provider/widgets/cart_item.dart' as CI;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cartScreen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text('${cart.totalAmount}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (_, index) => CI.CartItem(
                      id: cart.items.values.toList()[index]!.id,
                      title: cart.items.values.toList()[index]!.title,
                      quantity: cart.items.values.toList()[index]!.quantity,
                      price: cart.items.values.toList()[index]!.price),
                  itemCount: cart.items.length))
        ],
      ),
    );
  }
}
