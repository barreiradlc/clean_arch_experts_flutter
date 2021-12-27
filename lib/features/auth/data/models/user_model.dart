import 'dart:convert';

import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required DateTime bornDate,
    required String pictureUrl,
    required String email
  }) : super(
          name: name,
          bornDate: bornDate,
          pictureUrl: pictureUrl,
          email: email
        );

  // // IMPLICA ?
  // UserModel copyWith({
  //   String? name,
  //   DateTime? bornDate,
  //   String? pictureUrl,
  //   String? email,
  // }) {
  //   return UserModel(
  //     name: name ?? this.name,
  //     bornDate: bornDate ?? this.bornDate,
  //     pictureUrl: pictureUrl ?? this.pictureUrl,
  //     email: email ?? this.email,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bornDate': bornDate.millisecondsSinceEpoch,
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      bornDate: DateTime.parse(map['bornDate']),
      pictureUrl: map['pictureUrl'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  // // IMPLICA?
  // @override
  // String toString() {
  //   return 'UserModel(name: $name, bornDate: $bornDate, pictureUrl: $pictureUrl, email: $email)';
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  
  //   return other is UserModel &&
  //     other.name == name &&
  //     other.bornDate == bornDate &&
  //     other.pictureUrl == pictureUrl &&
  //     other.email == email;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //     bornDate.hashCode ^
  //     pictureUrl.hashCode ^
  //     email.hashCode;
  // }
}
