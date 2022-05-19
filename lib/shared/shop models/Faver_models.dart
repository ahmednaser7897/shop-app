// ignore_for_file: file_names

class FaveState {
  late bool status;
  late String message;
  
  FaveState.fromJason(Map<String, dynamic> jason){
    status=jason['status'];
    message=jason['message'];
  } 
}
class FaverData {
  late bool status;
  String? message;
  Data1 ?data1;

  FaverData({required this.status, this.message,required this.data1});

  FaverData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data1 = json['data'] != null ? Data1.fromJson(json['data']) : null;
  }
}

class Data1 {
   int ?currentPage;
   late List<Data2> data2;
   String ?firstPageUrl;
   int ?from;
   int ?lastPage;
   String ?lastPageUrl;
   String ?nextPageUrl;
   String ?path;
   int ?perPage;
   String ?prevPageUrl;
   int ?to;
   int ?total;

  Data1.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data2 =  [];//List<Data2>()
      json['data'].forEach((v) {
        data2.add( Data2.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Data2 {
  late int id;
  Product ?product;


  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ?  Product.fromJson(json['product']) : null;
  }

}

class Product {
  late int id;
  late int price;
  late int oldPrice;
  late int discount;
  late String ?image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price =  json['price'].toInt();
    oldPrice = json['old_price'].toInt();
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}