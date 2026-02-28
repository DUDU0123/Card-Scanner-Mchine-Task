class ContactModel {
  final String name;
  final String company;
  final String phone;
  final String email;
  final String website;

  ContactModel({
    required this.name,
    required this.company,
    required this.phone,
    required this.email,
    required this.website,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "company": company,
      "phone": phone,
      "email": email,
      "website": website,
    };
  }
}