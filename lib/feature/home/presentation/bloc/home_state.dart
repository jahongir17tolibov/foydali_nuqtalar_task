part of 'home_bloc.dart';

enum HomeStatus { pure, onLoading, onSuccess }

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.contentBooks,
    this.changedStyle,
    this.checkedStyleIndex = 0,
    this.currentLocale,
    this.isLoading = false,
    this.userIsAuthenticated = false,
    this.settingsOpened = false,
    this.homeTextSize = 18,
    this.homeFontFamily = AppConstants.appFontFamily,
    this.homeTextAlign = true,
  });

  final HomeStatus status;
  final List<BooksDto>? contentBooks;
  final HomeStyleModel? changedStyle;
  final int checkedStyleIndex;
  final String? currentLocale;
  final bool isLoading;
  final bool userIsAuthenticated;
  final bool settingsOpened;
  final double homeTextSize;
  final String homeFontFamily;
  final bool homeTextAlign;

  HomeState copyWith({
    HomeStatus? status,
    List<BooksDto>? contentBooks,
    HomeStyleModel? changedStyle,
    int? checkedStyleIndex,
    String? currentLocale,
    bool? isLoading,
    bool? userIsAuthenticated,
    bool? settingsOpened,
    double? homeTextSize,
    String? homeFontFamily,
    bool? homeTextAlign,
  }) =>
      HomeState(
        status: status ?? this.status,
        contentBooks: contentBooks ?? this.contentBooks,
        changedStyle: changedStyle ?? this.changedStyle,
        checkedStyleIndex: checkedStyleIndex ?? this.checkedStyleIndex,
        currentLocale: currentLocale ?? this.currentLocale,
        isLoading: isLoading ?? this.isLoading,
        userIsAuthenticated: userIsAuthenticated ?? this.userIsAuthenticated,
        settingsOpened: settingsOpened ?? this.settingsOpened,
        homeTextSize: homeTextSize ?? this.homeTextSize,
        homeFontFamily: homeFontFamily ?? this.homeFontFamily,
        homeTextAlign: homeTextAlign ?? this.homeTextAlign,
      );

  @override
  List<Object?> get props => [
        status,
        contentBooks,
        changedStyle,
        checkedStyleIndex,
        currentLocale,
        isLoading,
        userIsAuthenticated,
        settingsOpened,
        homeTextSize,
        homeFontFamily,
        homeTextAlign,
      ];
}
