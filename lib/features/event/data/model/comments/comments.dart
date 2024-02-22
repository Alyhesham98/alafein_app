
class Comments {
  String? Comment;
  String? FirstName;
  String? LastName;
  String? Photo;

  Comments({
    this.Comment,
    this.FirstName,
    this.LastName,
    this.Photo,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
    FirstName: json['FirstName'] as String?,
    Photo: json['Photo'] as String?,
    LastName: json['LastName'] as String?,
    Comment: json['Comment'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'FirstName': FirstName,
    'Comment': Comment,
    'LastName': LastName,
    'Photo': Photo,
  };
}
