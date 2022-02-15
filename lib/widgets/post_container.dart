import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ]),
          ),
          post.imageUrl != null
              ? CachedNetworkImage(imageUrl: post.imageUrl)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader({required this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl as String),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} ',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}
