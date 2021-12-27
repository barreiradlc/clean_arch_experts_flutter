import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/data/datasources/do_login_data_source.dart';
import 'package:clean_arch_experts/features/auth/data/models/user_model.dart';
import 'package:clean_arch_experts/features/auth/data/repositories/do_login_repository_impl.dart';
import 'package:clean_arch_experts/features/auth/domain/repositories/do_login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DoLoginDataSourceMock extends Mock implements DoLoginDataSource {}

void main() {
  DoLoginDataSource _dataSource = DoLoginDataSourceMock();
  DoLoginRepository _repository = DoLoginRepositoryImpl(_dataSource);


  test('Deve realizar o login', () async {
    when(() => _dataSource.doLogin(
      email: any(named: 'email'),
      password: any(named: 'password')
    )).thenAnswer((invocation) async => tUser);

    var result = await _repository.doLogin(
      email: 'email@email.com',
      password: '12345',
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));

    verify(() => _dataSource.doLogin(
      email: any(named: 'email'),
      password: any(named: 'password')
    )).called(1);
    verifyNoMoreInteractions(_dataSource);
  }); 


  test('Deve obter um erro ao realizar o login', () async {
    when(() => _dataSource.doLogin(
      email: any(named: 'email'),
      password: any(named: 'password')
    )).thenThrow(WrongCredentials());

    var result = await _repository.doLogin(
      email: 'email@email.com',
      password: '12345',
    );

    
    expect(result, isA<Left>());
    expect(result, Left(WrongCredentials()));


    verify(() => _dataSource.doLogin(
      email: any(named: 'email'),
      password: any(named: 'password')
    )).called(1);
    verifyNoMoreInteractions(_dataSource);
  }); 
}


UserModel tUser = UserModel(
  bornDate: DateTime.now(),
  email: 'email@email.com',
  name: 'Nome Usuário',
  pictureUrl: 'http://pictureHost.com.br/picture'
);