// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreImpl, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'LoginStoreImpl.isPasswordValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: 'LoginStoreImpl.isEmailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'LoginStoreImpl.isFormValid'))
          .value;

  late final _$emailAtom = Atom(name: 'LoginStoreImpl.email', context: context);

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
      Atom(name: 'LoginStoreImpl.password', context: context);

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
      Atom(name: 'LoginStoreImpl.passwordLook', context: context);

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

  late final _$LoginStoreImplActionController =
      ActionController(name: 'LoginStoreImpl', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$LoginStoreImplActionController.startAction(
        name: 'LoginStoreImpl.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$LoginStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordLook() {
    final _$actionInfo = _$LoginStoreImplActionController.startAction(
        name: 'LoginStoreImpl.togglePasswordLook');
    try {
      return super.togglePasswordLook();
    } finally {
      _$LoginStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginStoreImplActionController.startAction(
        name: 'LoginStoreImpl.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordLook: ${passwordLook},
isPasswordValid: ${isPasswordValid},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid}
    ''';
  }
}
