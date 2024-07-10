class User {
  final String id;
  final String name;
  final String base64ImageData;
  final String uid;

  User(
      {required this.id,
      required this.name,
      required this.base64ImageData,
      required this.uid});

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'] as String,
        name: data['name'] as String,
        base64ImageData: data['base64ImageData'] as String,
        uid: data['uid'] as String,
      );
}
