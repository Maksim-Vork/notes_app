import 'package:notes/feauters/auntification/domain/repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository auntificationRepository;

  RegisterUsecase({required this.auntificationRepository});

  Future<void> call(email, password) async {
    await auntificationRepository.register(email, password);
  }
}
