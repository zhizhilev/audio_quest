import 'package:audio_quest/data/repository/audio_quest_data_repository.dart';
import 'package:audio_quest/domain/repository/audio_quest_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static AudioQuestRepository _audioQuestRepository;

  static AudioQuestRepository audioQuestRepository() {
    if (_audioQuestRepository == null) {
      _audioQuestRepository = AudioQuestDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _audioQuestRepository;
  }
}