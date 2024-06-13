part of 'change_lang_cubit.dart';

class ChangeLangState extends Equatable {
  const ChangeLangState({this.selectedLang});

  final String? selectedLang;

  @override
  List<Object?> get props => [selectedLang];
}
