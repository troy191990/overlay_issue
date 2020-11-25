import 'package:example/repository/homeOptions/home_options_repository.dart';

class HomeBloc {
  final HomeOptionRepository _repository = HomeOptionRepository();

  getHomeOptions() async {
    return await _repository.getHomeOptions();
  }
}

final homeBloc = HomeBloc();
