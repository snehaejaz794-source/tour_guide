import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoeStoreScreen(),
    );
  }
}

class ShoeStoreScreen extends StatefulWidget {
  @override
  State<ShoeStoreScreen> createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  String selectedType = "Sport";
  Color selectedColor = Colors.black;
  int selectedSize = 40;
  int quantity = 1;
  int price = 2500;

  List<String> types = ["Sport", "Casual", "Running"];

  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green
  ];

  List<int> sizes = [39, 40, 41, 42, 43];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Shoe Store",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Shoe Image
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.asset(
                "assets/images/image1.jpeg",
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text("Image not found"),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Shoe Name
            const Text(
              "Sport Shoes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Premium Quality Shoes",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 8),

            // Price
            Text(
              "Rs. $price",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Select Shoe Type
            const Text(
              "Select Shoe Type",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Row(
              children: types.map((type) {
                bool isSelected = selectedType == type;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = type;
                    });
                  },

                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.purple.shade100
                          : Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Text(
                      type,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.purple.shade700
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Select Color
            const Text(
              "Select Color",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Row(
              children: colors.map((color) {
                bool isSelected = selectedColor == color;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },

                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 28,
                    height: 28,

                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              color: Colors.black,
                              width: 2,
                            )
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Select Size
            const Text(
              "Select Size",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Row(
              children: sizes.map((size) {
                bool isSelected = selectedSize == size;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size;
                    });
                  },

                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.purple.shade100
                          : Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: Text(
                      isSelected ? "✓ $size" : "$size",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Quantity
            const Text(
              "Quantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),

                Text(
                  "$quantity",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Total Price
            Text(
              "Total: Rs. ${price * quantity}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Add To Cart Button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}