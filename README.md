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

## What is WidgetRef?
An object that allows widgets to interact with providers, be it from a widget or another provider. We can use ref to interact with providers in several ways:

- Obtaining the value and listening to changes:   
Use `ref.watch` to obtain the value of a provider and automatically rebuild the widget or provider when the value changes.

- Adding a listener:   
Use `ref.listen` to add a listener to a provider, allowing you to execute actions (like navigating to a new page or showing a modal) whenever the provider's value changes.

- Obtaining the value without listening to changes:   
Use `ref.read` to get the current value of a provider without subscribing to updates, useful for events like "on click."

```dart

@riverpod
String value(ValueRef ref) {
  // use ref to obtain other providers
  final repository = ref.watch(repositoryProvider);
  return repository.get();
}
```

## Exploring Different Types of Providers
Riverpod offers eight different types of providers, each suited for specific use cases. However, some of them, such as StateProvider, StateNotifierProvider, and ChangeNotifierProvider, are considered legacy and will be deprecated in future versions. 


