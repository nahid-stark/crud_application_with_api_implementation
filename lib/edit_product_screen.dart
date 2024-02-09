import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Product",
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Update",
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
}
