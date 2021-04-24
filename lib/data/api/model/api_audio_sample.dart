
import 'package:audio_quest/domain/model/audio_sample.dart';

class ApiAudioSample {
  String uid;
  String url;
  bool main;
  String positiveAnswer;
  String negativeAnswer;
  String noAnswer;
  int secToEnd = 0;

  ApiAudioSample(Map<String, dynamic> map):
    uid = map['uid'],
    url = map['url'],
    main = map['main'],
    positiveAnswer = map['positiveAnswer'],
    negativeAnswer = map['negativeAnswer'],
    noAnswer = map['noAnswer'],
    secToEnd = map['secToEnd'] ?? 0;

  AudioSample toAudioSample() {
    return new AudioSample.withSecName(uid: uid, url:url, positiveAnswer:positiveAnswer, negativeAnswer:negativeAnswer, noAnswer:noAnswer, secToEnd: secToEnd);
  }

  factory ApiAudioSample.fromApi(Map<String, dynamic> map) {
    if(map == null){
      return null;
    }
    else{
      return ApiAudioSample(map);
    }
  }
}