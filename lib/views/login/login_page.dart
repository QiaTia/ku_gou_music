import 'dart:ui';
import 'package:flutter/material.dart';
import 'password_login.dart';
import 'qr_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D0221),
              Color(0xFF0F084B),
              Color(0xFF26408B),
              Color(0xFF0D0221),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: _buildGlowOrb(200, Colors.purpleAccent.withAlpha(80)),
            ),
            Positioned(
              bottom: -150,
              right: -100,
              child: _buildGlowOrb(300, Colors.blueAccent.withAlpha(60)),
            ),
            Positioned(
              top: size.height * 0.3,
              right: size.width * 0.2,
              child: _buildGlowOrb(150, Colors.cyanAccent.withAlpha(40)),
            ),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 20 : 40),
                child: _buildGlassContainer(isMobile),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlowOrb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }

  Widget _buildGlassContainer(bool isMobile) {
    final isWideScreen = MediaQuery.of(context).size.width >= 800;

    if (isWideScreen) {
      return _buildWideLayout();
    }

    final containerWidth = isMobile ? double.infinity : 450.0;

    return Container(
      width: containerWidth,
      decoration: _glassDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 24 : 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildTabBar(),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 350,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        PasswordLogin(),
                        QrLogin(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 820),
      decoration: _glassDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.white.withAlpha(20),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 32),
                        _buildTabBar(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: SizedBox(
                      height: 350,
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          PasswordLogin(),
                          QrLogin(),
                        ],
                      ),
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

  BoxDecoration _glassDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withAlpha(25),
          Colors.white.withAlpha(10),
        ],
      ),
      border: Border.all(
        color: Colors.white.withAlpha(30),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(60),
          blurRadius: 40,
          spreadRadius: -10,
        ),
        BoxShadow(
          color: Colors.purpleAccent.withAlpha(20),
          blurRadius: 60,
          spreadRadius: -20,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent.withAlpha(200),
                Colors.cyanAccent.withAlpha(200),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent.withAlpha(80),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.music_note_rounded,
            color: Colors.white,
            size: 36,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'KuGou Music',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Welcome back',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withAlpha(150),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withAlpha(15),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent.withAlpha(180),
              Colors.blueAccent.withAlpha(180),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withAlpha(60),
              blurRadius: 8,
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withAlpha(150),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        tabs: const [
          Tab(text: 'Password'),
          Tab(text: 'QR Code'),
        ],
      ),
    );
  }
}