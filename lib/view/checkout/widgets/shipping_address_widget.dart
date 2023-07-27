import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ShippingFields extends StatelessWidget {
  final String? name;
  final String? area;
  final String? district;
  final String? state;
  final String? pincode;

  const ShippingFields(
      {super.key,
      required this.name,
      required this.area,
      required this.district,
      required this.state,
      required this.pincode});

  @override
  Widget build(BuildContext context) {
    return (name != null &&
            area != null &&
            district != null &&
            state != null &&
            pincode != null)
        ? Row(
            children: [
              kwidth20,
              Text(
                " $name \n $district \n $state \n $area \n $pincode ",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          )
        : const Center(
            child: Text('Add address'),
          );
  }
}
