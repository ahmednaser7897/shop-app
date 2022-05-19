class ShopLoginModel{
  late bool status;
  late String ?message;
  UserData ?data;
  ShopLoginModel.fromJason(Map<String, dynamic> jason){
    status=jason['status'];
    message=jason['message'];
    data=(jason['data']!=null)?UserData.fromJason(jason['data']):null;
  }
}
class UserData{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String ?image;
  int ?points;
  int ?credit;
  late String token;

  UserData.fromJason(Map<String, dynamic> jason){
    id=jason['id'];
    name=jason['name'];
    email=jason['email'];
    phone=jason['phone'];
    image=jason['image'];
    points=jason['points'];
    credit=jason['credit'];
    token=jason['token'];
  }
}
