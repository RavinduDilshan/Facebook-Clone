import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasOrder;

  ProfileAvatar(
      {required this.imageUrl, this.isActive = false, this.hasOrder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
              radius: hasOrder ? 17 : 20,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(imageUrl)),
        ),
        isActive
            ? Positioned(
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                ),
                bottom: 0,
                right: 0)
            : const SizedBox.shrink()
      ],
    );
  }
}
