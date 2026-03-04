import '../model/user.dart';
import '../provider/user_provider.dart';

class UserRepository {
  final UserProvider _provider = UserProvider();

  Future<void> addUser(UserModel user) async {
    await _provider.addUser(user);
  }

  Future<UserModel?> getUser(String id) async {
    return await _provider.getUser(id);
  }
}
