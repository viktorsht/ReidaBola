// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreController on MoreControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'MoreControllerImpl.stateController', context: context);

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

  late final _$numRodadasAtom =
      Atom(name: 'MoreControllerImpl.numRodadas', context: context);

  @override
  int get numRodadas {
    _$numRodadasAtom.reportRead();
    return super.numRodadas;
  }

  @override
  set numRodadas(int value) {
    _$numRodadasAtom.reportWrite(value, super.numRodadas, () {
      super.numRodadas = value;
    });
  }

  late final _$listSoccerMatchAtom =
      Atom(name: 'MoreControllerImpl.listSoccerMatch', context: context);

  @override
  List<SoccerMatchModel> get listSoccerMatch {
    _$listSoccerMatchAtom.reportRead();
    return super.listSoccerMatch;
  }

  @override
  set listSoccerMatch(List<SoccerMatchModel> value) {
    _$listSoccerMatchAtom.reportWrite(value, super.listSoccerMatch, () {
      super.listSoccerMatch = value;
    });
  }

  late final _$moreServicesAtom =
      Atom(name: 'MoreControllerImpl.moreServices', context: context);

  @override
  MoreServices get moreServices {
    _$moreServicesAtom.reportRead();
    return super.moreServices;
  }

  @override
  set moreServices(MoreServices value) {
    _$moreServicesAtom.reportWrite(value, super.moreServices, () {
      super.moreServices = value;
    });
  }

  late final _$tokenManagerAtom =
      Atom(name: 'MoreControllerImpl.tokenManager', context: context);

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

  late final _$listaRodadasAsyncAction =
      AsyncAction('MoreControllerImpl.listaRodadas', context: context);

  @override
  Future<List<SoccerMatchModel>> listaRodadas() {
    return _$listaRodadasAsyncAction.run(() => super.listaRodadas());
  }

  late final _$initMoreAsyncAction =
      AsyncAction('MoreControllerImpl.initMore', context: context);

  @override
  Future<void> initMore() {
    return _$initMoreAsyncAction.run(() => super.initMore());
  }

  late final _$MoreControllerImplActionController =
      ActionController(name: 'MoreControllerImpl', context: context);

  @override
  void setList(dynamic value) {
    final _$actionInfo = _$MoreControllerImplActionController.startAction(
        name: 'MoreControllerImpl.setList');
    try {
      return super.setList(value);
    } finally {
      _$MoreControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumRodadas() {
    final _$actionInfo = _$MoreControllerImplActionController.startAction(
        name: 'MoreControllerImpl.setNumRodadas');
    try {
      return super.setNumRodadas();
    } finally {
      _$MoreControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void countRound(List<SoccerMatchModel> list) {
    final _$actionInfo = _$MoreControllerImplActionController.startAction(
        name: 'MoreControllerImpl.countRound');
    try {
      return super.countRound(list);
    } finally {
      _$MoreControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
numRodadas: ${numRodadas},
listSoccerMatch: ${listSoccerMatch},
moreServices: ${moreServices},
tokenManager: ${tokenManager}
    ''';
  }
}
