import 'package:testapp/core/utils/typedefs.dart';
import 'package:testapp/src/auth/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser(
      {required String name,
      required String createdAt,
      required String avatar});

  ResultFuture<List<User>> getusers();
}
