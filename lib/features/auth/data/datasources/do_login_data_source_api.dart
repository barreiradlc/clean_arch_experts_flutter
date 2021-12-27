import 'package:clean_arch_experts/core/error/failure.dart';
import 'package:clean_arch_experts/features/auth/data/models/user_model.dart';
import 'do_login_data_source.dart';

class DoLoginDataSourceApi implements DoLoginDataSource {
  

  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    try {
      return Future.value(
        UserModel.fromMap(tUserApi)
      );
    } catch (e) {
      throw (ServerFailure());
    }
  }
}

var tUserApi = {
  "name": "Usuário Teste",
  "bornDate": DateTime.now().toIso8601String(),
  "pictureUrl": "http://pictureUrl.com.br/picture",
  "email": "email@email.com"
};