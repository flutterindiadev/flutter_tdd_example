import 'package:equatable/equatable.dart';
import 'package:testapp/core/usercase/usercase.dart';
import 'package:testapp/core/utils/typedefs.dart';
import 'package:testapp/src/auth/domain/respositories/auth_repo.dart';

class CreateUser extends UsecaseWithParams<void, CreateuserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  ResultVoid createUser({
    required String id,
    required String createdAt,
    required String name,
    required String avatar,
  }) async =>
      _repository.createUser(name: name, createdAt: createdAt, avatar: avatar);

  @override
  ResultFuture call(CreateuserParams params) async => _repository.createUser(
      name: params.name, createdAt: params.createdAt, avatar: params.avatar);
}

class CreateuserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateuserParams(
      {required this.createdAt, required this.name, required this.avatar});

  const CreateuserParams.empty()
      : this(
            createdAt: 'empty.createdAt',
            name: 'empty.name',
            avatar: 'empty.avatar');

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
