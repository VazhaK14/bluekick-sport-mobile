import 'package:bluekicksport/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:bluekicksport/models/product_entry.dart';
import 'package:bluekicksport/widgets/left_drawer.dart';
// import 'package:bluekicksport/screens/product_detail.dart';
import 'package:bluekicksport/widgets/product_entry_card.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final String filter;
  const ProductEntryListPage({super.key, required this.filter});

  @override
  State<ProductEntryListPage> createState() => ProductEntryListPageState();
}

class ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('${dotenv.env['BACKEND_URL']}/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }

    if (widget.filter == "my") {
      listProduct = listProduct
          .where(
            (product) => product.fields.user == request.getJsonData()['id'],
          )
          .toList();
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product Entry List')),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Column(
              children: [
                Text(
                  'There are no products yet.',
                  style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  // Show a snackbar when news card is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: snapshot.data![index]),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
