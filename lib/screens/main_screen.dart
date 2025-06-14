import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Soft light background
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.08,
            vertical: h * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo
              SizedBox(height: h * 0.15),
              Center(
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: h * 0.15,
                ),
              ),

              SizedBox(height: h * 0.03),

              // App Name & Tagline
              Text(
                "File Tracking System",
                style: GoogleFonts.nunito(
                  fontSize: h * 0.029,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333C4A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Secure. Smart. Swift File Tracking.",
                style: GoogleFonts.nunito(
                  fontSize: h * 0.02,
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: h * 0.06),

              // Login Options
              _buildLoginButton(
                context,
                title: "Admin Login",
                icon: Icons.admin_panel_settings_rounded,
                onTap: () => Navigator.pushNamed(context, '/adminLogin'),
              ),
              const SizedBox(height: 20),
              _buildLoginButton(
                context,
                title: "Employee Login",
                icon: Icons.badge_rounded,
                onTap: () => Navigator.pushNamed(context, '/employeeLogin'),
              ),

              const Spacer(),

              // Footer
              Text(
                "Powered by Visito Ventures Pvt. Ltd.",
                style: GoogleFonts.nunito(
                  fontSize: h * 0.018,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: h * 0.022),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blueGrey, size: h * 0.03),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: h * 0.022,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
