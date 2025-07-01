import 'package:notes/feauters/auntification/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository auntificationRepository;

  LoginUsecase({required this.auntificationRepository});

  Future<void> call(String email, String password) async {
    await auntificationRepository.login(email, password);
  }
}
