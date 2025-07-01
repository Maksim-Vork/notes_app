import 'package:notes/feauters/auntification/data/datasource/remote_auth_datasource.dart';
import 'package:notes/feauters/auntification/domain/repository/auth_repository.dart';

class ImplAuthRepository implements AuthRepository {
  final RemoteAuthDatasource remoteAuthDataSource;

  ImplAuthRepository({required this.remoteAuthDataSource});
  @override
  Future<void> login(email, password) async {
    await remoteAuthDataSource.login(email, password);
  }

  @override
  Future<void> register(email, password) async {
    await remoteAuthDataSource.register(email, password);
  }
}
