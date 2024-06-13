part of 'home_bloc.dart';

sealed class HomeEvent {}

class OnHomeInitialEvent extends HomeEvent {
  OnHomeInitialEvent(this.initialModel);

  final HomeStyleModel initialModel;
}

class OnHomeRefreshEvent extends HomeEvent {}

class OnHomeStyleButtonChangedEvent extends HomeEvent {
  OnHomeStyleButtonChangedEvent({required this.index, required this.homeStyleModel});

  final int index;
  final HomeStyleModel homeStyleModel;
}

class OnHomeChangeTextSizeEvent extends HomeEvent {
  OnHomeChangeTextSizeEvent(this.size);

  final double size;
}

class OnHomeChangeFontFamilyEvent extends HomeEvent {
  OnHomeChangeFontFamilyEvent(this.font);

  final String? font;
}

class OnHomeChangeTextAlignEvent extends HomeEvent {}

class OnHomeSettingsButtonClickEvent extends HomeEvent {}
