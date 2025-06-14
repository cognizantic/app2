import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/barrel1.dart';
import '/globals.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _hover1 = false;
  bool _hover2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("account"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("account", style: TextStyle(color: Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Signin()),
                );
              },
              child: MouseRegion(
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover2 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover2 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("home"),
                    ),
                  ),
                ),
                onEnter: (_) {
                  setState(() => _hover2 = true);
                },
                onExit: (_) {
                  setState(() => _hover2 = false);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: MouseRegion(
                child: AnimatedContainer(
                  width: 4,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _hover1 ? Colors.grey : Colors.black,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  curve: Curves.easeInOut,
                  child: ListTile(
                    leading: const Icon(Icons.logout),
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: _hover1 ? Colors.black : Colors.grey,
                      ),
                      child: const Text("sign out"),
                    ),
                  ),
                ),
                onEnter: (_) {
                  setState(() => _hover1 = true);
                },
                onExit: (_) {
                  setState(() => _hover1 = false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
