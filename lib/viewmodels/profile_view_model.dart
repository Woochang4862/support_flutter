import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:support_flutter/models/profile_model.dart';
import 'package:support_flutter/repositories/profile_repository.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, AsyncValue<ProfileModel?>>((ref) {
  final profileRepository = ref.read(profileRepositoryProvider);
  return ProfileViewModel(profileRepository: profileRepository);
});

class ProfileViewModel extends StateNotifier<AsyncValue<ProfileModel?>> {
  final ProfileRepository profileRepository;
  ProfileViewModel({
    required this.profileRepository,
  }) : super(AsyncLoading()) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      state = AsyncLoading();
      final response = await profileRepository.fetch();
      state = AsyncData(response);
    } on ProfileModelError catch (e) {
      state = AsyncError(e, e.stackTrace);
    } catch (e) {
      final error = ProfileModelError(
          statusMessage: '예외발생 - $e', type: ProfileModelType.fetch);
      state = AsyncError(error, error.stackTrace);
    }
  }
}
