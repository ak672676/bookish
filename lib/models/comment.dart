class Comment {
  String id;
  String comment;
  String commentTime;
  String profileImageURL;
  String userId;
  String username;

  Comment(
      {this.id,
      this.comment,
      this.commentTime,
      this.profileImageURL,
      this.userId,
      this.username});

  Comment.fromJson(Map<String, dynamic> json, String cId) {
    id = cId;
    comment = json['comment'];
    commentTime = json['commentTime'];
    profileImageURL = json['profileImageURL'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['commentTime'] = this.commentTime;
    data['profileImageURL'] = this.profileImageURL;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}
