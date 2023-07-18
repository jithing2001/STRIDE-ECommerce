class OrderModel {
  final String productName;
  final String productDes;
  final String? productSize;
  final String discountPrice;
  final String productImg;
  final String currentUser;
  final String address;
  final String deliveryStatus;

  OrderModel(
      {required this.productName,
      required this.productDes,
      required this.productSize,
      required this.discountPrice,
      required this.productImg,
      required this.address,
      required this.deliveryStatus,
      required this.currentUser});

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'image': productImg,
      'price': discountPrice,
      'size': productSize,
      'des': productImg,
      'status': deliveryStatus,
      'address': address,
      'user': currentUser
    };
  }
}
