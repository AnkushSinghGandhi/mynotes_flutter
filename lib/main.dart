import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'views/register_view.dart';
import 'views/login_view.dart';
import 'views/notes_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      notesRoute: (context) => const NotesView(),
      registerRoute: (context) => const RegisterView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if (user != null) {
                if (user.isEmailVerified) {
                  return const NotesView();
                } else {
                  return const LoginView();
                }
              } else {
                return const LoginView();
              }

            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
