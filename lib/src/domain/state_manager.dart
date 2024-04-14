enum DomainState { startup, login, account, blockByLoading }

abstract class StateManager {
  List<DomainState> get state;

  void hasUser() {}

  void blockByLoading() {}

  void unblockByLoading() {}

  void noUser() {}
}
