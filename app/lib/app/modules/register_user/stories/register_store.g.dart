// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterStoreImpl, Store {
  Computed<bool>? _$isValidFieldsComputed;

  @override
  bool get isValidFields =>
      (_$isValidFieldsComputed ??= Computed<bool>(() => super.isValidFields,
              name: 'RegisterStoreImpl.isValidFields'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'RegisterStoreImpl.isPasswordValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'RegisterStoreImpl.isEmailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'RegisterStoreImpl.isFormValid'))
          .value;

  late final _$sucessRegisterAtom =
      Atom(name: 'RegisterStoreImpl.sucessRegister', context: context);

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

  late final _$firstNameUserAtom =
      Atom(name: 'RegisterStoreImpl.firstNameUser', context: context);

  @override
  String get firstNameUser {
    _$firstNameUserAtom.reportRead();
    return super.firstNameUser;
  }

  @override
  set firstNameUser(String value) {
    _$firstNameUserAtom.reportWrite(value, super.firstNameUser, () {
      super.firstNameUser = value;
    });
  }

  late final _$lastNameUserAtom =
      Atom(name: 'RegisterStoreImpl.lastNameUser', context: context);

  @override
  String get lastNameUser {
    _$lastNameUserAtom.reportRead();
    return super.lastNameUser;
  }

  @override
  set lastNameUser(String value) {
    _$lastNameUserAtom.reportWrite(value, super.lastNameUser, () {
      super.lastNameUser = value;
    });
  }

  late final _$nickAtom =
      Atom(name: 'RegisterStoreImpl.nick', context: context);

  @override
  String get nick {
    _$nickAtom.reportRead();
    return super.nick;
  }

  @override
  set nick(String value) {
    _$nickAtom.reportWrite(value, super.nick, () {
      super.nick = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'RegisterStoreImpl.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'RegisterStoreImpl.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordLookAtom =
      Atom(name: 'RegisterStoreImpl.passwordLook', context: context);

  @override
  bool get passwordLook {
    _$passwordLookAtom.reportRead();
    return super.passwordLook;
  }

  @override
  set passwordLook(bool value) {
    _$passwordLookAtom.reportWrite(value, super.passwordLook, () {
      super.passwordLook = value;
    });
  }

  late final _$RegisterStoreImplActionController =
      ActionController(name: 'RegisterStoreImpl', context: context);

  @override
  void setSucessRegister() {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setSucessRegister');
    try {
      return super.setSucessRegister();
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstNameUser(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setFirstNameUser');
    try {
      return super.setFirstNameUser(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastNameUser(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setLastNameUser');
    try {
      return super.setLastNameUser(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNick(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setNick');
    try {
      return super.setNick(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordLook() {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.togglePasswordLook');
    try {
      return super.togglePasswordLook();
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearValues() {
    final _$actionInfo = _$RegisterStoreImplActionController.startAction(
        name: 'RegisterStoreImpl.clearValues');
    try {
      return super.clearValues();
    } finally {
      _$RegisterStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sucessRegister: ${sucessRegister},
firstNameUser: ${firstNameUser},
lastNameUser: ${lastNameUser},
nick: ${nick},
email: ${email},
password: ${password},
passwordLook: ${passwordLook},
isValidFields: ${isValidFields},
isPasswordValid: ${isPasswordValid},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid}
    ''';
  }
}
