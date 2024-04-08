import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_firebase/page/home_scree.dart';
import 'package:new_flutter_firebase/page/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");

  bool isValidate() {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isObsucureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(
            20,
          ),
          children: [
            bodys(),
          ],
        ),
      ),
    );
  }

  Widget bodys() {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Login Your Account",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              contentPadding: const EdgeInsets.all(
                12,
              ),
              hintText: "name@example.com",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            controller: txtEmail,
            cursorColor: Colors.black,
            enabled: true,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              contentPadding: const EdgeInsets.all(
                12,
              ),
              hintText: "enter your password",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObsucureText = !isObsucureText;
                  });
                },
                icon: Icon(
                  isObsucureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            controller: txtPassword,
            cursorColor: Colors.black,
            enabled: true,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            obscureText: isObsucureText,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  40,
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.purple,
                animationDuration: const Duration(
                  seconds: 3,
                ),
              ),
              onPressed: () {
                if (isValidate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tolong Masukkan Field nya"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "dont't have account ?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}