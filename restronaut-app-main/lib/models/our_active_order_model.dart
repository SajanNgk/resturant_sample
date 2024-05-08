// ignore_for_file: public_member_api_docs, sort_constructors_first
class ActiveOrderModel {
  String? id;
  String? state;
  String? currencyCode;
  List<Lines>? lines;
  int? subTotal;
  int? totalWithTax;
  int? totalQuantity;

  ActiveOrderModel(
      {this.id,
      this.state,
      this.currencyCode,
      this.lines,
      this.subTotal,
      this.totalWithTax,
      this.totalQuantity});

  ActiveOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    currencyCode = json['currencyCode'];
    if (json['lines'] != null) {
      lines = <Lines>[];
      json['lines'].forEach((v) {
        lines!.add(new Lines.fromJson(v));
      });
    }
    subTotal = json['subTotal'];
    totalWithTax = json['totalWithTax'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['currencyCode'] = this.currencyCode;
    if (this.lines != null) {
      data['lines'] = this.lines!.map((v) => v.toJson()).toList();
    }
    data['subTotal'] = this.subTotal;
    data['totalWithTax'] = this.totalWithTax;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Lines {
  String? id;
  ProductVariant? productVariant;
  int? unitPrice;
  int? quantity;

  Lines({
    required this.id,
    this.productVariant,
    this.unitPrice,
    this.quantity,
  });

  Lines.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    productVariant = json['productVariant'] != null
        ? new ProductVariant.fromJson(json['productVariant'])
        : null;
    unitPrice = json['unitPrice'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productVariant != null) {
      data['productVariant'] = this.productVariant!.toJson();
    }
    data["id"] = this.id;
    data['unitPrice'] = this.unitPrice;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ProductVariant {
  String? id;
  String? name;
  int? price;
  List<Assets>? assets;
  Products? product;

  ProductVariant({this.id, this.name, this.price, this.assets, this.product});

  ProductVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
    product =
        json['product'] != null ? new Products.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Assets {
  String? preview;

  Assets({this.preview});

  Assets.fromJson(Map<String, dynamic> json) {
    preview = json['preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preview'] = this.preview;
    return data;
  }
}

class Products {
  FeaturedAsset? featuredAsset;

  Products({this.featuredAsset});

  Products.fromJson(Map<String, dynamic> json) {
    featuredAsset = json['featuredAsset'] != null
        ? new FeaturedAsset.fromJson(json['featuredAsset'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featuredAsset != null) {
      data['featuredAsset'] = this.featuredAsset!.toJson();
    }
    return data;
  }
}

class FeaturedAsset {
  String? source;

  FeaturedAsset({this.source});

  FeaturedAsset.fromJson(Map<String, dynamic> json) {
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    return data;
  }
}
