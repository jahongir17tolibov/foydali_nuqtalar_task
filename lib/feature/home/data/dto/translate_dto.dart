import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/book_content_dto.dart';

class TranslateDto extends Equatable {
  const TranslateDto({required this.ru, required this.uz});

  final BookContentDto? ru;
  final BookContentDto? uz;

  Map<String, dynamic> toJson() => {'ru': ru, 'uz': uz};

  factory TranslateDto.fromJson(Map<String, dynamic> json) {
    return TranslateDto(
      ru: json['ru'] != null ? BookContentDto.fromJson(json['ru']) : null,
      uz: json['uz'] != null ? BookContentDto.fromJson(json['uz']) : null,
    );
  }

  @override
  List<Object?> get props => [ru, uz];
}
