import 'package:coffemasters_flutter/datamanager.dart';
import 'package:coffemasters_flutter/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    Product p = Product(id: 1, name: "Coffee", price: 200, image: "");
    Product q = Product(id: 1, name: "Black Coffee", price: 200, image: "");
    Product t = Product(
      id: 1,
      name: "Another Black Coffee",
      price: 200,
      image: "",
    );

    return ListView(
      children: [
        ProductItem(product: p, onAdd: () {}),
        ProductItem(product: q, onAdd: () {}),
        ProductItem(product: t, onAdd: () {}),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${product.price}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                    ),
                    child: Text("Add", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
