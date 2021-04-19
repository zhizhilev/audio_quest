
class ApiAudioSample {
  String url;
  bool main;
  ApiAudioSample positiveAnswer;
  ApiAudioSample negativeAnswer;
  ApiAudioSample noAnswer;
  int secToEnd = 0;

  ApiAudioSample(Map<String, dynamic> map):

    url = map['url'],
    main = map['main'],
    positiveAnswer = ApiAudioSample.fromApi(map['positiveAnswer']),
    negativeAnswer = ApiAudioSample.fromApi(map['negativeAnswer']),
    noAnswer = ApiAudioSample.fromApi(map['noAnswer']),
    secToEnd = map['secToEnd'] ?? 0;


  factory ApiAudioSample.fromApi(Map<String, dynamic> map) {
    if(map == null){
      return null;
    }
    else{
      return ApiAudioSample(map);
    }
  }
}