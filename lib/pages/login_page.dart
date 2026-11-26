// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/my_buttom.dart';
// import 'package:food_delivery_app/components/my_textfield.dart';

// class LoginPage extends StatefulWidget {
//   final void Function() onTap;

//   const LoginPage({super.key, required this.onTap});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.fastfood,
//               size: 100,
//               color: Theme.of(context).colorScheme.inversePrimary,
//             ),

//             const SizedBox(height: 20),
//             Text(
//               'Food Delivery App',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//             ),

//             const SizedBox(height: 25),

//             MyTextField(
//               hintText: "email",
//               controller: emailController,
//               obscureText: false,
//             ),

//             const SizedBox(height: 10),

//             MyTextField(
//               hintText: "password",
//               controller: passwordController,
//               obscureText: true,
//             ),

//             const SizedBox(height: 25),

//             MyButtom(onTap: () {}, text: "Sign In"),

//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Don't have an account?",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 GestureDetector(
//                   onTap: widget.onTap,
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
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
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    // Implement your login logic here

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
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
                  onTap: () {
                    loginUser();
                  },
                  text: 'Sign In',
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
