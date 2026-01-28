# Tugas 3: Layout Challenge - E-Commerce Home Page

## ✅ Checklist Implementasi

### 1. AppBar Custom
- [x] Title: "Katalog Produk"
- [x] Icon search di sebelah kanan
- [x] Custom styling dengan Text bold

**File:** `lib/widgets/app_top_bar.dart`

```dart
AppBar(
  title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
  actions: const [Icon(Icons.search), SizedBox(width: 12)],
)
```

---

### 2. Bottom Navigation
- [x] 2 tab: Produk & Akun
- [x] Icon berbeda untuk setiap tab
- [x] Berfungsi berpindah halaman

**File:** `lib/widgets/app_bottom_navigation.dart`

```dart
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Produk'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
  ],
)
```

---

### 3. Home Page E-Commerce
- [x] Grid produk 2-4 kolom (responsive)
- [x] Dropdown pilih jumlah produk (10/20/30/40/50)
- [x] Total produk info
- [x] Halaman Akun sederhana

**File:** `lib/views/home_page.dart`

---

## 📊 Struktur Aplikasi

```
lib/
├── main.dart (Entry point)
├── models/
│   └── product.dart (Data model)
├── controllers/
│   ├── home_controller.dart (Removed - tidak perlu)
│   └── product_controller.dart (Logika pagination)
├── data/
│   └── products_data.dart (50 sample produk)
├── views/
│   └── home_page.dart (Main page)
└── widgets/
    ├── app_top_bar.dart (Custom AppBar)
    ├── app_bottom_navigation.dart (Bottom Nav)
    ├── product_grid.dart (Grid dengan pagination)
    ├── product_card.dart (Card produk)
    └── items_per_page_dropdown.dart (Dropdown)
```

---

## 🎯 MVC Pattern yang Diimplementasikan

| Layer | File | Tanggung Jawab |
|-------|------|----------------|
| **Model** | `product.dart` | Data struktur produk |
| **Controller** | `product_controller.dart` | Logika pagination & perubahan items |
| **View** | `home_page.dart` | Halaman utama |
| **Widget** | `product_grid.dart` | Menampilkan grid |
| **Widget** | `product_card.dart` | Satu kartu produk |
| **Widget** | `app_top_bar.dart` | Top bar |
| **Widget** | `app_bottom_navigation.dart` | Bottom nav |
