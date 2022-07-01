import 'package:higher_lower/app/data/base_response/base_api_response.dart';
import 'package:higher_lower/app/data/models/dummy_list_response.dart';

abstract class SampleRepository {
  Future<BaseApiResponse<DummyListResponse>> getDummyData();
}
