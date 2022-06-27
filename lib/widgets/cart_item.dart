import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text('$price'),
            )),
          ),
          title: Text(title),
          subtitle: Text('Total: ${(price * quantity)}'),
          trailing: Text('$quantity'),
        ),
      ),
    );
  }
}
