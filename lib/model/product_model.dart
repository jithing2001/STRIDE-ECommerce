class ProductModel {
  final String productName;
  final String productPrice;
  final String productDes;
  final String? ProductCategory;
  final String discountPrice;

  final String productImg1;
  final String productImg2;
  final String productImg3;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.discountPrice,
      required this.productDes,
      required this.productImg1,
      required this.productImg2,
      required this.productImg3,
      this.ProductCategory});

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productPrice': productPrice,
        'discountPrice': discountPrice,
        'productDes': productDes,
        'productImg1': productImg1,
        'productImg2': productImg2,
        'productImg3': productImg3,
        'productCategory': ProductCategory,
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      productImg1: json['productImg1'] ?? '',
      productImg2: json['productImg2'] ?? '',
      productImg3: json['productImg3'] ?? '',
      productName: json['productName'] ?? '',
      productPrice: json['productPrice'] ?? '',
      discountPrice: json['discountPrice'] ?? '',
      productDes: json['productDes'] ?? '');
}
