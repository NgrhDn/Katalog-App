import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';

// Widget: Dropdown jumlah item per halaman
class ItemsPerPageDropdown extends StatelessWidget {
  final ProductController controller;
  final VoidCallback onUpdate;

  const ItemsPerPageDropdown({
    super.key,
    required this.controller,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            controller.changeItemsPerPage(value!);
            onUpdate();
          },
        ),
      ],
    );
  }
}
