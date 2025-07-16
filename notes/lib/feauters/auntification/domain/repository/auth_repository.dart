abstract class AuthRepository {
  Future<void> login(email, password);
  Future<void> register(email, password);
  Future<void> signOut();
  Future<bool> checkAuth();
}
