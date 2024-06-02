import 'package:riverpod_essentials/user.dart';

class UserRepository {
  Future<List<User>> getUsers(String companyId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      User(id: 1, name: 'John Doe'),
      User(id: 2, name: 'Jane Doe'),
    ];
  }
}
