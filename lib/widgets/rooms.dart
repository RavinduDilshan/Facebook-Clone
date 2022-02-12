import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _createRoomButton(),
            );
          }

          final User user = onlineUsers[index - 1];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imageUrl: user.imageUrl as String,
              isActive: true,
            ),
          );
        },
        itemCount: 1 + onlineUsers.length,
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('create room'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      borderSide: BorderSide(width: 3, color: Colors.blueAccent),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
