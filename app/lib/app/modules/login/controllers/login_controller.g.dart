// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerImpl, Store {
  Computed<bool>? _$isOkLoadingComputed;

  @override
  bool get isOkLoading =>
      (_$isOkLoadingComputed ??= Computed<bool>(() => super.isOkLoading,
              name: 'LoginControllerImpl.isOkLoading'))
          .value;

  late final _$stateControllerAtom =
      Atom(name: 'LoginControllerImpl.stateController', context: context);

  @override
  String get stateController {
    _$stateControllerAtom.reportRead();
    return super.stateController;
  }

  @override
  set stateController(String value) {
    _$stateControllerAtom.reportWrite(value, super.stateController, () {
      super.stateController = value;
    });
  }

  late final _$stateTeamControllerAtom =
      Atom(name: 'LoginControllerImpl.stateTeamController', context: context);

  @override
  String get stateTeamController {
    _$stateTeamControllerAtom.reportRead();
    return super.stateTeamController;
  }

  @override
  set stateTeamController(String value) {
    _$stateTeamControllerAtom.reportWrite(value, super.stateTeamController, () {
      super.stateTeamController = value;
    });
  }

  late final _$stateMeControllerAtom =
      Atom(name: 'LoginControllerImpl.stateMeController', context: context);

  @override
  String get stateMeController {
    _$stateMeControllerAtom.reportRead();
    return super.stateMeController;
  }

  @override
  set stateMeController(String value) {
    _$stateMeControllerAtom.reportWrite(value, super.stateMeController, () {
      super.stateMeController = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: 'LoginControllerImpl.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$idUserAtom =
      Atom(name: 'LoginControllerImpl.idUser', context: context);

  @override
  String get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  late final _$loginServiceAtom =
      Atom(name: 'LoginControllerImpl.loginService', context: context);

  @override
  LoginServices get loginService {
    _$loginServiceAtom.reportRead();
    return super.loginService;
  }

  @override
  set loginService(LoginServices value) {
    _$loginServiceAtom.reportWrite(value, super.loginService, () {
      super.loginService = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerImpl.login', context: context);

  @override
  Future<String> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$userIdMeAsyncAction =
      AsyncAction('LoginControllerImpl.userIdMe', context: context);

  @override
  Future<String> userIdMe(String token) {
    return _$userIdMeAsyncAction.run(() => super.userIdMe(token));
  }

  late final _$checkTeamVirtualAsyncAction =
      AsyncAction('LoginControllerImpl.checkTeamVirtual', context: context);

  @override
  Future<TeamGameModel> checkTeamVirtual(String token, String id) {
    return _$checkTeamVirtualAsyncAction
        .run(() => super.checkTeamVirtual(token, id));
  }

  late final _$LoginControllerImplActionController =
      ActionController(name: 'LoginControllerImpl', context: context);

  @override
  void setStateController(String value) {
    final _$actionInfo = _$LoginControllerImplActionController.startAction(
        name: 'LoginControllerImpl.setStateController');
    try {
      return super.setStateController(value);
    } finally {
      _$LoginControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
stateTeamController: ${stateTeamController},
stateMeController: ${stateMeController},
token: ${token},
idUser: ${idUser},
loginService: ${loginService},
isOkLoading: ${isOkLoading}
    ''';
  }
}
