
class CartModel {

  final String productName;
  final String productDes;
  final String? productSize;
  final String discountPrice;
  final String currentUser;
  final String productImg;
  
  CartModel(
      {required this.productName,
      required this.productDes,
      required this.productSize,
      required this.discountPrice,
      required this.productImg,required this.currentUser});

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'image': productImg,
      'price': discountPrice,
      'size': productSize,
      'des': productDes,
      'user':currentUser
    };
  }
}
