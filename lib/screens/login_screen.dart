import 'package:flutter/material.dart';
import 'package:interview_task/providers/auth_status.dart';
import 'package:interview_task/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final hardcodedUsername = "game.tv";
  final hardcodedpassword = "game.tv";
  final _formkey = GlobalKey<FormState>(); //IMP

  actionDecider() async {
    //stops the func until it gets the value desired by the user
    if (_formkey.currentState != null) {
      final isSubmit = _formkey.currentState!.validate(); // validates the form,
      if (isSubmit) {
        _formkey.currentState!.save();
        // context.read<AuthStatus>().changeStatus();
        context.read<AuthStatus>().login();
        print(context.read<AuthStatus>().flag);
        final pref = await SharedPreferences.getInstance();
        await pref.setBool('status', true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Material Type Widget
      //2 layouts -> Material App, Cupertino App
      backgroundColor: const Color(0xff722F37),
      appBar: AppBar(
        elevation: 0,
        title: Text('Game.Tv Interview Task'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Image.asset(
                        'assets/logo.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: TextFormField(
                    autofocus: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value != null) {
                        if (value.length < 3)
                          return "Username should be greater than 3 characters";
                        else if (value.length > 10)
                          return "Username should be less than 10 characters";
                        else if (value != hardcodedUsername)
                          return "Wrong Username";
                      }
                      return null;
                    },
                    key: ValueKey('username'), // firestore
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 18,
                      ),
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32,
                          ),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32,
                          ),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    key: ValueKey('pass'),
                    autofocus: true,
                    validator: (value) {
                      if (value != null) {
                        if (value.length < 3)
                          return "Password should be greater than 3 characters";
                        else if (value.length > 10)
                          return "Password should be less than 10 characters";
                        else if (value != hardcodedpassword)
                          return "Password is incorrect";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 18,
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32,
                          ),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32,
                          ),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: actionDecider,
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
