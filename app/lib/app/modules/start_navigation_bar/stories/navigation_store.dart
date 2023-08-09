import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreImpl with _$NavigationStore;

abstract class NavigationStoreImpl with Store{
  
  @observable
  int currentIndex = 0;

  @observable
  late PageController pageController;

   NavigationStoreImpl() {
    pageController = PageController();
  }

  @action
  void setPageController(PageController controller){
    pageController = controller;
  }

  @action
  void changeTab(int index){
    currentIndex = index;
  }
  
}