class Book {
  String id;
  String bookTitle;
  String author;
  String bookImage;
  String description;
  List<String> category;
  List<String> reviews;

  Book(
      {this.id,
      this.bookTitle,
      this.author,
      this.bookImage,
      this.description,
      this.category,
      this.reviews});

  Book.fromJson(Map<String, dynamic> json, String bId) {
    id = bId;
    bookTitle = json['bookTitle'];
    author = json['author'];
    bookImage = json['bookImage'];
    description = json['description'];
    // category = List.from(json['category']);
    // reviews = List.from(json['reviews']);
    if (json['reviews'] != null) {
      reviews = json['reviews'].cast<String>();
    } else {
      reviews = [];
    }
    if (json['category'] != null) {
      category = json['category'].cast<String>();
    } else {
      category = [];
    }
    // category = json['category'].cast<String>();
    // reviews = json['reviews'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookTitle'] = this.bookTitle;
    data['author'] = this.author;
    data['bookImage'] = this.bookImage;
    data['description'] = this.description;
    data['category'] = this.category;
    data['reviews'] = this.reviews;
    return data;
  }
}
