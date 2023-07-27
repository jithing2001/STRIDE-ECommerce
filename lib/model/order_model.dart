class OrderModel {
  final String productName;
  final String productDes;
  final String? productSize;
  final String discountPrice;
  final String productImg1;
  final String productImg2;
  final String productImg3;
  final String currentUser;
  final String address;
  final String deliveryStatus;

  OrderModel(
      {required this.productName,
      required this.productDes,
      required this.productSize,
      required this.discountPrice,
      required this.productImg1,
      required this.productImg2,
      required this.productImg3,
      required this.address,
      required this.deliveryStatus,
      required this.currentUser});

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'image1': productImg1,
      'image2': productImg2,
      'image3': productImg3,
      'price': discountPrice,
      'size': productSize,
      'des': productDes,
      'status': deliveryStatus,
      'address': address,
      'user': currentUser
    };
  }

    static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
      productName: json['productName'],
      productImg1: json['image1'],
      productImg2: json['image2'],
      productImg3: json['image3'],
      productDes: json['des'],
      currentUser: json['user'],
      discountPrice: json['price'],
      productSize: json['size'],
      address: json['address'],
      deliveryStatus: json['status']);
}
