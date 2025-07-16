import 'package:notes/feauters/auntification/domain/repository/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository auntificationRepository;

  SignOutUsecase({required this.auntificationRepository});

  Future<void> call() async {
    await auntificationRepository.signOut();
  }
}
