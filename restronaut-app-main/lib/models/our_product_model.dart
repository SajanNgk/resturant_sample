class OurProductModel {
  String? productName;
  String? productId;
  List<dynamic>? productAssets;
  int? lowPrice;
  int? highPrice;
  List<String>? productNameList;
  List<ProductVariantDetail>? productVariantDetail;

  OurProductModel(
      {this.productId,
      this.productName,
      this.productAssets,
      this.lowPrice,
      this.highPrice,
      this.productNameList,
      this.productVariantDetail});

  OurProductModel.fromJson(Map<dynamic, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productAssets = json['productAssets'];
    lowPrice = json['lowPrice'];
    highPrice = json['highPrice'];
    productNameList = json['productNameList'].cast<String>();
    if (json['productVariantDetail'] != null) {
      productVariantDetail = <ProductVariantDetail>[];
      json['productVariantDetail'].forEach((v) {
        productVariantDetail!.add(new ProductVariantDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productAssets'] = this.productAssets;
    data['lowPrice'] = this.lowPrice;
    data['highPrice'] = this.highPrice;
    data['productNameList'] = this.productNameList;
    if (this.productVariantDetail != null) {
      data['productVariantDetail'] =
          this.productVariantDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductVariantDetail {
  String? productVariantName; //s
  String? slug; //s
  String? productId; //i
  String? productName; //s
  String? productVarientAsset; //s
  String? description; //s
  String? currencyCode; //s
  int? priceWithTax; //i
  String? productVariantId; //i
  bool? inStock;
  int? price;

  ProductVariantDetail(
      {this.productVariantName,
      this.slug,
      this.price,
      this.productId,
      this.productName,
      this.productVarientAsset,
      this.description,
      this.currencyCode,
      this.priceWithTax,
      this.productVariantId,
      this.inStock});

  ProductVariantDetail.fromJson(Map<String, dynamic> json) {
    productVariantName = json['productVariantName'];
    slug = json['slug'];
    productId = json['productId'];
    productName = json['productName'];
    productVarientAsset = json['productVarientAsset'];
    description = json['description'];
    currencyCode = json['currencyCode'];
    priceWithTax = json['priceWithTax'];
    productVariantId = json['productVariantId'];
    inStock = json['inStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productVariantName'] = this.productVariantName;
    data['slug'] = this.slug;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productVarientAsset'] = this.productVarientAsset;
    data['description'] = this.description;
    data['currencyCode'] = this.currencyCode;
    data['priceWithTax'] = this.priceWithTax;
    data['productVariantId'] = this.productVariantId;
    data['inStock'] = this.inStock;
    return data;
  }
}
