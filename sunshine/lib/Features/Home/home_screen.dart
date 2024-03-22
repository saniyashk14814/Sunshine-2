import 'package:flutter/material.dart';
import 'package:sunshine/Core/username_generator.dart';
import 'package:sunshine/Core/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    username = await getUsername();
    setState(() {}); // Notify the framework that the state has changed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$username\'s Home'),
        backgroundColor: AppColors.background,
        
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Sunshine!'),
          ],
        ),
      ),
    );
  }
}
