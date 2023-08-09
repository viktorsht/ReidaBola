import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreImpl with _$LoginStore;

abstract class LoginStoreImpl with Store{

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;
  
  @observable
  String password = "";

  @observable
  bool passwordLook = false;

  @action
  void togglePasswordLook() => passwordLook = !passwordLook;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isEmailValid => RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

}