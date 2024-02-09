class Product {
  String? id;
  String? productName;
  String? productCode;
  String? image;
  String? unitPrice;
  String? quantity;
  String? totalPrice;
  String? createdDate;

  Product(Map<String, dynamic> json){
    id = json["_id"];
    productName = json["ProductName"];
    productCode = json["ProductCode"];
    image = json["Img"];
    unitPrice = json["UnitPrice"];
    quantity = json["Qty"];
    totalPrice = json["TotalPrice"];
    createdDate = json["CreatedDate"];
  }
}
