class AddressModel {
  final String uid;
  final String name;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool selectedAddress;

  AddressModel({
    required this.uid,
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.selectedAddress = false,
  });

  get zipCode => null;

  static AddressModel empty() {
    return AddressModel(
      uid: '',
      name: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '',
      selectedAddress: false,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      uid: json['uid'],
      name: json['name'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      selectedAddress: json['selectedAddress'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'selectedAddress': selectedAddress,
    };
  }

  AddressModel copyWith({
    String? uid,
    String? name,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    bool? selectedAddress,
  }) {
    return AddressModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      selectedAddress: selectedAddress ?? this.selectedAddress,
    );
  }
}
