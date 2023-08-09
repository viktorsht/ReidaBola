// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuyController on BuyControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'BuyControllerImpl.stateController', context: context);

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
      Atom(name: 'BuyControllerImpl.tokenManager', context: context);

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

  late final _$buyServicesAtom =
      Atom(name: 'BuyControllerImpl.buyServices', context: context);

  @override
  BuyServices get buyServices {
    _$buyServicesAtom.reportRead();
    return super.buyServices;
  }

  @override
  set buyServices(BuyServices value) {
    _$buyServicesAtom.reportWrite(value, super.buyServices, () {
      super.buyServices = value;
    });
  }

  late final _$listBuyAtom =
      Atom(name: 'BuyControllerImpl.listBuy', context: context);

  @override
  List<PlayerEditionModel> get listBuy {
    _$listBuyAtom.reportRead();
    return super.listBuy;
  }

  @override
  set listBuy(List<PlayerEditionModel> value) {
    _$listBuyAtom.reportWrite(value, super.listBuy, () {
      super.listBuy = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'BuyControllerImpl.image', context: context);

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
      Atom(name: 'BuyControllerImpl.previousNumber', context: context);

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

  late final _$playersForPositionAsyncAction =
      AsyncAction('BuyControllerImpl.playersForPosition', context: context);

  @override
  Future<List<PlayerEditionModel>> playersForPosition(String position) {
    return _$playersForPositionAsyncAction
        .run(() => super.playersForPosition(position));
  }

  late final _$initBuyAsyncAction =
      AsyncAction('BuyControllerImpl.initBuy', context: context);

  @override
  Future<void> initBuy(String position) {
    return _$initBuyAsyncAction.run(() => super.initBuy(position));
  }

  late final _$BuyControllerImplActionController =
      ActionController(name: 'BuyControllerImpl', context: context);

  @override
  int generateNumber() {
    final _$actionInfo = _$BuyControllerImplActionController.startAction(
        name: 'BuyControllerImpl.generateNumber');
    try {
      return super.generateNumber();
    } finally {
      _$BuyControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setList(dynamic value) {
    final _$actionInfo = _$BuyControllerImplActionController.startAction(
        name: 'BuyControllerImpl.setList');
    try {
      return super.setList(value);
    } finally {
      _$BuyControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
tokenManager: ${tokenManager},
buyServices: ${buyServices},
listBuy: ${listBuy},
image: ${image},
previousNumber: ${previousNumber}
    ''';
  }
}
