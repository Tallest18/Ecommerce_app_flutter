import 'package:ecommerceflutter/Services/auth_service.dart';
import 'package:flutter/material.dart';
AuthService authService = AuthService();

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),
      body: const Center(
        child: Text("Welcome, Admin!"),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
      ),
      body: const Center(
        child: Text("Welcome, User!"),
      ),
    );
  }
}