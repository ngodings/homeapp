import 'package:homeapp/core/base_repository.dart';

import '../../../core/base_response.dart';
import '../../../utils/string.dart';
import '../models/blog_model.dart';
import '../models/candidate_model.dart';
import '../models/user_address_model.dart';
import '../models/user_exp_model.dart';
import '../models/user_model.dart';

class HomeRepository extends BaseRepository {
  Future<BaseResponse> getCandidatesR() async {
    final res = await get(candidatesUrl);

    if (res.statusCode == 200) {
      final List<CandidateModel> data =
          List.from(res.data).map((e) => CandidateModel.fromJson(e)).toList();
      return BaseResponse(
        data: data,
        message: res.message,
        statusCode: res.statusCode,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        statusCode: res.statusCode,
      );
    }
  }

  Future<BaseResponse> getBlogsR() async {
    final res = await get(blogUrl);

    if (res.statusCode == 200) {
      final List<BlogModel> data =
          List.from(res.data).map((e) => BlogModel.fromJson(e)).toList();
      return BaseResponse(
        data: data,
        message: res.message,
        statusCode: res.statusCode,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        statusCode: res.statusCode,
      );
    }
  }

  Future<BaseResponse> getAddressR() async {
    final res = await get(addressUrl);

    if (res.statusCode == 200) {
      final List<UserAddressModel> data =
          List.from(res.data).map((e) => UserAddressModel.fromJson(e)).toList();
      return BaseResponse(
        data: data,
        message: res.message,
        statusCode: res.statusCode,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        statusCode: res.statusCode,
      );
    }
  }

  Future<BaseResponse> getEmailsR() async {
    final res = await get(emailUrl);

    if (res.statusCode == 200) {
      final List<UserModel> data =
          List.from(res.data).map((e) => UserModel.fromJson(e)).toList();
      return BaseResponse(
        data: data,
        message: res.message,
        statusCode: res.statusCode,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        statusCode: res.statusCode,
      );
    }
  }

  Future<BaseResponse> getExperiencesR() async {
    final res = await get(expUrl);

    if (res.statusCode == 200) {
      final List<UserExperienceModel> data = List.from(res.data)
          .map((e) => UserExperienceModel.fromJson(e))
          .toList();
      return BaseResponse(
        data: data,
        message: res.message,
        statusCode: res.statusCode,
      );
    } else {
      return BaseResponse(
        data: res.data,
        message: res.message,
        statusCode: res.statusCode,
      );
    }
  }
}
