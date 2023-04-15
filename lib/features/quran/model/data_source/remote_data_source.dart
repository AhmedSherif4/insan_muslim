// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../application/constants.dart';
import '../../../../application/handle_errors/exeptions.dart';
import '../model/qurah_model.dart';

abstract class QuranRemoteDataSource {
  Future<List<AyahModel>> getQuran(int pageNumber);
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final http.Client client;
  QuranRemoteDataSourceImpl(
    this.client,
  );
  @override
  Future<List<AyahModel>> getQuran(int pageNumber) async {
    final Uri urlAsUri =
        Uri.parse('${Constants.baseUrl}/page/$pageNumber/quran-uthmani');

    try {
      final response = await client
          .get(urlAsUri, headers: {'Content-type': 'application/json'});
      Map<String, dynamic> jsonMap = json.decode(response.body);

      if (response.statusCode == 200) {
        final List<AyahModel> ayahs = List<AyahModel>.from(
          jsonMap['data']['ayahs'].map(
            (ayah) => AyahModel.fromJson(ayah),
          ),
        );

        return ayahs;
      } else {
        throw ServerException(
          errorCode: jsonMap['code'],
          errorMessage: jsonMap['status'],
        );
      }
    } on Exception catch (error) {
      throw ServerException(
        errorCode: 404,
        errorMessage: error.toString(),
      );
    }
  }
}
