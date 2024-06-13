part of 'guide_cubit.dart';

class GuideState extends Equatable {
  const GuideState({this.token});

  final String? token;

  @override
  List<Object?> get props => [token];
}
