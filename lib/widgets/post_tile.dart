import 'package:flutter/material.dart';
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
        title: Text(post.title),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: IconButton(
          icon: Icon(Icons.comment),
          onPressed: onCommentsTap,
        ),
      ),
    );
  }
}
