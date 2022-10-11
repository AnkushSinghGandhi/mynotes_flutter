import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

Future<void> showVerificationDialog(
  BuildContext context,
) async {
  final user = FirebaseAuth.instance.currentUser;
  await user?.sendEmailVerification();
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
