import 'package:testapp/core/usercase/usercase.dart';
import 'package:testapp/core/utils/typedefs.dart';
import 'package:testapp/src/auth/domain/respositories/auth_repo.dart';

import '../entities/user.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getusers();
}
