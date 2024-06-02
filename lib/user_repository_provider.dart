import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_essentials/user.dart';
import 'package:riverpod_essentials/user_repository.dart';

part 'user_repository_provider.g.dart';

// The syntax for defining a provider is as followed:
@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}

// you can pass arguments to your requests like normal function.
@riverpod
Future<List<User>> user(UserRef ref, String companyId) async {
  final users = ref.watch(userRepositoryProvider).getUsers(companyId);
  return users;
}
