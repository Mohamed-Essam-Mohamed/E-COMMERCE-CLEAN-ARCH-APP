import '../../../../domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null
        ? new AddToDataCartDto.fromJson(json['data'])
        : null;
  }
}

class AddToDataCartDto extends AddToDataCartEntity {
  AddToDataCartDto({
    super.sId,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.iV,
    super.totalCartPrice,
  });

  AddToDataCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <AddToProductsCartDto>[];
      json['products'].forEach((v) {
        products!.add(new AddToProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddToProductsCartDto extends AddToProductsCartEntity {
  AddToProductsCartDto({
    super.count,
    super.sId,
    super.product,
    super.price,
  });

  AddToProductsCartDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
