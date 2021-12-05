class ReviewTest {
  String id;
  String reviewerId;
  String reviewerUsername;
  String reviewerProfileImage;
  String bookId;
  String bookTitle;
  String bookImage;
  String bookAuthor;
  List<String> likes;
  List<Comments> comments;
  String reviewDatetime;

  ReviewTest(
      {this.id,
      this.reviewerId,
      this.reviewerUsername,
      this.reviewerProfileImage,
      this.bookId,
      this.bookTitle,
      this.bookImage,
      this.bookAuthor,
      this.likes,
      this.comments,
      this.reviewDatetime});

  ReviewTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reviewerId = json['reviewerId'];
    reviewerUsername = json['reviewerUsername'];
    reviewerProfileImage = json['reviewerProfileImage'];
    bookId = json['bookId'];
    bookTitle = json['bookTitle'];
    bookImage = json['bookImage'];
    bookAuthor = json['bookAuthor'];
    likes = json['likes'].cast<String>();
    if (json['comments'] != null) {
      // comments = new List<Comments>();
      comments = new List<Comments>.empty(growable: true);

      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    reviewDatetime = json['reviewDatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reviewerId'] = this.reviewerId;
    data['reviewerUsername'] = this.reviewerUsername;
    data['reviewerProfileImage'] = this.reviewerProfileImage;
    data['bookId'] = this.bookId;
    data['bookTitle'] = this.bookTitle;
    data['bookImage'] = this.bookImage;
    data['bookAuthor'] = this.bookAuthor;
    data['likes'] = this.likes;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['reviewDatetime'] = this.reviewDatetime;
    return data;
  }
}

class Comments {
  String commentId;
  String username;
  String userId;
  String datetime;
  String comment;

  Comments(
      {this.commentId,
      this.username,
      this.userId,
      this.datetime,
      this.comment});

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    username = json['username'];
    userId = json['userId'];
    datetime = json['datetime'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['username'] = this.username;
    data['userId'] = this.userId;
    data['datetime'] = this.datetime;
    data['comment'] = this.comment;
    return data;
  }
}
