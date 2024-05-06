class GetLoggedCartResponseEntity {
  String? status;
  int? numOfCartItems;
  DataCartEntity? data;

  GetLoggedCartResponseEntity({this.status, this.numOfCartItems, this.data});
}

class DataCartEntity {
  String? sId;
  String? cartOwner;
  List<ProductsCartsEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  DataCartEntity(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});
}

class ProductsCartsEntity {
  int? count;
  String? sId;
  ProductCartEntity? product;
  int? price;

  ProductsCartsEntity({this.count, this.sId, this.product, this.price});
}

class ProductCartEntity {
  List<SubcategoryCartEntity>? subcategory;
  String? sId;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryCartEntity? category;
  CategoryCartEntity? brand;
  num? ratingsAverage;
  String? id;

  ProductCartEntity(
      {this.subcategory,
      this.sId,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id});
}

class SubcategoryCartEntity {
  String? sId;
  String? name;
  String? slug;
  String? category;

  SubcategoryCartEntity({this.sId, this.name, this.slug, this.category});
}

class CategoryCartEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;

  CategoryCartEntity({this.sId, this.name, this.slug, this.image});
}
