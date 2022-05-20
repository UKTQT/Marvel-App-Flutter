import 'package:marvel/vb/network/network_manager.dart';
import 'package:mobx/mobx.dart';

part 'page_view_model.g.dart';

class PageViewModel = _PageViewModelBase with _$PageViewModel;

abstract class _PageViewModelBase with Store {
  @observable
  int number = 0;

  @action
  void incrementNumber() {
    number++;
  }

  void getDeneme() {
    //NetworkManager.instance.dioGet('ewq', model);
  }
}
