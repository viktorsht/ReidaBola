// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion_ship_edition_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChampionShipEditionController
    on ChampionShipEditionControllerImpl, Store {
  late final _$stateControllerAtom = Atom(
      name: 'ChampionShipEditionControllerImpl.stateController',
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

  late final _$championShipAtom = Atom(
      name: 'ChampionShipEditionControllerImpl.championShip', context: context);

  @override
  List<ChampionShipEditionModel> get championShip {
    _$championShipAtom.reportRead();
    return super.championShip;
  }

  @override
  set championShip(List<ChampionShipEditionModel> value) {
    _$championShipAtom.reportWrite(value, super.championShip, () {
      super.championShip = value;
    });
  }

  late final _$getListChampionShipAsyncAction = AsyncAction(
      'ChampionShipEditionControllerImpl.getListChampionShip',
      context: context);

  @override
  Future<List<ChampionShipEditionModel>> getListChampionShip() {
    return _$getListChampionShipAsyncAction
        .run(() => super.getListChampionShip());
  }

  late final _$postTeamGameEditionAsyncAction = AsyncAction(
      'ChampionShipEditionControllerImpl.postTeamGameEdition',
      context: context);

  @override
  Future<TeamGameEditionSucessModel> postTeamGameEdition(
      int teamGameId, int championshipEditionId) {
    return _$postTeamGameEditionAsyncAction.run(
        () => super.postTeamGameEdition(teamGameId, championshipEditionId));
  }

  late final _$initListChampionShitAsyncAction = AsyncAction(
      'ChampionShipEditionControllerImpl.initListChampionShit',
      context: context);

  @override
  Future<void> initListChampionShit() {
    return _$initListChampionShitAsyncAction
        .run(() => super.initListChampionShit());
  }

  late final _$ChampionShipEditionControllerImplActionController =
      ActionController(
          name: 'ChampionShipEditionControllerImpl', context: context);

  @override
  void setListChampionShip(dynamic value) {
    final _$actionInfo =
        _$ChampionShipEditionControllerImplActionController.startAction(
            name: 'ChampionShipEditionControllerImpl.setListChampionShip');
    try {
      return super.setListChampionShip(value);
    } finally {
      _$ChampionShipEditionControllerImplActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
championShip: ${championShip}
    ''';
  }
}
