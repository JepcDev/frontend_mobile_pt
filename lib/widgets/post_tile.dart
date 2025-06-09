import 'package:flutter/material.dart';
import 'package:frontend_mobile_pt/screens/user_profile_screen.dart';
import '../models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onCommentsTap;

  const PostTile({super.key, required this.post, required this.onCommentsTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        // init
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UserProfileScreen(userId: post.userId),
              ),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text(
              post.userId.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // End
        title: Text(
          post.title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: IconButton(
          icon: Icon(Icons.comment),
          onPressed: onCommentsTap,
        ),
      ),
    );
  }
}
