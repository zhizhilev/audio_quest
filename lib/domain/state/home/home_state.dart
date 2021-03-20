import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:audio_quest/domain/repository/audio_sample_repository.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this.audioSampleRepository);

  @observable
  AudioSampleRepository audioSampleRepository;

  @observable
  AudioSample audioSample;

  @observable
  bool isLoading = false;

  @action
  Future<void> getAudioSample({
    @required String api_key
  }) async {
    isLoading = true;
    final data = await audioSampleRepository.getAudioSampleTree(api_key: '');
    audioSample = data;
    isLoading = false;
  }
}