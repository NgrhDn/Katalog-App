import '../models/product.dart';

// Controller: Mengelola logika pagination produk
class ProductController {
  final List<Product> allProducts;
  int currentPage = 0;
  int itemsPerPage = 10;

  ProductController(this.allProducts);

  // Hitung total halaman
  int getTotalPages() {
    return (allProducts.length / itemsPerPage).ceil();
  }

  // Ambil produk untuk halaman saat ini
  List<Product> getCurrentProducts() {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, allProducts.length);
    return allProducts.sublist(startIndex, endIndex);
  }

  // Ubah jumlah item per halaman
  void changeItemsPerPage(int newValue) {
    itemsPerPage = newValue;
    currentPage = 0; // Reset ke halaman pertama
  }

  // Pindah ke halaman sebelumnya
  void goToPreviousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  // Pindah ke halaman berikutnya
  void goToNextPage() {
    if (currentPage < getTotalPages() - 1) {
      currentPage++;
    }
  }

  // Cek apakah bisa ke halaman sebelumnya
  bool canGoPrevious() {
    return currentPage > 0;
  }

  // Cek apakah bisa ke halaman berikutnya
  bool canGoNext() {
    return currentPage < getTotalPages() - 1;
  }
}
