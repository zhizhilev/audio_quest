
class ApiAudioSample {
  final String url;
  final String positiveAnswer;
  final String negativeAnswer;
  final String noAnswer;

  ApiAudioSample.fromApi(Map<String, dynamic> map)
      : url = null, //map['results']['url'],
        positiveAnswer =  null, //map['results']['positive_answer'],
        negativeAnswer =  null, //map['results']['negative_answer'],
        noAnswer =  null;//map['results']['no_answer'];

}