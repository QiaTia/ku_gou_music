import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';

class RotatingAlbumCover extends StatefulWidget {
  final MusicController musicController;
  const RotatingAlbumCover({super.key, required this.musicController});

  @override
  State<RotatingAlbumCover> createState() => _RotatingAlbumCoverState();
}

class _RotatingAlbumCoverState extends State<RotatingAlbumCover>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final song = widget.musicController.currentSong;
      return RotationTransition(
        turns: _animController,
        child: Hero(
          tag: '_buildAlbumCover',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: song == null
                  ? Container(
                      color: Colors.grey[800],
                      child: Center(
                        child: Icon(
                          Icons.music_note,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: song.cover,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.music_note),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
