import 'package:audio_quest/data/api/api_util.dart';
import 'package:audio_quest/data/api/service/audio_sample_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(AudioSampleService());
    }
    return _apiUtil;
  }
}