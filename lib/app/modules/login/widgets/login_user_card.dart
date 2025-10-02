import 'package:flutter/material.dart';

class LoginUserCard extends StatelessWidget {
  IconData icon;
  String userType;

  LoginUserCard({super.key, required this.icon, required this.userType});
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [Icon(icon), Text(userType)]));
  }
}
