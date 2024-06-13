import 'package:foydali_nuqtalar_task/core/base/use_case.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/get_books_result.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/remote/remote_data_source.dart';

class GetBooksContentResultUseCase implements BaseUseCase<GetBooksResult> {
  GetBooksContentResultUseCase({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final RemoteDataSource _remoteDataSource;

  @override
  Future<GetBooksResult> execute() => _remoteDataSource.getBookContent();
}
