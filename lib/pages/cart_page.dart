import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartIem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartIem['imageUrl'].toString()),
                radius: 30,
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete Product"),
                            content: Text(
                                "Are you sure to remove product from your cart? "),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: Text("No")),
                              TextButton(onPressed: () {
                                Provider.of<CartProvider>(context, listen: false).removeProduct(cartIem);
                                Navigator.of(context).pop();
                              }, child: Text("Yes"))
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              title: Text(
                cartIem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size: ${cartIem['size']}'),
            );
          }),
    );
  }
}
