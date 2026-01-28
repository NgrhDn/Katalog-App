import '../models/product.dart';

class ProductController {
  final List<Product> allProducts;
  int currentPage = 0;
  int itemsPerPage = 10;

  ProductController(this.allProducts);

  int getTotalPages() {
    return (allProducts.length / itemsPerPage).ceil();
  }

  List<Product> getCurrentProducts() {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, allProducts.length);
    return allProducts.sublist(startIndex, endIndex);
  }

  void changeItemsPerPage(int newValue) {
    itemsPerPage = newValue;
    currentPage = 0;
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  void goToNextPage() {
    if (currentPage < getTotalPages() - 1) {
      currentPage++;
    }
  }

  bool canGoPrevious() {
    return currentPage > 0;
  }

  bool canGoNext() {
    return currentPage < getTotalPages() - 1;
  }
}
