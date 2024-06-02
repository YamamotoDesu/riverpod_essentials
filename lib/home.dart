import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_essentials/user_repository_provider.dart';

class Home extends ConsumerWidget {
  final String companyId;

  const Home({Key? key, required this.companyId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider(companyId));

    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Center(
        child: users.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}
