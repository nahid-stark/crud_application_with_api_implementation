import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_application_with_rest_api_implementation/add_new_product_screen.dart';
import 'package:to_application_with_rest_api_implementation/edit_product_screen.dart';
import 'package:http/http.dart';
import 'package:to_application_with_rest_api_implementation/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

enum PopupMenuType {
  edit,
  delete,
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _getProductListInProgress = false;

  @override
  void initState() {
    getProductListFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          productList.clear();
          getProductListFromAPI();
        },
        child: Visibility(
          visible: _getProductListInProgress == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    productList[index].image ?? "",
                  ),
                ),
                title: Text(
                  productList[index].productName ?? "",
                ),
                subtitle: Wrap(
                  spacing: 16,
                  children: [
                    Text(
                      "Product Code: ${productList[index].productCode ?? ""}",
                    ),
                    Text(
                      "Product Unit Price: ${productList[index].unitPrice ?? ""}",
                    ),
                    Text(
                      "Product Quantity: ${productList[index].quantity ?? ""}",
                    ),
                    Text(
                      "Product Total Price: ${productList[index].totalPrice ?? ""}",
                    ),
                    Text(
                      "Product Creation date: ${productList[index].createdDate ?? ""}",
                    ),
                  ],
                ),
                trailing: PopupMenuButton<PopupMenuType>(
                  onSelected: onTapPopUpMenuButton,
                  itemBuilder: (context) => <PopupMenuEntry<PopupMenuType>>[
                    const PopupMenuItem(
                      value: PopupMenuType.edit,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Edit",
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: PopupMenuType.delete,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Delete",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewProductScreen(),
            ),
          );
        },
        icon: const Icon(
          Icons.add,
        ),
        label: const Text(
          "ADD",
        ),
      ),
    );
  }

  void onTapPopUpMenuButton(PopupMenuType type) {
    switch (type) {
      case PopupMenuType.edit:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditProductScreen(),
          ),
        );
        break;
      case PopupMenuType.delete:
        _showDeleteDialog();
        break;
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Delete Product",
        ),
        content: const Text(
          "Are you sure that you want to delete this product",
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Temporary Operation
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
            ),
          ),
          TextButton(
            onPressed: () {
              // Temporary Operation
              Navigator.pop(context);
            },
            child: const Text(
              "Yes, Delete",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getProductListFromAPI() async {
    _getProductListInProgress = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      if (decodedResponse["status"] == "success") {
        var list = decodedResponse["data"];
        for (var item in list) {
          Product product = Product(item);
          productList.add(product);
        }
      }
    }
    _getProductListInProgress = false;
    setState(() {});
  }
}
