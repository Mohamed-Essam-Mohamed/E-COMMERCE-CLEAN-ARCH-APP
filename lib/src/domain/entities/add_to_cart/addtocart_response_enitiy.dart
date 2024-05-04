class AddCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  AddDataCartEntity? data;

  AddCartResponseEntity(
      {this.status, this.message, this.numOfCartItems, this.data});
}

class AddDataCartEntity {
  String? sId;
  String? cartOwner;
  List<AddProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  AddDataCartEntity(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});
}

class AddProductsCartEntity {
  int? count;
  String? sId;
  String? product;
  int? price;

  AddProductsCartEntity({this.count, this.sId, this.product, this.price});
}
