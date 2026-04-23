// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceflutter/Services/auth_service.dart';
import 'package:ecommerceflutter/View/home_screen.dart';
import 'package:ecommerceflutter/View/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
     bool siLoading = false; //to show loading indicator on login button
   bool isPasswordHidder = true; //state to toggle password visibility
     //instance for Authservice for authentication logic
   final AuthService authService = AuthService();
   void login() async{
    setState(() {
      siLoading = true; //show loading indicator on login button
    });
    // call login function from auth service with user inputs,
    String? result = await authService.login(
      emailController.text,
      passwordController.text
    );

    setState(() {
      siLoading = false; //hide loading indicator after login attempt
    });
    // Navigate based on the role or show the error message
    if(result == "Admin") {
      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdminScreen()
                      ),
                    );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful! Welcome Admin."))
      );
      // Navigate to admin dashboard (not implemented here)
    } else if(result == "User") {
      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserScreen()
                      ),
                    );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful! Welcome User."))
      );
      // Navigate to user dashboard (not implemented here)
    } else {
      //login failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $result"))
      );
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding
        (padding: EdgeInsets.all(16.0), 
        child: Column(
          children:[
            Image.asset("assets/bridge4.jpg"),
            SizedBox(height: 20),
            //input for email,
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
           //input for password,
             TextField(
              controller: passwordController,
              obscureText: isPasswordHidder, 
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordHidder ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isPasswordHidder = !isPasswordHidder;
                    });
                  },
                ), //icon to indicate password field
              ),
            ),
            const SizedBox(height: 20,),
            //login button
             siLoading ? const Center(child: CircularProgressIndicator(),) :
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: login, 
              child: Text("Login")
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 18),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignupScreen()
                      ),
                    );
                  },
                  child: Text(
                    " Signup here",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
     ),
    );
  }
}