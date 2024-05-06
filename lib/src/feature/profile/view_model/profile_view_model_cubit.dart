import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_view_model_state.dart';

class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  ProfileViewModelCubit() : super(ProfileViewModelInitial());
}
