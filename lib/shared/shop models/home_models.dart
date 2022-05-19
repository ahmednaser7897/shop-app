class HomeData {
  bool ?status;
  ProudctData data=ProudctData();
  HomeData.fromJason(Map<String, dynamic> jason){
    status=jason['status'];
    data=ProudctData.fromJason(jason['data']);
  }
  HomeData(); 
}
class ProudctData {
  List<Banners> banners=[];
  List<Products> products=[];
  ProudctData();
  ProudctData.fromJason(Map<String, dynamic> jason){
    jason['banners'].forEach((element){
      Banners b=Banners.fromJason(element);
      banners.add(b);
    });
    jason['products'].forEach((element){
      Products p=Products.fromJason(element);
      products.add(p);
    });
  }
} 
class Banners {
  late int id;
  String image="";
  Banners.fromJason(Map<String, dynamic> jason){
    id=jason['id'];
    image=jason['image'];
  }
}
class Products {
   late int id;
   dynamic price;
   dynamic oldPrice;
   int ?discount;
   String image="";
   String name="";
   bool ?inFavorites;
   bool ?inCart;
  Products.fromJason(Map<String, dynamic> jason){
    id=jason['id'];
    price= jason['price'].toInt();
    oldPrice=jason['old_price'];
    discount=jason['discount'].toInt();
    name=jason['name'];
    image=jason['image'];
    inFavorites=jason['in_favorites'];
    //print('$id is ${jason['in_favorites'].toString()}');
    inCart=jason['in_cart'];
  }

}

