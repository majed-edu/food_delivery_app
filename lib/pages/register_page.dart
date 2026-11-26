
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_buttom.dart';
import 'package:food_delivery_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                    size: 65,
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
                  'Create an account to get started.',
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

                const SizedBox(height: 18),
                // Confirm Password Field
                MyTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),

                const SizedBox(height: 35),

                // Sign Up Button
                MyButtom(onTap: () {}, text: 'Sign Up'),

                const SizedBox(height: 35),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: colors.primary, fontSize: 14),
                    ),

                    const SizedBox(width: 6),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign In',
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
