
class AudioSample {
  final String uid;
  final String url;
  final String positiveAnswer;
  final String negativeAnswer;
  final String noAnswer;
  int secToEnd = 0;
  AudioSample.withSec(this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd);
  AudioSample.withSecName({this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd});
  AudioSample(this.uid, this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer);

}