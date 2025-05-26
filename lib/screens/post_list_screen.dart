import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../screens/add_post_screen.dart';
import '../screens/comments_screen.dart';
import '../widgets/post_tile.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Posts')),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (context, index) {
                final post = provider.posts[index];
                return PostTile(
                  post: post,
                  onCommentsTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentsScreen(postId: post.id),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddPostScreen()),
        ),
      ),
    );
  }
}
