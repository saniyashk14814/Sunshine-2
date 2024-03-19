import 'package:flutter/material.dart';
import 'package:sunshine/Core/username_generator.dart';
import 'package:sunshine/Core/widgets.dart';

class NewUserDialogue extends StatelessWidget {
  NewUserDialogue({
    Key? key,
  }) : super(key: key);

  Future<String> usernameGen() async {
    WidgetsFlutterBinding.ensureInitialized();
    String? username = await getUsername();
    if (username == null) {
      // Username not found, generate a new one
      final newUsername = generateUsername();
      await setUsername(newUsername);
      username = newUsername;
    }
    return username;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0x834E4E4E),
      icon: const Icon(Icons.account_circle, size: 50, color: Colors.white),
      title: const Text('Welcome to Sunshine!'),
      content: TextWidget(
        text:
            'Your account has been created. Your account identity is anonymous and your assigned username is: $usernameGen() .',
        textAlign: TextAlign.center,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      actions: [
        ButtonWidget(
            text: "Continue",
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
