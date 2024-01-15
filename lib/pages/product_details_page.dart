import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void onTap() {
    if(selectedSize!=0){
      Provider.of<CartProvider>(context, listen: false)
        .addProduct(
          {
    'id':widget.product['id'],
    'title':widget.product['title'],
    'price': widget.product['price'],
    'imageUrl':widget.product['imageUrl'],
    'Company':widget.product['company'],
    'size':selectedSize
  
        }
        );
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to cart")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select size")));
    }
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Image.asset(widget.product['imageUrl'] as String, 
            height: 250,),
            const Spacer(flex: 3),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 247, 249, 1),
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "\$${widget.product['price']}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];
                          // if (selectedSize == 0) {
                          //   selectedSize =
                          //       (widget.product['sizes'] as List<int>)[0];
                          // }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color.fromRGBO(245, 247, 249, 1),
                                label: Text(size.toString()),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onTap();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(350, 50),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
