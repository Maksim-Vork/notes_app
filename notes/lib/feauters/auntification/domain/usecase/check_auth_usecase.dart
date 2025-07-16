import 'package:notes/feauters/auntification/domain/repository/auth_repository.dart';

class CheckAuthUsecase {
  final AuthRepository auntificationRepository;

  CheckAuthUsecase({required this.auntificationRepository});

  Future<bool> call() async {
    final result = await auntificationRepository.checkAuth();
    return result;
  }
}
