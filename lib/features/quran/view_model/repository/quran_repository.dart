// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:insan_muslim/application/handle_errors/exeptions.dart';

import '../../../../application/handle_errors/failure.dart';
import '../../../../manager/network/network_info.dart';
import '../../../../manager/string_manager.dart';
import '../../model/data_source/remote_data_source.dart';
import '../../model/model/qurah_model.dart';

abstract class QuranBaseRepository {
  Future<Either<Failure, List<AyahModel>>> getQuran(int pageNumber);
}

class QuranRepository implements QuranBaseRepository {
  final QuranRemoteDataSource _dataSource;
  final NetworkInfo _networkInfo;
  QuranRepository(
    this._dataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<AyahModel>>> getQuran(int pageNumber) async {
    final data = await _dataSource.getQuran(pageNumber);

    try {
      if (!await _networkInfo.isConnected) {
        return  Left(ServerFailure(message: AppStrings.noInternetConnection.tr()));
      } else {
        return Right(data);
      }
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.errorMessage));
    }
  }
}
