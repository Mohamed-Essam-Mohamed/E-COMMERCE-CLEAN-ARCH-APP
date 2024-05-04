import 'package:e_commerce/src/domain/entities/add_to_cart/addtocart_response_enitiy.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  AddCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddCartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data =
        json['data'] != null ? new AddDataCartDto.fromJson(json['data']) : null;
  }
}

class AddDataCartDto extends AddDataCartEntity {
  AddDataCartDto({
    super.sId,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.iV,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <AddProductsCartDto>[];
      json['products'].forEach((v) {
        products!.add(new AddProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductsCartDto extends AddProductsCartEntity {
  AddProductsCartDto({
    super.count,
    super.sId,
    super.product,
    super.price,
  });

  AddProductsCartDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
