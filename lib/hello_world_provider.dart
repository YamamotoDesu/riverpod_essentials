// Functional (Can’t perform side-effects using public methods)
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

// Class-Based (Can perform side-effects using public methods)
@riverpod
class Example extends _$Example {
  @override
  String build() {
    return 'foo';
  }

  // Add methods to mutate the state
}
