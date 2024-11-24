import 'package:test_task_balina_soft/src/core/constans.dart';
import 'package:test_task_balina_soft/src/core/data_store.dart';
import 'package:test_task_balina_soft/src/features/main_screen/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final baseDataStore = BaseDataStore();
  @override
  String getUserData() {
    return baseDataStore.getString(ConstantsShared.userLogin);
  }
}