import 'package:coffemasters_flutter/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product p = Product(id: 1, name: "Coffee", price: 200, image: "");

    return ProductItem(product: p);
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Image.asset("images/black_coffee.png"),
            Text(product.name),
            Text("\$${product.price}"),
          ],
        ),
      ),
    );
  }
}
