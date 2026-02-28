class CardModel {
  final String? name;
  final String? company;
  final String? phone;
  final String? email;
  final String? website;

  CardModel({
    required this.name,
    required this.company,
    required this.phone,
    required this.email,
    required this.website,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'company': company,
        'phone': phone,
        'email': email,
        'website': website,
      };


  CardModel merge(CardModel other) {
    return CardModel(
      name: (name?.isNotEmpty ?? false) ? name : other.name,
      company: (company?.isNotEmpty ?? false) ? company : other.company,
      phone: (phone?.isNotEmpty ?? false) ? phone : other.phone,
      email: (email?.isNotEmpty ?? false) ? email : other.email,
      website: (website?.isNotEmpty ?? false) ? website : other.website,
    );
  }

  factory CardModel.fromMap(Map map) {
    return CardModel(
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      website: map['website'] ?? '',
    );
  }
}