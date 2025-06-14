import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.08),

                // Header
                Text(
                  "Welcome Admin,",
                  style: GoogleFonts.nunito(
                    fontSize: h * 0.035,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333C4A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Login to access your dashboard",
                  style: GoogleFonts.nunito(
                    fontSize: h * 0.019,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: h * 0.06),

                // Email Field
                _buildTextField(
                  controller: _emailController,
                  hintText: "Email",
                  icon: Icons.email_outlined,
                  isPassword: false,
                ),
                SizedBox(height: h * 0.025),

                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: h * 0.015),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.nunito(
                        fontSize: h * 0.018,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.04),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Proceed with login
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        // TODO: Call backend/API
                        print('Email: $email, Password: $password');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[800],
                      padding: EdgeInsets.symmetric(vertical: h * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.nunito(
                        fontSize: h * 0.022,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Center(
                  child: Text(
                    "© 2025 Visito Ventures Pvt. Ltd.",
                    style: GoogleFonts.nunito(
                      fontSize: h * 0.017,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: h * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required bool isPassword,
  }) {
    final h = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : false,
      keyboardType:
          isPassword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter $hintText';
        }

        if (!isPassword) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Enter a valid email address';
          }
        } else {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }

        return null;
      },
      style: GoogleFonts.nunito(fontSize: h * 0.02),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.blueGrey[300],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
                : null,
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
