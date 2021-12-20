class Review {
  int id;
  String reviewerId;
  String reviewerProfileName;
  String reviewerProfileImage;
  List<String> likes;
  String review;
  List<String> comments;
  String bookImage;
  String bookTitle;
  String author;
  String createdAt;

  Review({
    this.id,
    this.reviewerId,
    this.reviewerProfileName,
    this.reviewerProfileImage,
    this.likes,
    this.review,
    this.comments,
    this.bookImage,
    this.bookTitle,
    this.author,
    this.createdAt,
  });

  Review.fromJson(Map<String, dynamic> json, String id) {
    id = id;
    reviewerId = json['reviewerId'];
    reviewerProfileName = json['reviewerProfileName'];
    reviewerProfileImage = json['reviewerProfileImage'];
    likes = json['likes'].cast<String>();
    review = json['review'];
    comments = json['comments'].cast<String>();
    bookImage = json['bookImage'];
    bookTitle = json['bookTitle'];
    author = json['author'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reviewerId'] = this.reviewerId;
    data['reviewerProfileName'] = this.reviewerProfileName;
    data['reviewerProfileImage'] = this.reviewerProfileImage;
    data['likes'] = this.likes;
    data['review'] = this.review;
    data['comments'] = this.comments;
    data['bookImage'] = this.bookImage;
    data['bookTitle'] = this.bookTitle;
    data['author'] = this.author;
    data['createdAt'] = this.createdAt;

    return data;
  }
}
