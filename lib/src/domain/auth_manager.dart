import 'state_manager.dart';

class AuthManager {
  final StateManager _stateManager;

  AuthManager({required StateManager stateManager})
      : _stateManager = stateManager;

  Future<void> login() async {
    _stateManager.blockByLoading();

    /// Симулируем поход в сеть
    await Future.delayed(const Duration(
      seconds: 5,
    ));

    _stateManager.hasUser();
  }

  Future<void> logout() async {
    _stateManager.blockByLoading();

    // Тут должно быть удаление юзера

    _stateManager.noUser();
  }
}
