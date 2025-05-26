class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 1,
      id: json['id'] ?? 0,
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'body': body,
      };
}
