import 'package:higher_lower/app/core/base_remote_source.dart';
import 'package:higher_lower/app/data/base_response/base_api_response.dart';
import 'package:higher_lower/app/data/models/dummy_list_response.dart';
import 'package:higher_lower/app/data/network/repository/sample_feature/sample_repository.dart';
import 'package:dio/dio.dart';

class SampleRepositoryImpl extends BaseRemoteSource
    implements SampleRepository {
  @override
  Future<BaseApiResponse<DummyListResponse>> getDummyData() async {
    var endpoint = "https://jsonkeeper.com/b/OGXT";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then(
        (response) => _parseBannerResponse(response),
      );
    } catch (e) {
      rethrow;
    }
  }

  BaseApiResponse<DummyListResponse> _parseBannerResponse(Response response) {
    return BaseApiResponse<DummyListResponse>.fromObjectJson(response.data,
        createObject: (data) => DummyListResponse.fromJson(data));
  }
}
