import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email'
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Provide a valid email';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Password'
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length < 6) {
                      return 'Provide a valid password of at least 6 characters';
                    }
                    return null;
                  }
                )
              ),

              ElevatedButton(
                onPressed: _authenticate,
                child: Text('Login as admin')
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_errMsg, style: const TextStyle(fontSize: 18, color: Colors.red))
              )
            ]
          )
        )
      )
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if(_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait...');
      final email = _emailController.text;
      final pass = _passwordController.text;
      try {
        final status = await AuthService.loginAdmin(email, pass);
        EasyLoading.dismiss();
        if(status) {
          context.goNamed(DashboardPage.routeName);
        } else {
          AuthService.logout();
          setState(() {
            _errMsg = 'This is not an Admin account';
          });
        }

      } on FirebaseAuthException catch(error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
  }

}

