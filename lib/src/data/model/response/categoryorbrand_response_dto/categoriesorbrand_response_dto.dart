import '../../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';

class CategoryOrBrandResponseDto {
  int? results;
  Metadata? metadata;
  List<CategoryDataDto>? dataDto;

  CategoryOrBrandResponseDto({this.results, this.metadata, this.dataDto});

  CategoryOrBrandResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      dataDto = <CategoryDataDto>[];
      json['data'].forEach((v) {
        dataDto!.add(new CategoryDataDto.fromJson(v));
      });
    }
  }
  CategoryOrBrandResponseEntity toEntity() => CategoryOrBrandResponseEntity(
        data: dataDto
            ?.map((data) => CategoryOrBrandDataEntity(
                  id: data.sId,
                  name: data.name,
                  image: data.image,
                  slug: data.slug,
                ))
            .toList(),
        results: results,
      );
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class CategoryDataDto {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryDataDto(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoryDataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  CategoryOrBrandDataEntity toEntity() => CategoryOrBrandDataEntity(
        image: image,
        name: name,
        slug: slug,
        id: sId,
      );
}
