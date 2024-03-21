import 'package:flutter/material.dart';
import 'package:sunshine/Core/username_generator.dart';
import 'package:sunshine/Core/utils.dart';
import 'package:sunshine/Core/widgets.dart';

class NewUserDialogue extends StatefulWidget {
  const NewUserDialogue({super.key});

  @override
  State<NewUserDialogue> createState() => _NewUserDialogueState();
}

class _NewUserDialogueState extends State<NewUserDialogue> {
  String? username;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    username =
        await getUsername(); // Replace with your actual username retrieval logic
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: loadUsername(), // Use the future returned by loadUsername
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              // Handle potential errors during username retrieval (optional)
              print('Error loading username: ${snapshot.error}');
              return const Text('An error occurred. Please try again later.');
            } else {
              return AlertDialog(
                backgroundColor: AppColors.secondary,
                icon: const Icon(Icons.account_circle,
                    size: 50, color: Colors.white),
                title: const TextWidget(
                  text: 'Welcome to Sunshine!',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
                content: TextWidget(
                  text:
                      'Your account has been created. Your account identity is anonymous and your assigned username is: $username.',
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  height: 1.2,
                ),
                actions: [
                  ButtonWidget(
                    text: "Continue",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
