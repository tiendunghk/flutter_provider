import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart.dart';
import 'package:flutter_provider/providers/products.dart';
import 'package:flutter_provider/screeens/cart_screen.dart';
import 'package:flutter_provider/widgets/badge.dart';
import 'package:flutter_provider/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TigerSugar'),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                Badge(child: ch!, value: cartData.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    )
                  ],
              onSelected: (typeSelected) {
                if (typeSelected == FilterOptions.Favorites) {
                  productContainer.showFavoritesOnly();
                } else {
                  productContainer.showAll();
                }
              },
              icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
