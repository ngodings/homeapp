part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}


class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

class GetCandidateSuccess extends HomeState {
  final List<CandidateModel> data;
  GetCandidateSuccess(this.data);
}

class GetBlogSuccess extends HomeState {
  final List<BlogModel> data;
  GetBlogSuccess(this.data);
}

class GetAddressSuccess extends HomeState {
  final List<UserAddressModel> data;
  GetAddressSuccess(this.data);
}

class GetEmailSuccess extends HomeState {
  final List<UserModel> data;
  GetEmailSuccess(this.data);
}

class GetExpSuccess extends HomeState {
  final List<UserExperienceModel> data;
  GetExpSuccess(this.data);
}