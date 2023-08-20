// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LineUpController on LineUpControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'LineUpControllerImpl.stateController', context: context);

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

  late final _$tokenManagerAtom =
      Atom(name: 'LineUpControllerImpl.tokenManager', context: context);

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

  late final _$lineUpServicesAtom =
      Atom(name: 'LineUpControllerImpl.lineUpServices', context: context);

  @override
  LineUpServices get lineUpServices {
    _$lineUpServicesAtom.reportRead();
    return super.lineUpServices;
  }

  @override
  set lineUpServices(LineUpServices value) {
    _$lineUpServicesAtom.reportWrite(value, super.lineUpServices, () {
      super.lineUpServices = value;
    });
  }

  late final _$listLineUpAtom =
      Atom(name: 'LineUpControllerImpl.listLineUp', context: context);

  @override
  List<PlayerLineUpModel> get listLineUp {
    _$listLineUpAtom.reportRead();
    return super.listLineUp;
  }

  @override
  set listLineUp(List<PlayerLineUpModel> value) {
    _$listLineUpAtom.reportWrite(value, super.listLineUp, () {
      super.listLineUp = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'LineUpControllerImpl.image', context: context);

  @override
  List<String> get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(List<String> value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$previousNumberAtom =
      Atom(name: 'LineUpControllerImpl.previousNumber', context: context);

  @override
  int get previousNumber {
    _$previousNumberAtom.reportRead();
    return super.previousNumber;
  }

  @override
  set previousNumber(int value) {
    _$previousNumberAtom.reportWrite(value, super.previousNumber, () {
      super.previousNumber = value;
    });
  }

  late final _$roundAtom =
      Atom(name: 'LineUpControllerImpl.round', context: context);

  @override
  int get round {
    _$roundAtom.reportRead();
    return super.round;
  }

  @override
  set round(int value) {
    _$roundAtom.reportWrite(value, super.round, () {
      super.round = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'LineUpControllerImpl.status', context: context);

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$playersForPositionAsyncAction =
      AsyncAction('LineUpControllerImpl.playersForPosition', context: context);

  @override
  Future<List<PlayerLineUpModel>> playersForPosition(
      String position, String round, String edition) {
    return _$playersForPositionAsyncAction
        .run(() => super.playersForPosition(position, round, edition));
  }

  late final _$addListPlayerApiAsyncAction =
      AsyncAction('LineUpControllerImpl.addListPlayerApi', context: context);

  @override
  Future<void> addListPlayerApi(
      List<int> listId, int round, int team, int status) {
    return _$addListPlayerApiAsyncAction
        .run(() => super.addListPlayerApi(listId, round, team, status));
  }

  late final _$initBuyAsyncAction =
      AsyncAction('LineUpControllerImpl.initBuy', context: context);

  @override
  Future<void> initBuy(String position, int round, int edition1) {
    return _$initBuyAsyncAction
        .run(() => super.initBuy(position, round, edition1));
  }

  late final _$LineUpControllerImplActionController =
      ActionController(name: 'LineUpControllerImpl', context: context);

  @override
  int generateNumber() {
    final _$actionInfo = _$LineUpControllerImplActionController.startAction(
        name: 'LineUpControllerImpl.generateNumber');
    try {
      return super.generateNumber();
    } finally {
      _$LineUpControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setList(dynamic value) {
    final _$actionInfo = _$LineUpControllerImplActionController.startAction(
        name: 'LineUpControllerImpl.setList');
    try {
      return super.setList(value);
    } finally {
      _$LineUpControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRound(dynamic value) {
    final _$actionInfo = _$LineUpControllerImplActionController.startAction(
        name: 'LineUpControllerImpl.setRound');
    try {
      return super.setRound(value);
    } finally {
      _$LineUpControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(dynamic value) {
    final _$actionInfo = _$LineUpControllerImplActionController.startAction(
        name: 'LineUpControllerImpl.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$LineUpControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getStatus() {
    final _$actionInfo = _$LineUpControllerImplActionController.startAction(
        name: 'LineUpControllerImpl.getStatus');
    try {
      return super.getStatus();
    } finally {
      _$LineUpControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
tokenManager: ${tokenManager},
lineUpServices: ${lineUpServices},
listLineUp: ${listLineUp},
image: ${image},
previousNumber: ${previousNumber},
round: ${round},
status: ${status}
    ''';
  }
}
