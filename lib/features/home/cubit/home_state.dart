part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String errorMessage,
    @Default(false) bool isLoading,
    @Default([]) List<RecipeModel> recipes,
  }) = _HomeState;
}
