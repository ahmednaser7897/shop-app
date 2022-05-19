// ignore_for_file: file_names

class Categories {
  bool ?status;
  late CategoriesData data=CategoriesData();
  Categories.fromJason(Map<String, dynamic> jason){
    status=jason['status'];
    data=CategoriesData.fromJason(jason['data']);
  } 
  Categories();
}
class  CategoriesData{
   int ?currentPage;
  String ?firstPageUrl;
  int ?from;
  int ?lastPage;
   int ?perPage;
   String ?path;
   String ?nextPageUrl;
   String ?lastPageUrl;
   String ?prevPageUrl;
   int ?to ;
   int ?total;
  List <CategorieItemData> data=[];
  CategoriesData();
  CategoriesData.fromJason(Map<String, dynamic> jason){
    currentPage=jason['current_page'];
    from=jason['from'];
    firstPageUrl=jason['first_page_url'];
    lastPage=jason['last_page'];
    perPage=jason['per_page'];
    path=jason['path'];
    nextPageUrl=jason['next_page_url'];
    lastPageUrl=jason['last_page_url'];
    prevPageUrl=jason['prev_page_url'];
    to=jason['to'];
    total=jason['total'];
    currentPage=jason['current_page'];
    jason['data'].forEach((e){
      var c=CategorieItemData.fromJason(e);
      data.add(c);
    });

  }

}
class  CategorieItemData{
  late int id;
  late String name;
  late String image="";
  CategorieItemData.fromJason(Map<String, dynamic> jason){
    id= jason['id'];
    name= jason['name'];
    image= jason['image'];
  }
}
