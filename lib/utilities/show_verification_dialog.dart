import 'package:mynotes/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

Future<void> showVerificationDialog(
  BuildContext context,
) async {
  await AuthService.firebase().sendEmailVerification();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Email Sent!'),
          content: const Text('Click on verification link in your mail'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
}
