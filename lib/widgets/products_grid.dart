import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/products.dart';
import 'package:flutter_provider/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false).items;
    print('rebuild');
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: productsData[i],
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10.0),
      itemCount: productsData.length,
    );
  }
}