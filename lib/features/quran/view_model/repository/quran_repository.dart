// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:insan_muslim/application/handle_errors/exeptions.dart';

import '../../../../application/handle_errors/failure.dart';
import '../../model/data_source/remote_data_source.dart';
import '../../model/model/qurah_model.dart';

abstract class QuranBaseRepository {
  Future<Either<Failure, List<AyahModel>>> getQuran(int pageNumber);
}

class QuranRepository implements QuranBaseRepository {
  final QuranRemoteDataSource _dataSource;
  // final NetworkInfo _networkInfo;
  QuranRepository(
    this._dataSource,
    //  this._networkInfo,
  );

  @override
  Future<Either<Failure, List<AyahModel>>> getQuran(int pageNumber) async {
    try {
      final data = await _dataSource.getQuran(pageNumber);
      return Right(data);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.errorMessage));
    }
  }
}
