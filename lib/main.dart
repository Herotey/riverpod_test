import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String name;
  DateTime dateOfBirth;

  User({required this.name, required this.dateOfBirth});
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(User(name: 'Duongherotey', dateOfBirth: DateTime.now()));

  void setName(String name) {
    state = User(name: name, dateOfBirth: state.dateOfBirth);
  }
}

final userProvider = StateNotifierProvider((ref) => UserNotifier());

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          home: Scaffold(
            appBar: AppBar(
              title: Text('User Example'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Consumer(builder: (context, watch, child) {
                  // //  final user = watch(userProvider);
                  //   //return Text(user.name);
                  //   return print('0');
                  // }
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        // context.read(userProvider.notifier).setName('NakDuongherotey');
                      },
                      child: const Text(
                        'change Name',
                        style:
                            TextStyle(fontSize: 20, color: Colors.amberAccent),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
