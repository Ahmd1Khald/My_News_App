abstract class AppStates{}

class AppInitialState extends AppStates {}

class AppChangeBottomIndexState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppGetBusinessSucccesState extends AppStates {}

class AppGetBusinessErrorState extends AppStates {
  final String error;

  AppGetBusinessErrorState(this.error);
}
  class AppGetSportsSucccesState extends AppStates {}

  class AppGetSportsErrorState extends AppStates {
    final String error;

    AppGetSportsErrorState(this.error);
  }

  class AppGetSciencesSucccesState extends AppStates {}

  class AppGetSciencesErrorState extends AppStates {
    final String error;

    AppGetSciencesErrorState(this.error);
  }

class AppGetSearchSucccesState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}
