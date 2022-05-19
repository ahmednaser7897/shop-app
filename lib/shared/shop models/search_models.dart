class SearchData {
  late bool status;
  String? message;
  Data1 data1= Data1();
  SearchData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data1 =   Data1.fromJson(json['data']) ;
  }
   SearchData();
}

class Data1 {
  List<Product> data2=[];
  Data1.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data2 =  [];//List<Data2>()
      json['data'].forEach((v) {
        data2.add( Product.fromJson(v));
      });
    }
  }
  Data1();
}

class Product {
  late int id;
  late int price;
  late int ?oldPrice;
  late int ?discount;
  late String image="";
  late String name="";
  late String ?description;

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price =  json['price'].toInt();
    oldPrice =(json['old_price']!=null)? json['old_price'].toInt():null;
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}