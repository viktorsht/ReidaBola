// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_stories.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeamStoriesController on TeamStoriesControllerImpl, Store {
  late final _$idPlayerListAtom =
      Atom(name: 'TeamStoriesControllerImpl.idPlayerList', context: context);

  @override
  List<int> get idPlayerList {
    _$idPlayerListAtom.reportRead();
    return super.idPlayerList;
  }

  @override
  set idPlayerList(List<int> value) {
    _$idPlayerListAtom.reportWrite(value, super.idPlayerList, () {
      super.idPlayerList = value;
    });
  }

  late final _$TeamStoriesControllerImplActionController =
      ActionController(name: 'TeamStoriesControllerImpl', context: context);

  @override
  bool searchPlayer(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.searchPlayer');
    try {
      return super.searchPlayer(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String playerGol(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.playerGol');
    try {
      return super.playerGol(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String playerTec(List<PlayerEditionModel> list) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.playerTec');
    try {
      return super.playerTec(list);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player1(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.player1');
    try {
      return super.player1(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player2(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.player2');
    try {
      return super.player2(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String player3(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.player3');
    try {
      return super.player3(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? playerName(List<PlayerEditionModel> list, String position) {
    final _$actionInfo = _$TeamStoriesControllerImplActionController
        .startAction(name: 'TeamStoriesControllerImpl.playerName');
    try {
      return super.playerName(list, position);
    } finally {
      _$TeamStoriesControllerImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idPlayerList: ${idPlayerList}
    ''';
  }
}
