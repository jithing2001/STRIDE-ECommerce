
// import 'package:ecommerce/constants.dart';
// import 'package:ecommerce/controllers/quantity_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class QuantityWidget extends StatefulWidget {
//   QuantityWidget({
//     super.key,
//   });

//   @override
//   State<QuantityWidget> createState() => _QuantityWidgetState();
// }

// class _QuantityWidgetState extends State<QuantityWidget> {
//   QuantityController quantityController = QuantityController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 25,
//       width: 70,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: kblack)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//               onTap: () {
//                 quantityController.removeQuantity();
//               },
//               child: const Icon(Icons.remove)),
//           Obx(() => Text('${quantityController.count.value}')),
//           InkWell(
//               onTap: () {
//                 quantityController.addQuantity();
//               },
//               child: const Icon(Icons.add))
//         ],
//       ),
//     );
//   }
// }
