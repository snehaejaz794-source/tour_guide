import 'package:flutter/material.dart';
import 'cart_page.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedType = 'Sport';
  String selectedSize = '40';
  Color selectedColor = Colors.black;

  int quantity = 1;
  int price = 2500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Store'),
        actions: [
  IconButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      );
    },
    icon: const Icon(Icons.shopping_bag_outlined),
  ),
],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 190,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.shopping_bag,
                  size: 100,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Sport Shoes',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text('Premium Quality Shoes'),

              const SizedBox(height: 15),

              const Text(
                'Rs. 2500',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              const Text('Select Shoe Type'),

              const SizedBox(height: 10),

              Wrap(
                spacing: 8,
                children: [
                  shoeButton('Sport'),
                  shoeButton('Casual'),
                  shoeButton('Running'),
                ],
              ),

              const SizedBox(height: 20),

              const Text('Select Color'),

              const SizedBox(height: 12),

              Wrap(
                spacing: 12,
                children: [
                  colorButton(Colors.black),
                  colorButton(Colors.red),
                  colorButton(Colors.blue),
                  colorButton(Colors.green),
                ],
              ),

              const SizedBox(height: 20),

              const Text('Select Size'),

              const SizedBox(height: 12),

              Wrap(
                spacing: 7,
                children: [
                  sizeButton('39'),
                  sizeButton('40'),
                  sizeButton('41'),
                  sizeButton('42'),
                  sizeButton('43'),
                ],
              ),

              const SizedBox(height: 20),

              const Text('Quantity'),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                    ),
                  ),

                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 18),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Text(
                'Total: Rs. ${price * quantity}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

Center(
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      );
    },
    child: const Text('Add to Cart'),
  ),
),
            ],
          ),
        ),
      ),
    );
  }

  Widget shoeButton(String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedType == type
              ? Colors.black
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: selectedType == type
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color
                ? Colors.grey
                : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }

  Widget sizeButton(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selectedSize == size
              ? Colors.black
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: selectedSize == size
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}