class CategoryModel {
  String? name;
  String? slug;
  String? id;
  List<Asset>? assets;

  CategoryModel({this.name, this.slug, this.id, this.assets});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    if (json['assets'] != null) {
      assets = <Asset>[];
      json['assets'].forEach((v) {
        assets!.add(new Asset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['id'] = this.id;
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Asset {
  String? source;

  Asset({this.source});

  Asset.fromJson(Map<String, dynamic> json) {
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    return data;
  }
}
