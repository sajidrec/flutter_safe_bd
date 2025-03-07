class ContactModel {
  ContactModel({String? name, String? phoneNumber, String? whatsapp}) {
    _name = name;
    _phoneNumber = phoneNumber;
    _whatsapp = whatsapp;
  }

  ContactModel.fromJson(dynamic json) {
    _name = json['name'];
    _phoneNumber = json['phone_number'];
    _whatsapp = json['whatsapp'];
  }

  String? _name;
  String? _phoneNumber;
  String? _whatsapp;

  ContactModel copyWith({
    String? name,
    String? phoneNumber,
    String? whatsapp,
  }) => ContactModel(
    name: name ?? _name,
    phoneNumber: phoneNumber ?? _phoneNumber,
    whatsapp: whatsapp ?? _whatsapp,
  );

  String? get name => _name;

  String? get phoneNumber => _phoneNumber;

  String? get whatsapp => _whatsapp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone_number'] = _phoneNumber;
    map['whatsapp'] = _whatsapp;
    return map;
  }
}
