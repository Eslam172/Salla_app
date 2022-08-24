class HomeModel {
  late final bool status;
  late final HomeModelData data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = HomeModelData.fromJson(json['data']);
  }
}

class HomeModelData{
  late final List<BannersModel> banners =[];
  late final List<ProductsModel> products =[];

  HomeModelData.fromJson(Map<String, dynamic> json){
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(ProductsModel.fromJson(element));
    });
  }
}

class BannersModel{
  late final int id;
  late final String image;

  BannersModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel{
  late final int id;
   dynamic price;
   dynamic old_price;
   dynamic discount;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late final bool in_favorites;
  late final bool in_cart;

  ProductsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}