import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/blog_model.dart';
import '../models/candidate_model.dart';
import '../models/user_address_model.dart';
import '../models/user_exp_model.dart';
import '../models/user_model.dart';
import '../repositories/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _home = HomeRepository();

  Future<void> getCandidatesC() async {
    emit(HomeLoading());

    final res = await _home.getCandidatesR();

    if (res.statusCode == 200) {
      emit(GetCandidateSuccess(res.data));
    } else {
      emit(HomeError(res.message ?? ''));
    }
  }

  Future<void> getBlogsC() async {
    emit(HomeLoading());

    final res = await _home.getBlogsR();

    if (res.statusCode == 200) {
      emit(GetBlogSuccess(res.data));
    } else {
      emit(HomeError(res.message ?? ''));
    }
  }

  Future<void> getAddressC() async {
    emit(HomeLoading());

    final res = await _home.getAddressR();

    if (res.statusCode == 200) {
      emit(GetAddressSuccess(res.data));
    } else {
      emit(HomeError(res.message ?? ''));
    }
  }

  Future<void> getEmailsC() async {
    emit(HomeLoading());

    final res = await _home.getEmailsR();

    if (res.statusCode == 200) {
      emit(GetEmailSuccess(res.data));
    } else {
      emit(HomeError(res.message ?? ''));
    }
  }

  Future<void> getExperiencesC() async {
    emit(HomeLoading());

    final res = await _home.getExperiencesR();

    if (res.statusCode == 200) {
      emit(GetExpSuccess(res.data));
    } else {
      emit(HomeError(res.message ?? ''));
    }
  }
}
