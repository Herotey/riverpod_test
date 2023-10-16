import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const  Scaffold(
          body: SelectedButton(),
        ),
      ),
    );
  }
}

final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red';
});
final selectedButtonProvider = StateProvider<String>((ref) => '');

class SelectedButton extends ConsumerWidget {
  const SelectedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    final selectedBoutton = ref.watch(selectedButtonProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(selectedBoutton),
          ElevatedButton(
            onPressed: () =>
                ref.read(selectedButtonProvider.notifier).state = 'red',
            child: const Text('red'),
          ),
          ElevatedButton(
              onPressed: () =>
                  ref.read(selectedButtonProvider.notifier).state = 'blue',
              child: const Text('Blue')),
          isRed ? Text('Color is red') : Text('Color is blue')
        ],
      ),
    );
  }
}
