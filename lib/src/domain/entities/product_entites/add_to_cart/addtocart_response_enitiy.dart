class AddToCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  AddToDataCartEntity? data;

  AddToCartResponseEntity(
      {this.status, this.message, this.numOfCartItems, this.data});
}

class AddToDataCartEntity {
  String? sId;
  String? cartOwner;
  List<AddToProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  AddToDataCartEntity(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});
}

class AddToProductsCartEntity {
  int? count;
  String? sId;
  String? product;
  int? price;

  AddToProductsCartEntity({this.count, this.sId, this.product, this.price});
}
