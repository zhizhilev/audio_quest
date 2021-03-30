
class AudioSample {
  final String url;
  final AudioSample positiveAnswer;
  final AudioSample negativeAnswer;
  final AudioSample noAnswer;
  int secToEnd = 0;
  AudioSample.withSec(this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd);
  AudioSample.withSecName({this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer, this.secToEnd});
  AudioSample(this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer);

}