class RatingDetailModel {
  CustomFields? customFields;
  String? description;
  Reviews? reviews;

  RatingDetailModel({this.customFields, this.description, this.reviews});

  RatingDetailModel.fromJson(Map<String, dynamic> json) {
    customFields = json['customFields'] != null
        ? new CustomFields.fromJson(json['customFields'])
        : null;
    description = json['description'];
    reviews =
        json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customFields != null) {
      data['customFields'] = this.customFields!.toJson();
    }
    data['description'] = this.description;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    return data;
  }
}

class CustomFields {
  dynamic reviewCount;
  dynamic reviewRating;

  CustomFields({this.reviewCount, this.reviewRating});

  CustomFields.fromJson(Map<String, dynamic> json) {
    reviewCount = json['reviewCount'];
    reviewRating = json['reviewRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewCount'] = this.reviewCount;
    data['reviewRating'] = this.reviewRating;
    return data;
  }
}

class Reviews {
  List<Items>? items;
  dynamic totalItems;

  Reviews({this.items, this.totalItems});

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    return data;
  }
}

class Items {
  dynamic updatedAt;
  dynamic downvotes;
  dynamic upvotes;
  String? createdAt;
  String? authorName;
  String? id;
  String? body;
  dynamic rating;

  Items(
      {this.updatedAt,
      this.downvotes,
      this.upvotes,
      this.createdAt,
      this.authorName,
      this.id,
      this.body,
      this.rating});

  Items.fromJson(Map<String, dynamic> json) {
    updatedAt = json["updatedAt"];
    downvotes = json['downvotes'];
    upvotes = json['upvotes'];
    createdAt = json['createdAt'];
    authorName = json['authorName'];
    id = json['id'];
    body = json['body'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['downvotes'] = this.downvotes;
    data['upvotes'] = this.upvotes;
    data['createdAt'] = this.createdAt;
    data['authorName'] = this.authorName;
    data['id'] = this.id;
    data['body'] = this.body;
    data['rating'] = this.rating;
    return data;
  }
}
