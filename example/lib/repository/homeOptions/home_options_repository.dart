import 'package:example/model/homeOption/home_option_full_response.dart';
import 'package:example/repository/homeOptions/home_options_api_provider.dart';

class HomeOptionRepository {
  HomeOptionsApiProvider _apiProvider = HomeOptionsApiProvider();

  Future<HomeOptionFull> getHomeOptions() async {
    return await _apiProvider.getHomeOptions();
  }
}
