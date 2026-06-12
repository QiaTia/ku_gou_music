import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/login/login.dart';
import 'package:ku_gou_music/store/user.dart';

class PasswordLogin extends StatefulWidget {
  const PasswordLogin({super.key});

  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please enter username and password',
        duration: Duration(seconds: 2),
      ));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await loginByPassword(
        username: _usernameController.text,
        password: _passwordController.text,
      );

      if (response.body?['status'] == 1) {
        userInstance.setNewUser(response.body!['data'] ?? {});
        Get.back(result: true);
        Get.showSnackbar(const GetSnackBar(
          message: 'Login successful',
          duration: Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          message: response.body?['error_msg'] ?? 'Login failed',
          duration: const Duration(seconds: 2),
        ));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: 'Error: ${e.toString()}',
        duration: const Duration(seconds: 2),
      ));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInputField(
          controller: _usernameController,
          hint: 'Username / Phone',
          icon: Icons.person_outline_rounded,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 16),
        _buildInputField(
          controller: _passwordController,
          hint: 'Password',
          icon: Icons.lock_outline_rounded,
          obscureText: _obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              color: Colors.white.withAlpha(150),
              size: 20,
            ),
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: Colors.cyanAccent.withAlpha(200),
                fontSize: 13,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildSocialLogin(),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withAlpha(10),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withAlpha(100)),
          prefixIcon: Icon(icon, color: Colors.white.withAlpha(150), size: 22),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: _isLoading
                  ? [Colors.grey.withAlpha(100), Colors.grey.withAlpha(80)]
                  : [
                      Colors.purpleAccent.withAlpha(220),
                      Colors.blueAccent.withAlpha(220),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withAlpha(_isLoading ? 20 : 60),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withAlpha(40))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.white.withAlpha(100),
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.white.withAlpha(40))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(Icons.wechat_rounded, Colors.green.withAlpha(200)),
            const SizedBox(width: 20),
            _buildSocialButton(Icons.apple_rounded, Colors.white),
            const SizedBox(width: 20),
            _buildSocialButton(Icons.phone_android_rounded, Colors.cyanAccent.withAlpha(200)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha(15),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}