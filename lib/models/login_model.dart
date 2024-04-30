// ignore: camel_case_types
class loginModel {
  final String token;
  final authModel auth;
  loginModel({required this.auth, required this.token});
  factory loginModel.fromJson(Map<String, dynamic> jsonData) {
    return loginModel(
        token: jsonData['token'], auth: authModel.fromJson(jsonData['auth']));
  }
}

// ignore: camel_case_types
class authModel {
  final int id;
  final String email;
  final String name;
  // ignore: non_constant_identifier_names
  final String last_name;
  // ignore: non_constant_identifier_names
  final String email_verified_at;
  // ignore: non_constant_identifier_names
  final int rule_id;
  final String phone;
  final String address;
  // ignore: non_constant_identifier_names
  final String created_at;
  // ignore: non_constant_identifier_names
  final String updated_at;
  authModel({
    required this.id,
    required this.email,
    required this.name,
    // ignore: non_constant_identifier_names
    required this.last_name,
    // ignore: non_constant_identifier_names
    required this.email_verified_at,
    // ignore: non_constant_identifier_names
    required this.rule_id,
    required this.phone,
    required this.address,
    // ignore: non_constant_identifier_names
    required this.created_at,
    // ignore: non_constant_identifier_names
    required this.updated_at,
  });
  factory authModel.fromJson(jsonData) {
    return authModel(
        id: jsonData['id'],
        email: jsonData['email'],
        name: jsonData['name'],
        last_name: jsonData['last_name'],
        email_verified_at: jsonData['email_verified_at'],
        rule_id: jsonData['rule_id'],
        phone: jsonData['phone'],
        address: jsonData['address'],
        created_at: jsonData['created_at'],
        updated_at: jsonData['updated_at']);
  }
}
