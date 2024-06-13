import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/translate_dto.dart';

class BooksDto extends Equatable {
  const BooksDto({required this.translate, required this.order, required this.isFree});

  final TranslateDto? translate;
  final num order;
  final bool isFree;

  Map<String, dynamic> toJson() => {
        'translate': translate,
        'order': order,
        'is_free': isFree,
      };

  factory BooksDto.fromJson(Map<String, dynamic> json) {
    return BooksDto(
      translate: json['translate'] != null ? TranslateDto.fromJson(json['translate']) : null,
      order: json['order'] ?? 0,
      isFree: json['is_free'] ?? false,
    );
  }

  @override
  List<Object?> get props => [translate, order, isFree];
}
