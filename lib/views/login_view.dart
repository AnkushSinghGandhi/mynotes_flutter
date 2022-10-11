import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/show_verification_dialog.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'email goes here'),
        ),
        TextField(
          controller: _password,
          enableSuggestions: false,
          autocorrect: false,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'password mangta apun'),
        ),
        TextButton(
            onPressed: (() async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase().logIn(
                  email: email,
                  password: password,
                );
                final user = AuthService.firebase().currentUser;
                if (user?.isEmailVerified ?? false) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    notesRoute,
                    (route) => false,
                  );
                } else {
                  await showVerificationDialog(context);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  await showErrorDialog(
                    (context),
                    'User not found!',
                  );
                } else if (e.code == 'wrong-password') {
                  await showErrorDialog(
                    (context),
                    'Wrong Password',
                  );
                } else {
                  await showErrorDialog(
                    (context),
                    e.code,
                  );
                }
              } catch (e) {
                await showErrorDialog(
                  (context),
                  e.toString(),
                );
              }
            }),
            child: const Text('Login')),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text('Not registered yet? Register here!'))
      ]),
    );
  }
}
