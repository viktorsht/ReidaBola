// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeamController on TeamControllerImpl, Store {
  late final _$stateControllerAtom =
      Atom(name: 'TeamControllerImpl.stateController', context: context);

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

  late final _$matchGameLineUpListAtom =
      Atom(name: 'TeamControllerImpl.matchGameLineUpList', context: context);

  @override
  List<MatchGameLineUpModel> get matchGameLineUpList {
    _$matchGameLineUpListAtom.reportRead();
    return super.matchGameLineUpList;
  }

  @override
  set matchGameLineUpList(List<MatchGameLineUpModel> value) {
    _$matchGameLineUpListAtom.reportWrite(value, super.matchGameLineUpList, () {
      super.matchGameLineUpList = value;
    });
  }

  late final _$teamServiceAtom =
      Atom(name: 'TeamControllerImpl.teamService', context: context);

  @override
  TeamServices get teamService {
    _$teamServiceAtom.reportRead();
    return super.teamService;
  }

  @override
  set teamService(TeamServices value) {
    _$teamServiceAtom.reportWrite(value, super.teamService, () {
      super.teamService = value;
    });
  }

  late final _$checkTeamScaleAsyncAction =
      AsyncAction('TeamControllerImpl.checkTeamScale', context: context);

  @override
  Future<List<MatchGameLineUpModel>> checkTeamScale() {
    return _$checkTeamScaleAsyncAction.run(() => super.checkTeamScale());
  }

  late final _$initTeamScaleAsyncAction =
      AsyncAction('TeamControllerImpl.initTeamScale', context: context);

  @override
  Future<void> initTeamScale() {
    return _$initTeamScaleAsyncAction.run(() => super.initTeamScale());
  }

  @override
  String toString() {
    return '''
stateController: ${stateController},
matchGameLineUpList: ${matchGameLineUpList},
teamService: ${teamService}
    ''';
  }
}
