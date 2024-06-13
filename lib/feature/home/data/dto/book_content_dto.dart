import 'package:equatable/equatable.dart';

class BookContentDto extends Equatable {
  const BookContentDto({required this.title, required this.context});

  final String? title;
  final String? context;

  Map<String, dynamic> toJson() => {
        'title': title,
        'context': context,
      };

  factory BookContentDto.fromJson(Map<String, dynamic> json) => BookContentDto(
        title: json['title'] as String?,
        context: json['context'] as String?,
      );

  @override
  List<Object?> get props => [title, context];
}
