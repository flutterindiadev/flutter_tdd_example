import 'dart:convert';

import 'package:testapp/core/utils/typedefs.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.name,
      required super.createdAt,
      required super.avatar,
      required super.id});

  UserModel.fromMap(DataMap map)
      : this(
            avatar: map['avatar'] as String,
            createdAt: map['createdAt'] as String,
            name: map['name'] as String,
            id: map['id'] as String);

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() =>
      {'id': id, 'avatar': avatar, 'name': name, 'createdAt': createdAt};

  String toJson() => jsonEncode(toMap());

  UserModel copyWith(
          {String? avatar, String? createdAt, String? id, String? name}) =>
      UserModel(
          name: name ?? this.name,
          createdAt: createdAt ?? this.createdAt,
          avatar: avatar ?? this.avatar,
          id: id ?? this.id);
}
