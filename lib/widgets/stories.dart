import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/models/models.dart';
import 'package:facebookclone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories({required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(isAddStory: true, currentUser: currentUser),
            );
          }

          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(story: story),
          );
        },
        itemCount: 1 + stories.length,
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  _StoryCard({this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
          child: isAddStory
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: Palette.facebookBlue,
                    padding: EdgeInsets.zero,
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl as String,
                  hasOrder: !story!.isViewed,
                ),
          top: 8,
          left: 8,
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
