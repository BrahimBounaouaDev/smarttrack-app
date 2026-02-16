/*import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // شعار SmartTrack
                Column(
                  children: [
                    Image.asset(
                      "assets/logo/logo_auth",
                      height: 180,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "SMART TRACK",
                      style: TextStyle(
                        color: Color(0xFFC47A3A),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Oilfield & Drilling Rig Equipment",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Email
                _buildInputField(
                  controller: emailCtrl,
                  label: "Email",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                // Password
                _buildInputField(
                  controller: passCtrl,
                  label: "Password",
                  icon: Icons.lock_outline,
                  obscure: _obscure,
                  suffix: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFFC47A3A),
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // زر تسجيل الدخول
                _loading
                    ? const CircularProgressIndicator(
                        color: Color(0xFFC47A3A),
                      )
                    : ElevatedButton(
                        onPressed: _onLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC47A3A),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFFC47A3A),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC47A3A),
          width: 1.2,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: const Color(0xFFC47A3A)),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  void _onLogin() async {
    setState(() => _loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    // TODO: الانتقال للصفحة الرئيسية
    // Navigator.pushReplacementNamed(context, '/products');
  }
}*/













import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // شعار SmartTrack
                Column(
                  children: [
                    Image.asset(
                      "assets/logo/logo.png",
                      height: 180,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "SMART TRACK",
                      style: TextStyle(
                        color: Color(0xFFC47A3A),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Oilfield & Drilling Rig Equipment",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Email
                _buildInputField(
                  controller: emailCtrl,
                  label: "Email",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                // Password
                _buildInputField(
                  controller: passCtrl,
                  label: "Password",
                  icon: Icons.lock_outline,
                  obscure: _obscure,
                  suffix: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFFC47A3A),
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // زر تسجيل الدخول
                _loading
                    ? const CircularProgressIndicator(
                        color: Color(0xFFC47A3A),
                      )
                    : ElevatedButton(
                        onPressed: _onLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC47A3A),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFFC47A3A),
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ قسم "أو تسجيل الدخول باستخدام"
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),

                const SizedBox(height: 25),

                // ✅ أيقونات وسائل التواصل الاجتماعي
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Facebook
                    _buildSocialIconButton(
                      imagePath: "assets/logo/facebook.png",
                      onTap: _onFacebookLogin,
                    ),
                    
                    const SizedBox(width: 25),
                    
                    // Email
                    _buildSocialIconButton(
                      imagePath: "assets/logo/email.png",
                      onTap: _onEmailLogin,
                    ),
                    
                    const SizedBox(width: 25),
                    
                    // LinkedIn
                    _buildSocialIconButton(
                      imagePath: "assets/logo/linkedin.png",
                      onTap: _onLinkedInLogin,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ✅ نص إنشاء حساب جديد
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onSignUp,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFFC47A3A),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
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

  // ✅ دالة لبناء أزرار الأيقونات
  Widget _buildSocialIconButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          //color: const Color(0xFF2A2A2A),
          shape: BoxShape.circle,
          border: Border.all(
            //color: const Color(0xFFC47A3A),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            //color: Colors.white, // إذا كانت الأيقونات بيضاء
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC47A3A),
          width: 1.2,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: const Color(0xFFC47A3A)),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  void _onLogin() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
    // Navigator.pushReplacementNamed(context, '/products');
     
        Navigator.pushReplacementNamed(context, '/HomePage');
        
  }

  // ✅ دوال معالجة النقر على الأيقونات
  void _onFacebookLogin() {
    print("تسجيل الدخول بـ Facebook");
    // هنا منطق تسجيل الدخول بـ Facebook
  }

  void _onEmailLogin() {
    print("تسجيل الدخول بـ Email");
    // هنا منطق تسجيل الدخول بـ Email
  }

  void _onLinkedInLogin() {
    print("تسجيل الدخول بـ LinkedIn");
    // هنا منطق تسجيل الدخول بـ LinkedIn
  }

  void _onSignUp() {
    print("الانتقال إلى صفحة إنشاء حساب");
    // Navigator.pushNamed(context, '/signup');
  }
}