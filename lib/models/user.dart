import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String role;
  String email;
  String avatar;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.avatar,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
