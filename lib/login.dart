import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tes/stateProvider/login_stateProvider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var email = ref.watch(emailControllerProvider);
          var pass = ref.watch(passWordControllerProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (value) {
                  ref.read(emailControllerProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (value) {
                  ref.read(passWordControllerProvider.notifier).state = value;
                },
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                       email == "" || pass == "" ? Colors.grey : Colors.blue), // Change the color here
                  ),
                  onPressed: () {
                    if(email == "" || pass == "")
                    {
                      
                    }
                  },
                  child: Text("Login"))
            ],
          );
        },
      ),
    );
  }
}
