// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardProfileController on CardProfileControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'CardProfileControllerImpl.stateController', context: context);

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

  late final _$userAtom =
      Atom(name: 'CardProfileControllerImpl.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$hasTeamAtom =
      Atom(name: 'CardProfileControllerImpl.hasTeam', context: context);

  @override
  bool get hasTeam {
    _$hasTeamAtom.reportRead();
    return super.hasTeam;
  }

  @override
  set hasTeam(bool value) {
    _$hasTeamAtom.reportWrite(value, super.hasTeam, () {
      super.hasTeam = value;
    });
  }

  late final _$teamGameModelAtom =
      Atom(name: 'CardProfileControllerImpl.teamGameModel', context: context);

  @override
  TeamGameModel get teamGameModel {
    _$teamGameModelAtom.reportRead();
    return super.teamGameModel;
  }

  @override
  set teamGameModel(TeamGameModel value) {
    _$teamGameModelAtom.reportWrite(value, super.teamGameModel, () {
      super.teamGameModel = value;
    });
  }

  late final _$profileAsyncAction =
      AsyncAction('CardProfileControllerImpl.profile', context: context);

  @override
  Future<UserModel> profile(TokenManager tokenManager) {
    return _$profileAsyncAction.run(() => super.profile(tokenManager));
  }

  late final _$infoProfileUserAsyncAction = AsyncAction(
      'CardProfileControllerImpl.infoProfileUser',
      context: context);

  @override
  Future<TeamGameModel> infoProfileUser(TokenManager tokenManager) {
    return _$infoProfileUserAsyncAction
        .run(() => super.infoProfileUser(tokenManager));
  }

  late final _$initProfileAsyncAction =
      AsyncAction('CardProfileControllerImpl.initProfile', context: context);

  @override
  Future<void> initProfile(TokenManager tokenManager) {
    return _$initProfileAsyncAction.run(() => super.initProfile(tokenManager));
  }

  late final _$CardProfileControllerImplActionController =
      ActionController(name: 'CardProfileControllerImpl', context: context);

  @override
  void setTeamGameModel(dynamic value) {
    final _$actionInfo = _$CardProfileControllerImplActionController
        .startAction(name: 'CardProfileControllerImpl.setTeamGameModel');
    try {
      return super.setTeamGameModel(value);
    } finally {
      _$CardProfileControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  TeamGameModel getTeamGameModel() {
    final _$actionInfo = _$CardProfileControllerImplActionController
        .startAction(name: 'CardProfileControllerImpl.getTeamGameModel');
    try {
      return super.getTeamGameModel();
    } finally {
      _$CardProfileControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanField() {
    final _$actionInfo = _$CardProfileControllerImplActionController
        .startAction(name: 'CardProfileControllerImpl.cleanField');
    try {
      return super.cleanField();
    } finally {
      _$CardProfileControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
user: ${user},
hasTeam: ${hasTeam},
teamGameModel: ${teamGameModel}
    ''';
  }
}
