import 'package:flutter/material.dart';
import 'package:mad_assignment/main.dart'; 
import 'package:mad_assignment/register.dart';
class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Login",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green),
        ),
      ),
      body:  Align(
        alignment: Alignment.topCenter, 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                SizedBox(height: 50), 

                // Illustration and Lanka Real Estate text section
                Column(
                  children: [
                    Image.asset(
                      'assets/applogo.png',
                      height: 100, 
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lanka Real Estate",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                  ],
                ),

                // Login Text
                Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Username Field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 188, 128, 37)),
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.orange.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Password Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 166, 113, 33)),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.orange.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => RealEstateHomePage()),
                        );
                      });
                    },
                    child: Material(
                      color: Color.fromARGB(255, 34, 92, 18),
                      borderRadius: BorderRadius.circular(10),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),

                // Forgot Password & Help
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?", style: TextStyle(color: Colors.black54)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Help", style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Not Registered? Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not Registered? ", style: TextStyle(color: Colors.black54)),
                    GestureDetector(
                      onTap: () { 
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        "Create account",
                        style: TextStyle(color: Color.fromARGB(255, 171, 109, 15), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
