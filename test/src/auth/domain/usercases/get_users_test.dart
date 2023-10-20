import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testapp/src/auth/domain/entities/user.dart';
import 'package:testapp/src/auth/domain/respositories/auth_repo.dart';
import 'package:testapp/src/auth/domain/usercases/get_users.dart';

import 'auth_repo.mock.dart';

Future<void> main() async {
  late AuthenticationRepository repository;

  late GetUsers usecase;

  setUp(() async {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test('should call [AuthRepo.getUsers] and return [List<User>]', () async {
    when(
      () => repository.getusers(),
    ).thenAnswer((_) async => const Right(tResponse));
    final result = await usecase();

    expect(result, const Right<dynamic, List<User>>(tResponse));
    verify(() => repository.getusers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
