// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_today_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RoundTodayController on RoundTodayControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'RoundTodayControllerImpl.stateController', context: context);

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

  late final _$tokenAtom =
      Atom(name: 'RoundTodayControllerImpl.token', context: context);

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

  late final _$roundAtom =
      Atom(name: 'RoundTodayControllerImpl.round', context: context);

  @override
  SoccerMatchModel get round {
    _$roundAtom.reportRead();
    return super.round;
  }

  @override
  set round(SoccerMatchModel value) {
    _$roundAtom.reportWrite(value, super.round, () {
      super.round = value;
    });
  }

  late final _$roundTodayServicesAtom = Atom(
      name: 'RoundTodayControllerImpl.roundTodayServices', context: context);

  @override
  RoundTodayServices get roundTodayServices {
    _$roundTodayServicesAtom.reportRead();
    return super.roundTodayServices;
  }

  @override
  set roundTodayServices(RoundTodayServices value) {
    _$roundTodayServicesAtom.reportWrite(value, super.roundTodayServices, () {
      super.roundTodayServices = value;
    });
  }

  late final _$roundTodayAsyncAction =
      AsyncAction('RoundTodayControllerImpl.roundToday', context: context);

  @override
  Future<SoccerMatchModel> roundToday(String token, String today) {
    return _$roundTodayAsyncAction.run(() => super.roundToday(token, today));
  }

  late final _$initRoundTodayAsyncAction =
      AsyncAction('RoundTodayControllerImpl.initRoundToday', context: context);

  @override
  Future<void> initRoundToday() {
    return _$initRoundTodayAsyncAction.run(() => super.initRoundToday());
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
token: ${token},
round: ${round},
roundTodayServices: ${roundTodayServices}
    ''';
  }
}
