import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/login/qr.dart';
import 'package:ku_gou_music/store/user.dart';

class QrLogin extends StatefulWidget {
  const QrLogin({super.key});

  @override
  State<QrLogin> createState() => _QrLoginState();
}

class _QrLoginState extends State<QrLogin> {
  String? _qrCode;
  Uint8List? _qrImgBytes;
  Timer? _pollTimer;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _createQrCode();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _createQrCode() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await createQrByLogin();
      final qrImgStr = result['qrImg'];
      setState(() {
        _qrCode = result['qrCode'];
        _qrImgBytes = qrImgStr != null
            ? base64Decode(qrImgStr.split(',')[1])
            : null;
        _isLoading = false;
      });
      _startPolling();
    } catch (e) {
      setState(() {
        _error = 'Failed to create QR code';
        _isLoading = false;
      });
    }
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      if (_qrCode == null) return;

      try {
        final response = await checkQrStatus(_qrCode!);
        final status = response.body?['data']?['status'];

        if (status == 4) {
          _pollTimer?.cancel();
          print(response.body);
          userInstance.onLogin(response.body!['data'] ?? {});
          Get.back(result: true);
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Login successful',
             
             
             
              duration: Duration(seconds: 2),
            ),
          );
        } else if (status == 2) {
          if (mounted) {
            setState(() {});
          }
        }
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildQrContainer(),
        const SizedBox(height: 20),
        _buildInstructions(),
        const SizedBox(height: 16),
        _buildRefreshButton(),
      ],
    );
  }

  Widget _buildQrContainer() {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withAlpha(255),
        border: Border.all(color: Colors.white.withAlpha(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withAlpha(30),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: _buildQrContent(),
      ),
    );
  }

  Widget _buildQrContent() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.purpleAccent.withAlpha(200),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.black.withAlpha(150),
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(
                color: Colors.black.withAlpha(150),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (_qrImgBytes != null) {
      return Image.memory(
        _qrImgBytes!,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildQrPlaceholder(),
      );
    }

    return _buildQrPlaceholder();
  }

  Widget _buildQrPlaceholder() {
    return Center(
      child: Icon(
        Icons.qr_code_2_rounded,
        size: 80,
        color: Colors.black.withAlpha(100),
      ),
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: [
        Text(
          'Scan with KuGou App',
          style: TextStyle(
            color: Colors.black.withAlpha(200),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Open KuGou app → Me → Scan',
          style: TextStyle(color: Colors.black.withAlpha(120), fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildRefreshButton() {
    return TextButton.icon(
      onPressed: _createQrCode,
      icon: Icon(
        Icons.refresh_rounded,
        color: Colors.cyanAccent.withAlpha(200),
        size: 18,
      ),
      label: Text(
        'Refresh QR Code',
        style: TextStyle(color: Colors.cyanAccent.withAlpha(200), fontSize: 14),
      ),
    );
  }
}
