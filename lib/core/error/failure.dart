import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;

  Failure({
    this.message
  });

  @override
  List<dynamic> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message => 'Não foi possível processar seu pedido, tente novamente mais tarde';
}
  
class NotFound extends Failure {
  @override
  String get message => 'Registro não encontrado.';
}
  
class WrongCredentials extends Failure {
  @override
  String get message => 'Credenciais incorretas.';
}