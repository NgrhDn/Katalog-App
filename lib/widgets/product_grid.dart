import 'package:flutter/material.dart';
import '../models/product.dart';
import '../controllers/product_controller.dart';
import 'product_card.dart';

// View: Tampilan grid produk dengan pagination
class ProductGrid extends StatefulWidget {
  final List<Product> products;

  const ProductGrid({super.key, required this.products});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  late ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = ProductController(widget.products);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildHeader(), _buildProductGrid()]);
  }

  // Header dengan info total dan dropdown
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total ${controller.allProducts.length} produk',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              const Text('Tampilkan: '),
              DropdownButton<int>(
                value: controller.itemsPerPage,
                items: const [
                  DropdownMenuItem(value: 10, child: Text('10')),
                  DropdownMenuItem(value: 20, child: Text('20')),
                  DropdownMenuItem(value: 30, child: Text('30')),
                  DropdownMenuItem(value: 40, child: Text('40')),
                  DropdownMenuItem(value: 50, child: Text('50')),
                ],
                onChanged: (value) {
                  setState(() {
                    controller.changeItemsPerPage(value!);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Grid produk
  Widget _buildProductGrid() {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, size) {
          int column = 2;
          if (size.maxWidth >= 600) column = 3;
          if (size.maxWidth >= 900) column = 4;

          List<Product> currentProducts = controller.getCurrentProducts();

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: currentProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: column,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: currentProducts[index]);
            },
          );
        },
      ),
    );
  }
}
