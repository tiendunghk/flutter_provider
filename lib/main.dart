import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart.dart';
import 'package:flutter_provider/providers/products.dart';
import 'package:flutter_provider/screeens/cart_screen.dart';
import 'package:flutter_provider/screeens/product_detail_screen.dart';
import 'package:flutter_provider/screeens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.pink, accentColor: Colors.deepPurple),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen()
        },
      ),
    );
  }
}
