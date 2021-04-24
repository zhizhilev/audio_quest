import 'package:meta/meta.dart';

class GetAudioQuestBody {
  final String api_key;

  GetAudioQuestBody({
    @required this.api_key,
  });

  Map<String, dynamic> toApi() {
    return {
      'api_key': api_key
    };
  }
}