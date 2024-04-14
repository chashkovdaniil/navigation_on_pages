import 'package:flutter/material.dart';
import 'package:skeleton_app/src/ui/dialog_page.dart';
import 'package:skeleton_app/src/ui/screens/loading_dialog.dart';

import '../domain/state_manager.dart';
import 'screens/account_screen.dart';
import 'screens/login_screen.dart';
import 'startup_screen.dart';

class PageManager extends InheritedWidget {
  final StateManager _stateManager;

  PageManager(
    this._stateManager, {
    super.key,
    required super.child,
  }) {
    _stateManager.noUser();
  }

  static PageManager of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageManager>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  List<Page> get pages {
    final pages = _stateManager.state.map((e) {
      switch (e) {
        case DomainState.startup:
          return const MaterialPage(
            child: StartupScreen(),
          );
        case DomainState.login:
          return const MaterialPage(
            child: LoginScreen(),
          );
        case DomainState.account:
          return const MaterialPage(
            child: AccountScreen(),
          );
        case DomainState.blockByLoading:
          return const DialogPage(
            LoadingDialog(),
          );
      }
    }).toList();

    return pages;
  }
}

class PagesRouterDelegate extends RouterDelegate
    with ChangeNotifier
    implements StateManager {
  final _state = [DomainState.startup];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: PageManager.of(context).pages,
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

  @override
  void hasUser() {
    _state.clear();
    _state.add(DomainState.account);

    notifyListeners();
  }

  @override
  void blockByLoading() {
    _state.add(DomainState.blockByLoading);

    notifyListeners();
  }

  @override
  void unblockByLoading() {
    _state.remove(DomainState.blockByLoading);

    notifyListeners();
  }

  @override
  void noUser() {
    _state.clear();
    _state.add(DomainState.login);

    notifyListeners();
  }

  @override
  List<DomainState> get state => _state;
}
