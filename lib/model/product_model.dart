class ProductModel {
  final String productName;
  final String productPrice;
  final String productDes;
  final String? ProductCategory;
  final String discountPrice;

  final String productImg;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.discountPrice,
      required this.productDes,
      required this.productImg,
      this.ProductCategory});

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productPrice': productPrice,
        'discountPrice': discountPrice,
        'productDes': productDes,
        'productImg': productImg,
        'productCategory': ProductCategory,
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      productImg: json['productImg'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      discountPrice: json['discountPrice'],
      productDes: json['productDes']);
}
