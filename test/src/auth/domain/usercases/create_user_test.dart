//what does the class depend on?
//Answer : authrepo
//how can we create a fake version of the dependency?
//mocktail package
//How do we control what our dependencies do?

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testapp/src/auth/domain/respositories/auth_repo.dart';
import 'package:testapp/src/auth/domain/usercases/create_user.dart';

import 'auth_repo.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late CreateUser usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateuserParams.empty();

  test('Should call the [AuthRepo.createUser]', () async {
    //arrange
    when(
      () => repository.createUser(
        name: any(named: 'name'),
        createdAt: any(named: 'createdAt'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer((_) async => const Right(null));
    //act

    final result = await usecase(params);

    //assert
    expect(result, equals(const Right<dynamic, void>(null)));

    verify(
      () => repository.createUser(
          name: params.name,
          createdAt: params.createdAt,
          avatar: params.avatar),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
