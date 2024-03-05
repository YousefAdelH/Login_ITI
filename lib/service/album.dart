class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
      };
}
