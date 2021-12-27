
import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/domain/do_login.dart';
import 'package:clean_arch_experts/features/auth/domain/entities/user.dart';
import 'package:clean_arch_experts/features/auth/domain/repositories/do_login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class DoLoginRepositoryMock extends Mock implements DoLoginRepository{}

void main () {
  DoLoginRepository _doLoginRepository = DoLoginRepositoryMock();
  DoLogin _doLogin = DoLogin(_doLoginRepository);

  test('Deve realizar o login', () async {
    when(() => _doLoginRepository.doLogin(
      email: 'email@email.com',
      password: '12345',
    )).thenAnswer((_) async => Right(tUser));

    var result = await _doLogin(DoLoginParams(
      email: 'email@email.com',
      password: '12345',
    )); 
 
    expect(result, isA<Right>());
    expect(result, Right(tUser));

    verify(() => _doLoginRepository.doLogin(
      email: 'email@email.com',
      password: '12345',
    )).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });
  
  test('Deve retornar um erro de credenciais incorretas', () async {
    when(() => _doLoginRepository.doLogin(
      email: 'email@email.com',
      password: '12345',
    )).thenAnswer((_) async => Left(WrongCredentials()));

    var result = await _doLogin(DoLoginParams(
      email: 'email@email.com',
      password: '12345',
    )); 
 
    expect(result, isA<Left>());
    expect(result, Left(WrongCredentials()));

    verify(() => _doLoginRepository.doLogin(
      email: 'email@email.com',
      password: '12345',
    )).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });
}

User tUser = User(
  bornDate: DateTime.now(),
  email: 'email@email.com',
  name: 'Nome Usuário',
  pictureUrl: 'http://pictureHost.com.br/picture'
);