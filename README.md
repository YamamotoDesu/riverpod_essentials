# riverpod_essentials

## Defining a Provider
When defining providers via code generation, you can choose between annotated functions or classes. 
Class-based providers offer the advantage of including public methods for external state modification, enabling side-effects. 
Functional providers, essentially shorthand for class-based ones with just a build method, lack this flexibility for UI modification.

```dart
// Functional (Can’t perform side-effects using public methods)
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
```

## Consuming a Provider

```dart
// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
```
