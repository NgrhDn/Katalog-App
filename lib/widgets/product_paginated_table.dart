import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductPaginatedTable extends StatefulWidget {
  final List<Product> products;

  const ProductPaginatedTable({super.key, required this.products});

  @override
  State<ProductPaginatedTable> createState() => _ProductPaginatedTableState();
}

class _ProductPaginatedTableState extends State<ProductPaginatedTable> {
  late ProductDataSource _dataSource;
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _dataSource = ProductDataSource(widget.products);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: PaginatedDataTable(
          header: Text('Total ${widget.products.length} produk'),
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Nama Produk')),
            DataColumn(label: Text('Foto')),
          ],
          source: _dataSource,
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: const [10, 20, 30, 40, 50],
          onRowsPerPageChanged: (value) {
            if (value != null) {
              setState(() {
                _rowsPerPage = value;
              });
            }
          },
        ),
      ),
    );
  }
}

class ProductDataSource extends DataTableSource {
  final List<Product> products;

  ProductDataSource(this.products);

  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= products.length) return null;
    final product = products[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(product.id.toString())),
        DataCell(Text(product.namaProduct)),
        DataCell(
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              product.fotoUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 64,
                  height: 64,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 20,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
