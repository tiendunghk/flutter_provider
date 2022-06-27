import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Mint Tiger-M',
        description: 'tuyệt vời', price: 30250,
        imageUrl: 'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2022051817174655356/detail/menueditor_item_81656cdb7a2e42e88ff3f2fb31812ba5_1652894532188991923.webp'
    ),
    Product(
        id: 'p2',
        title: 'Trà sữa kem trứng nướng-M',
        description: 'ngon lắm khách hàng nên thử và đánh giá 5 sao đồng hành cùng cửa hàng ạ',
        price: 30250,
        imageUrl: 'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2022051817155155953/detail/menueditor_item_c78ec6b911cd45718a034f4b59ca56f5_1652894238095256357.webp'
    ),
    Product(
        id: 'p3',
        title: 'rất ngon ạ',
        description: 'tuyệt vời',
        price: 35750,
        imageUrl: 'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2022051817164853280/detail/menueditor_item_65635b68a9994365a5a85d4ea110407d_1652894184589612229.webp'
    ),
    Product(
        id: 'p4',
        title: 'Sữa tươi nướng tiger - M',
        description: 'ngon lắm ạ',
        price: 33000,
        imageUrl: 'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2022051817143793922/detail/menueditor_item_aa299dd765ab45d497e096765e4c4fac_1652894043115786471.webp'
    ),
    Product(
        id: 'p5',
        title: 'Trà sữa nướng Tiger M',
        description: 'rất ngon ạ',
        price: 30250,
        imageUrl: 'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2022051817134579402/detail/menueditor_item_78bed03b89204ef88fe4f645a2ae1607_1652893994137277395.webp'
    )
  ];

  var _showFavoritesOnly = false;
  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((element) => element.isFavorite).toList();
    }
    return [..._items];
  }

  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  void addProduct(Product value) {
    _items.add(value);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}