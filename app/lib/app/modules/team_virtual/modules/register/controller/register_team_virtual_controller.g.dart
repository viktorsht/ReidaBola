// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_team_virtual_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterTeamVirtualController
    on RegisterTeamVirtualControllerImpl, Store {
  late final _$stateControllerAtom = Atom(
      name: 'RegisterTeamVirtualControllerImpl.stateController',
      context: context);

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

  late final _$hasNameAtom =
      Atom(name: 'RegisterTeamVirtualControllerImpl.hasName', context: context);

  @override
  bool get hasName {
    _$hasNameAtom.reportRead();
    return super.hasName;
  }

  @override
  set hasName(bool value) {
    _$hasNameAtom.reportWrite(value, super.hasName, () {
      super.hasName = value;
    });
  }

  late final _$hasAbbAtom =
      Atom(name: 'RegisterTeamVirtualControllerImpl.hasAbb', context: context);

  @override
  bool get hasAbb {
    _$hasAbbAtom.reportRead();
    return super.hasAbb;
  }

  @override
  set hasAbb(bool value) {
    _$hasAbbAtom.reportWrite(value, super.hasAbb, () {
      super.hasAbb = value;
    });
  }

  late final _$hasUserIdAtom = Atom(
      name: 'RegisterTeamVirtualControllerImpl.hasUserId', context: context);

  @override
  bool get hasUserId {
    _$hasUserIdAtom.reportRead();
    return super.hasUserId;
  }

  @override
  set hasUserId(bool value) {
    _$hasUserIdAtom.reportWrite(value, super.hasUserId, () {
      super.hasUserId = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'RegisterTeamVirtualControllerImpl.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$registerServiceAtom = Atom(
      name: 'RegisterTeamVirtualControllerImpl.registerService',
      context: context);

  @override
  RegisterTeamVirtualServices get registerService {
    _$registerServiceAtom.reportRead();
    return super.registerService;
  }

  @override
  set registerService(RegisterTeamVirtualServices value) {
    _$registerServiceAtom.reportWrite(value, super.registerService, () {
      super.registerService = value;
    });
  }

  late final _$tokenManagerAtom = Atom(
      name: 'RegisterTeamVirtualControllerImpl.tokenManager', context: context);

  @override
  TokenManager get tokenManager {
    _$tokenManagerAtom.reportRead();
    return super.tokenManager;
  }

  @override
  set tokenManager(TokenManager value) {
    _$tokenManagerAtom.reportWrite(value, super.tokenManager, () {
      super.tokenManager = value;
    });
  }

  late final _$registerTeamVirtualAsyncAction = AsyncAction(
      'RegisterTeamVirtualControllerImpl.registerTeamVirtual',
      context: context);

  @override
  Future<RegisterTeamVirtualSucessModel> registerTeamVirtual(
      String name, String abb, int userId) {
    return _$registerTeamVirtualAsyncAction
        .run(() => super.registerTeamVirtual(name, abb, userId));
  }

  late final _$RegisterTeamVirtualControllerImplActionController =
      ActionController(
          name: 'RegisterTeamVirtualControllerImpl', context: context);

  @override
  void setStateController(String value) {
    final _$actionInfo =
        _$RegisterTeamVirtualControllerImplActionController.startAction(
            name: 'RegisterTeamVirtualControllerImpl.setStateController');
    try {
      return super.setStateController(value);
    } finally {
      _$RegisterTeamVirtualControllerImplActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void contarElementosNoJSON(dynamic exception) {
    final _$actionInfo =
        _$RegisterTeamVirtualControllerImplActionController.startAction(
            name: 'RegisterTeamVirtualControllerImpl.contarElementosNoJSON');
    try {
      return super.contarElementosNoJSON(exception);
    } finally {
      _$RegisterTeamVirtualControllerImplActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
hasName: ${hasName},
hasAbb: ${hasAbb},
hasUserId: ${hasUserId},
userId: ${userId},
registerService: ${registerService},
tokenManager: ${tokenManager}
    ''';
  }
}
