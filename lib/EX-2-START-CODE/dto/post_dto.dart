class PostDto {
  int userId;
  int id;
  String title;
  String body;

  PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
