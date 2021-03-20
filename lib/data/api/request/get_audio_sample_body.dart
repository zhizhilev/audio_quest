import 'package:meta/meta.dart';

class GetAudioSampleBody {
  final String api_key;

  GetAudioSampleBody({
    @required this.api_key,
  });

  Map<String, dynamic> toApi() {
    return {
      'api_key': api_key
    };
  }
}