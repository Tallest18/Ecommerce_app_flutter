import 'package:ecommerceflutter/View/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
   TextEditingController nameController =TextEditingController();

   String selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0), 
        child: Column(
          children:[
            Image.asset("assets/bridge4.jpg"),
            SizedBox(height: 20),
            //input for name,
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
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
              obscureText: true, 
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
             // dropdown for selecting the role
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  labelText: "Role",
                  border: OutlineInputBorder(),
                ),
                items: ["Admin", "User"].map((role) {         // ✅ arrow (=>) added
                  return DropdownMenuItem<String>(
                    value: role,                               // ✅ value added
                    child: Text(role),                        // ✅ comma, not semicolon
                  );                                          // ✅ proper closing
                }).toList(),                                   // ✅ toList() not toList{}
                onChanged: (value) {                          // ✅ proper onChanged
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),
            const SizedBox(height: 20,),
            //signup button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, 
              child: Text("Signup")
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 18),
                ),
                 InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen()
                      ),
                    );
                  },
                  child: Text(
                  " Login here",
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
    );
  }
}