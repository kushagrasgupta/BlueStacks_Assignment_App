import 'package:flutter/material.dart';
import 'package:interview_task/providers/auth_status.dart';
import 'package:interview_task/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(''), accountEmail: Text('')),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              context.read<AuthStatus>().logOut();
              final pref = await SharedPreferences.getInstance();
              await pref.setBool('status', false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

//Navigation 2
// push, pop
// push -> push, pushReplacement
