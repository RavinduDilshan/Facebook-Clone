import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl as String),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?'),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: 0.5),
          Container(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () => print('live'),
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                  VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                      onPressed: () => print('photo'),
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo')),
                  VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                      onPressed: () => print('room'),
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room')),
                ]),
          )
        ],
      ),
    );
  }
}
