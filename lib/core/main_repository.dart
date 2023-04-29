import 'package:get_it/get_it.dart';

import '../services/navigation_service.dart';
import '../utils/name_routes.dart';

class MainRepository {
  MainRepository() {
    _init();
  }
}

_init() async {
//for any logic if there's login
  GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.homePage);
}
