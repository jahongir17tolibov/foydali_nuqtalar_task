import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/books_dto.dart';

class GetBooksResult extends Equatable {
  const GetBooksResult({this.count, this.results});

  final num? count;
  final List<BooksDto>? results;

  factory GetBooksResult.fromJson(Map<String, dynamic> json) {
    return GetBooksResult(
      count: json['count'] ?? 0,
      results: (json['results'] as List?)?.map((e) => BooksDto.fromJson(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [count, results];
}
