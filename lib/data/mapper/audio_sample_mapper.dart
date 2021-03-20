import 'package:audio_quest/data/api/model/api_audio_sample.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';

class AudioSampleMapper {
  static AudioSample fromApi(ApiAudioSample day) {

    // DateTime.tryParse(dateString),

    // return AudioSample(
    //   url: day.url,
    //   positiveAnswer: day.positiveAnswer,
    //   negativeAnswer: day.negativeAnswer,
    //   noAnswer: day.noAnswer
    // );
  print("qweqwe oooo");
    //TODO: заглушка
    return AudioSample(
        "https://audio.cursor72.ru/media/test/one.mp3",
        AudioSample(
          "https://audio.cursor72.ru/media/test/one_yes.mp3",
          AudioSample(
              "https://audio.cursor72.ru/media/test/two_yes.mp3",
              null,
              null,
              null
          ),
          AudioSample(
              "https://audio.cursor72.ru/media/test/two_no.mp3",
              null,
              null,
              null
          ),
          AudioSample(
              "https://audio.cursor72.ru/media/test/two_no.mp3",
              null,
              null,
              null
          ),
        ),
        AudioSample(
            "https://audio.cursor72.ru/media/test/one_no.mp3",
            null,
            null,
            null
        ),
        AudioSample(
            "https://audio.cursor72.ru/media/test/one_stop.mp3",
            null,
            null,
            null
        )
    );


  }
}