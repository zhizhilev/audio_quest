
class AudioSample {
  final String uid;
  final String url;
  final String positiveAnswer;
  final String negativeAnswer;
  final String noAnswer;
  int secToEnd = 0;
  bool main;
  AudioSample.withSec(this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd, this.main);
  AudioSample.withSecName({this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd, this.main});
  AudioSample(this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer);

}