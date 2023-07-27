class AddressModel {
  final String name;
  final String area;
  final String district;
  final String state;
  final String pincode;

  AddressModel(
      {required this.name,
      required this.area,
      required this.district,
      required this.state,
      required this.pincode});

  Map<String, dynamic> toJson() => {
        'name': name,
        'area': area,
        'district': district,
        'state': state,
        'pincode': pincode,
      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
      name: json['name'],
      area: json['area'],
      district: json['district'],
      pincode: json['pincode'],
      state: json['state']);
}
