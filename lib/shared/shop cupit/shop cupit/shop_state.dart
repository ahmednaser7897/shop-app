import 'package:shop_app/shared/shop%20models/logein_models.dart';
import 'package:shop_app/shared/shop%20models/search_models.dart';

class ShopState{}
class IntiShopState extends ShopState{}
class ChangeButtomBarIndex extends ShopState{}
class LodinHomePage extends ShopState{}
class ScHomePage extends ShopState{}
class ErorrHomePage extends ShopState{
  final String error;
  ErorrHomePage(this.error);
}
class LodinCategoriePage extends ShopState{}
class ScCategoriePage extends ShopState{}
class ErorrCategoriePage extends ShopState{
  final String error;
  ErorrCategoriePage(this.error);
}
class LodinChangeFavePage extends ShopState{}
class ScChangeFavePage extends ShopState{
  final bool state;
  final String masseg;

  ScChangeFavePage(this.masseg, this.state);
}
class ErorrChangeFavePage extends ShopState{
  final String error;
  ErorrChangeFavePage(this.error);
}

class LodinFavePage extends ShopState{}
class ScFavePage extends ShopState{}
class ErorrFavePage extends ShopState{
  final String error;
  ErorrFavePage(this.error);
}
class LodinProfilePage extends ShopState{}
class ScprofilePage extends ShopState{
  final ShopLoginModel loginModel;

  ScprofilePage(this.loginModel);
}
class ErorrprofilePage extends ShopState{
  final String error;
  ErorrprofilePage(this.error);
}
class LodinUpdateProfilePage extends ShopState{}
class ScUpdateProfilePage extends ShopState{
  final ShopLoginModel loginModel;

  ScUpdateProfilePage(this.loginModel);
}
class ErorrUpdateProfilePage extends ShopState{
  final String error;
  ErorrUpdateProfilePage(this.error);
}

class LodinSearchePage extends ShopState{}
class ScSearchePage extends ShopState{
  final SearchData searchedData;

  ScSearchePage(this.searchedData);
}
class ErorrSearchePage extends ShopState{
  final String error;
  ErorrSearchePage(this.error);
}

class OutSearchePage extends ShopState{}