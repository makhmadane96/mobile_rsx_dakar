import 'package:flutter/material.dart';
import 'package:mobile_rsx/Contact.dart';
import 'package:mobile_rsx/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  child: Image.asset('assets/images/photo.jpg'),
                  height: 200,
                  width: 150,
                ),
              ),
            ),
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Login",
                  hintText: '"Enter un login valide '
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: '"Enter un login valide '
                ),
              ),
            ),
            TextButton(
                onPressed: () =>{
                  print('Mot de passe oublie')
                },
                child: Text(
                  'Mot de passe oublie',
                  style: TextStyle(color: Colors.blue,fontSize: 15),

                )
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.pink,borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed: () =>{
                      Navigator.push(context,MaterialPageRoute(builder: (_) => HomePage()))
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white,fontSize: 25),

                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}