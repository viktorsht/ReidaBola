// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_virtual_register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TeamVirtualRegisterStore on TeamVirtualRegisterStoreImpl, Store {
  Computed<bool>? _$isValidFieldsComputed;

  @override
  bool get isValidFields =>
      (_$isValidFieldsComputed ??= Computed<bool>(() => super.isValidFields,
              name: 'TeamVirtualRegisterStoreImpl.isValidFields'))
          .value;
  Computed<bool>? _$isNameTeamValidComputed;

  @override
  bool get isNameTeamValid =>
      (_$isNameTeamValidComputed ??= Computed<bool>(() => super.isNameTeamValid,
              name: 'TeamVirtualRegisterStoreImpl.isNameTeamValid'))
          .value;
  Computed<bool>? _$isAbbreviationTeamComputed;

  @override
  bool get isAbbreviationTeam => (_$isAbbreviationTeamComputed ??=
          Computed<bool>(() => super.isAbbreviationTeam,
              name: 'TeamVirtualRegisterStoreImpl.isAbbreviationTeam'))
      .value;

  late final _$sucessRegisterAtom = Atom(
      name: 'TeamVirtualRegisterStoreImpl.sucessRegister', context: context);

  @override
  bool get sucessRegister {
    _$sucessRegisterAtom.reportRead();
    return super.sucessRegister;
  }

  @override
  set sucessRegister(bool value) {
    _$sucessRegisterAtom.reportWrite(value, super.sucessRegister, () {
      super.sucessRegister = value;
    });
  }

  late final _$nameTeamAtom =
      Atom(name: 'TeamVirtualRegisterStoreImpl.nameTeam', context: context);

  @override
  String get nameTeam {
    _$nameTeamAtom.reportRead();
    return super.nameTeam;
  }

  @override
  set nameTeam(String value) {
    _$nameTeamAtom.reportWrite(value, super.nameTeam, () {
      super.nameTeam = value;
    });
  }

  late final _$abbreviationTeamAtom = Atom(
      name: 'TeamVirtualRegisterStoreImpl.abbreviationTeam', context: context);

  @override
  String get abbreviationTeam {
    _$abbreviationTeamAtom.reportRead();
    return super.abbreviationTeam;
  }

  @override
  set abbreviationTeam(String value) {
    _$abbreviationTeamAtom.reportWrite(value, super.abbreviationTeam, () {
      super.abbreviationTeam = value;
    });
  }

  late final _$TeamVirtualRegisterStoreImplActionController =
      ActionController(name: 'TeamVirtualRegisterStoreImpl', context: context);

  @override
  void setSucessRegister() {
    final _$actionInfo = _$TeamVirtualRegisterStoreImplActionController
        .startAction(name: 'TeamVirtualRegisterStoreImpl.setSucessRegister');
    try {
      return super.setSucessRegister();
    } finally {
      _$TeamVirtualRegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameTeam(String value) {
    final _$actionInfo = _$TeamVirtualRegisterStoreImplActionController
        .startAction(name: 'TeamVirtualRegisterStoreImpl.setNameTeam');
    try {
      return super.setNameTeam(value);
    } finally {
      _$TeamVirtualRegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAbbreviationTeam(String value) {
    final _$actionInfo = _$TeamVirtualRegisterStoreImplActionController
        .startAction(name: 'TeamVirtualRegisterStoreImpl.setAbbreviationTeam');
    try {
      return super.setAbbreviationTeam(value);
    } finally {
      _$TeamVirtualRegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearValues() {
    final _$actionInfo = _$TeamVirtualRegisterStoreImplActionController
        .startAction(name: 'TeamVirtualRegisterStoreImpl.clearValues');
    try {
      return super.clearValues();
    } finally {
      _$TeamVirtualRegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sucessRegister: ${sucessRegister},
nameTeam: ${nameTeam},
abbreviationTeam: ${abbreviationTeam},
isValidFields: ${isValidFields},
isNameTeamValid: ${isNameTeamValid},
isAbbreviationTeam: ${isAbbreviationTeam}
    ''';
  }
}
