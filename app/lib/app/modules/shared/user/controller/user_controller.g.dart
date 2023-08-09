// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'UserControllerImpl.stateController', context: context);

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
      Atom(name: 'UserControllerImpl.stateTeamController', context: context);

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
      Atom(name: 'UserControllerImpl.stateMeController', context: context);

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
      Atom(name: 'UserControllerImpl.token', context: context);

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
      Atom(name: 'UserControllerImpl.idUser', context: context);

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

  late final _$userServiceAtom =
      Atom(name: 'UserControllerImpl.userService', context: context);

  @override
  UserServices get userService {
    _$userServiceAtom.reportRead();
    return super.userService;
  }

  @override
  set userService(UserServices value) {
    _$userServiceAtom.reportWrite(value, super.userService, () {
      super.userService = value;
    });
  }

  late final _$teamAtom =
      Atom(name: 'UserControllerImpl.team', context: context);

  @override
  TeamGameModel get team {
    _$teamAtom.reportRead();
    return super.team;
  }

  @override
  set team(TeamGameModel value) {
    _$teamAtom.reportWrite(value, super.team, () {
      super.team = value;
    });
  }

  late final _$userIdMeAsyncAction =
      AsyncAction('UserControllerImpl.userIdMe', context: context);

  @override
  Future<String> userIdMe(String token) {
    return _$userIdMeAsyncAction.run(() => super.userIdMe(token));
  }

  late final _$checkTeamVirtualAsyncAction =
      AsyncAction('UserControllerImpl.checkTeamVirtual', context: context);

  @override
  Future<TeamGameModel> checkTeamVirtual(String token, String id) {
    return _$checkTeamVirtualAsyncAction
        .run(() => super.checkTeamVirtual(token, id));
  }

  late final _$initUserInfomationsAsyncAction =
      AsyncAction('UserControllerImpl.initUserInfomations', context: context);

  @override
  Future<void> initUserInfomations() {
    return _$initUserInfomationsAsyncAction
        .run(() => super.initUserInfomations());
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
stateTeamController: ${stateTeamController},
stateMeController: ${stateMeController},
token: ${token},
idUser: ${idUser},
userService: ${userService},
team: ${team}
    ''';
  }
}
