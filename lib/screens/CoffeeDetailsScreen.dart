import 'package:flutter/material.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final String name;
  final String subName;
  final String imagePath;
  final String price;

  const CoffeeDetailsScreen({
    super.key,
    required this.name,
    required this.subName,
    required this.imagePath,
    required this.price,
  });

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  bool isFavorite = false;
  String selectedSize = "M";
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Detail", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.imagePath,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(widget.subName, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    SizedBox(width: 5),
                    Text("4.8", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(" (230)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    _buildIconBox(Icons.delivery_dining),
                    _buildIconBox(Icons.coffee),
                    _buildIconBox(Icons.local_drink),
                  ],
                )
              ],
            ),
            const Divider(height: 30),
            const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.5, fontFamily: 'Sora'),
                  children: [
                    TextSpan(
                      text: isExpanded
                          ? "A ${widget.name} is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk. The foamy milk is poured over the espresso, resulting in a rich, creamy texture and a perfectly balanced flavor profile that coffee lovers adore."
                          : "A ${widget.name} is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                    ),
                    TextSpan(
                      text: isExpanded ? " Show Less" : " Read More",
                      style: const TextStyle(color: Color(0xFFC67C4E), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            const Text("Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSizeBox("S"),
                _buildSizeBox("M"),
                _buildSizeBox("L"),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price", style: TextStyle(color: Colors.grey, fontSize: 14)),
                Text("\$ ${widget.price}", style: const TextStyle(color: Color(0xFFC67C4E), fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 40),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC67C4E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Buy Now", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(10)),
      child: Icon(icon, color: const Color(0xFFC67C4E), size: 20),
    );
  }


  Widget _buildSizeBox(String label) {
    bool isSelected = selectedSize == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = label;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF5EE) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFFC67C4E) : Colors.black,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            )
        ),
      ),
    );
  }
}