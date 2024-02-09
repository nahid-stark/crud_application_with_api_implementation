import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewProductInProgress = false;
  bool _isEnabled = true;
  Color _buttonColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Product",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Name";
                    } else {
                      return null;
                    }
                  },
                  controller: _nameTEController,
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Code";
                    } else {
                      return null;
                    }
                  },
                  controller: _codeTEController,
                  decoration: const InputDecoration(
                    hintText: "Product Code",
                    labelText: "Product Code",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Unit Price";
                    } else {
                      return null;
                    }
                  },
                  controller: _unitPriceTEController,
                  decoration: const InputDecoration(
                    hintText: "Unit Price",
                    labelText: "Unit Price",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Quantity";
                    } else {
                      return null;
                    }
                  },
                  controller: _quantityTEController,
                  decoration: const InputDecoration(
                    hintText: "Quantity",
                    labelText: "Quantity",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Total Price";
                    } else {
                      return null;
                    }
                  },
                  controller: _totalPriceTEController,
                  decoration: const InputDecoration(
                    hintText: "Total Price",
                    labelText: "Total Price",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Product Image URL";
                    } else {
                      return null;
                    }
                  },
                  controller: _imageTEController,
                  decoration: const InputDecoration(
                    hintText: "Image",
                    labelText: "Image",
                  ),
                ),
                const SizedBox(
                  height: 8.00,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: _isEnabled ? _addButtonFunctionality : null,
                    child: Visibility(
                      visible: _addNewProductInProgress == false,
                      replacement: const CircularProgressIndicator(),
                      child: const Text(
                        "ADD",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addButtonFunctionality() {
    if (_formKey.currentState!.validate()) {
      createNewProduct();
    }
  }

  Future<void> createNewProduct() async {
    _addNewProductInProgress = true;
    _buttonColor = Colors.grey;
    _isEnabled = false;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
    Map<String, dynamic> params = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _codeTEController.text.trim(),
      "ProductName": _nameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _unitPriceTEController.text.trim(),
    };
    Response response = await post(
      uri,
      body: jsonEncode(params),
      headers: {
        "Content-type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      _unitPriceTEController.clear();
      _codeTEController.clear();
      _imageTEController.clear();
      _nameTEController.clear();
      _quantityTEController.clear();
      _totalPriceTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product Created Successfully")),
      );
    }
    _addNewProductInProgress = false;
    _buttonColor = Colors.amber;
    _isEnabled = true;
    setState(() {});
  }
}
