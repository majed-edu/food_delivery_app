import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/components/my_buttom.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function() onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  // Log in the user
  Future<void> loginUser() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      showErrorDialog('Please enter your email and password.');
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'Invalid email address.';
          break;
        case 'invalid-credential':
          message = 'Invalid email or password.';
          break;
        case 'too-many-requests':
          message = 'Too many attempts. Please try again later.';
          break;
        default:
          message = e.message ?? 'Something went wrong.';
      }

      if (mounted) showErrorDialog(message);
    } catch (e) {
      if (mounted) showErrorDialog('Something went wrong. Please try again.');
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  // Display error dialog
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // App Icon
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: colors.secondary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.fastfood_rounded,
                    size: 100,
                    color: colors.inversePrimary,
                  ),
                ),

                const SizedBox(height: 25),

                // App Name
                Text(
                  'Food Delivery App',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: colors.inversePrimary,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle
                Text(
                  'Welcome back! You\'ve been missed.',
                  style: TextStyle(fontSize: 14, color: colors.primary),
                ),

                const SizedBox(height: 45),

                // Email Field
                MyTextField(
                  hintText: 'Email',
                  controller: emailController,
                  obscureText: false,
                ),

                const SizedBox(height: 18),

                // Password Field
                MyTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),

                const SizedBox(height: 35),

                // Sign In Button
                MyButtom(
                  onTap: isLoading ? null : loginUser,
                  text: isLoading ? 'Signing In...' : 'Sign In',
                ),

                const SizedBox(height: 35),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: colors.primary, fontSize: 14),
                    ),

                    const SizedBox(width: 6),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: colors.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
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
