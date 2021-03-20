import 'package:audio_quest/domain/state/home/home_state.dart';
import 'package:audio_quest/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.audioSampleRepository(),
    );
  }
}