
class CenterInfo {
  static String name = '';
  static String status = 'Active';
  static String address = '';
  static String startWork = '';
  static String endWork = '';
  static String logo = '';
  static String createdAt = '';
  static String updatedAt = '';

  static void fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    status = json['status'] ?? 'Active';
    address = json['address'] ?? '';
    startWork = json['start_work'] ?? '';
    endWork = json['end_work'] ?? '';
    logo = json['logo'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

}