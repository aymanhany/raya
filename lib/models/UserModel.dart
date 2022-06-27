class User {
  final int id;
  final String name, token, email, mobile, password, street, city, area, building, landmarks, crm_user_id;

  const User({
    required this.id,
    required this.name,
    required this.token,
    required this.email,
    required this.mobile,
    required this.password,
    required this.street,
    required this.city,
    required this.area,
    required this.building,
    required this.landmarks,
    required this.crm_user_id,
  });
}
