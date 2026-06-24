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
        const SizedBox(height: 14),
        _buildInstructions(),
        const SizedBox(height: 10),
        _buildRefreshButton(),
      ],
    );
  }

  Widget _buildQrContainer() {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withValues(alpha: 0.2),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
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
                Colors.purpleAccent.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.5),
                fontSize: 12,
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
              size: 36,
            ),
            const SizedBox(height: 6),
            Text(
              _error!,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.5),
                fontSize: 11,
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
        size: 70,
        color: Colors.black.withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: [
        Text(
          'Scan with KuGou App',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Open KuGou app → Me → Scan',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildRefreshButton() {
    return TextButton.icon(
      onPressed: _createQrCode,
      icon: Icon(
        Icons.refresh_rounded,
        color: Colors.cyanAccent.withValues(alpha: 0.9),
        size: 16,
      ),
      label: Text(
        'Refresh QR Code',
        style: TextStyle(
          color: Colors.cyanAccent.withValues(alpha: 0.9),
          fontSize: 13,
        ),
      ),
    );
  }
}
