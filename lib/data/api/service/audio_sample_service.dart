import 'package:dio/dio.dart';
import 'package:audio_quest/data/api/model/api_audio_sample.dart';
import 'package:audio_quest/data/api/model/api_quest.dart';
import 'package:audio_quest/data/api/request/get_audio_sample_body.dart';

class AudioSampleService {
  static const _BASE_URL = 'https://audio.cursor72.ru';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );
  
  Future<ApiQuest> getAudioQuest(GetAudioQuestBody body) async {
    final response = await _dio.get(
      '/media/test/quest.json',
      queryParameters: body.toApi(),
    );
    return ApiQuest.fromApi(response.data);
  }
}