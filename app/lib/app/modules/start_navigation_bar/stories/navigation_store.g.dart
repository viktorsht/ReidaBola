// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on NavigationStoreImpl, Store {
  late final _$currentIndexAtom =
      Atom(name: 'NavigationStoreImpl.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: 'NavigationStoreImpl.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$NavigationStoreImplActionController =
      ActionController(name: 'NavigationStoreImpl', context: context);

  @override
  void setPageController(PageController controller) {
    final _$actionInfo = _$NavigationStoreImplActionController.startAction(
        name: 'NavigationStoreImpl.setPageController');
    try {
      return super.setPageController(controller);
    } finally {
      _$NavigationStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTab(int index) {
    final _$actionInfo = _$NavigationStoreImplActionController.startAction(
        name: 'NavigationStoreImpl.changeTab');
    try {
      return super.changeTab(index);
    } finally {
      _$NavigationStoreImplActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
pageController: ${pageController}
    ''';
  }
}
