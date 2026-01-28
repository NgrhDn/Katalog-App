import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Katalog Produk'),
      body: ProductGrid(products: controller.products),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: controller.currentTabIndex,
        onChanged: (index) {
          setState(() {
            controller.changeTab(index);
          });
        },
      ),
    );
  }
}
