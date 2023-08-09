// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartController on StartControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'StartControllerImpl.stateController', context: context);

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
      Atom(name: 'StartControllerImpl.user', context: context);

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

  late final _$teamGameModelAtom =
      Atom(name: 'StartControllerImpl.teamGameModel', context: context);

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

  late final _$drawerUserAsyncAction =
      AsyncAction('StartControllerImpl.drawerUser', context: context);

  @override
  Future<UserModel> drawerUser() {
    return _$drawerUserAsyncAction.run(() => super.drawerUser());
  }

  late final _$cardProfileUserAsyncAction =
      AsyncAction('StartControllerImpl.cardProfileUser', context: context);

  @override
  Future<TeamGameModel> cardProfileUser() {
    return _$cardProfileUserAsyncAction.run(() => super.cardProfileUser());
  }

  late final _$initStartnavigationBarAsyncAction = AsyncAction(
      'StartControllerImpl.initStartnavigationBar',
      context: context);

  @override
  Future<void> initStartnavigationBar() {
    return _$initStartnavigationBarAsyncAction
        .run(() => super.initStartnavigationBar());
  }

  late final _$StartControllerImplActionController =
      ActionController(name: 'StartControllerImpl', context: context);

  @override
  void setStateController(String value) {
    final _$actionInfo = _$StartControllerImplActionController.startAction(
        name: 'StartControllerImpl.setStateController');
    try {
      return super.setStateController(value);
    } finally {
      _$StartControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
user: ${user},
teamGameModel: ${teamGameModel}
    ''';
  }
}
