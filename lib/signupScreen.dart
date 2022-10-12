import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:http/http.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpScreenSTF();
  }
}
class SignUpScreenSTF extends StatefulWidget {
  const SignUpScreenSTF({Key? key}) : super(key: key);

  @override
  State<SignUpScreenSTF> createState() => _SignUpScreenSTFState();
}

class _SignUpScreenSTFState extends State<SignUpScreenSTF> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  Future<void> login( String email, password) async {
    try{
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body:{
          'email': email,
          'password' : password,
        }
      );
      if (response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Account Created');

      }else{
        print('Faild');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(20),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Email Text Field
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                ///sized Box
                SizedBox(height: 20),
                /// Password Text Field
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                ///sized Box
                SizedBox(height: 40),
                /// Button
                GestureDetector(
                  onTap: (){
                    login(emailController.text.toString(),passwordController.text.toString());
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Signup',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), ),
    );
  }
}

