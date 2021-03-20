import 'package:audio_quest/data/repository/audio_sample_data_repository.dart';
import 'package:audio_quest/domain/repository/audio_sample_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static AudioSampleRepository _audioSampleRepository;

  static AudioSampleRepository audioSampleRepository() {
    if (_audioSampleRepository == null) {
      _audioSampleRepository = AudioSampleDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _audioSampleRepository;
  }
}