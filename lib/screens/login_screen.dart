import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/home_screen.dart';
import 'package:healthcare/screens/sign_up_screen.dart';
// import 'package:healthcare/screens/sign_up_screen.dart';
// import 'package:healthcare/widgets/navbar_roots.dart';

class LogInScreenState extends StatelessWidget {
  LogInScreenState({super.key});

  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_logInKey.currentState!.validate()) {
      ScaffoldMessenger.of(_logInKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return '* Masukan Email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return '* Masukan Email yang Benar';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return '* Masukan Password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(95, 189, 255, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Form(
            key: _logInKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Image.asset("assets/logoRectangle.png"),
                    ),
                    Text(
                      'doctstant',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 50.0),
                    ),
                  ],
                ),
                SizedBox(height: 100.0),
                Row(
                  children: [
                    Text(
                      'berobat\nsemakin\nmudah!',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: "Email",
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: _validateEmail
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: _validatePassword
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        color: Colors.black, fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 229, 94, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "Belum punya Akun? Daftar",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

