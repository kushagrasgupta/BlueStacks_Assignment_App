import 'package:flutter/material.dart';
import 'package:interview_task/screens/HomeScreen.dart';
import 'package:interview_task/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'providers/auth_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthStatus(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // stateless -> stateful -> data
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? status;
  getLogin() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      status = pref.getBool('status');
    });
  }

  // stateless -> -nt,ful ->
  @override
  void initState() {
    getLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<AuthStatus>().flag);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: status == true ? HomePage() : LoginScreen(),
    );
  }
}
