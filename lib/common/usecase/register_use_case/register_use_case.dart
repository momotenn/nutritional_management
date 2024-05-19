import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_local_repository_interface.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_remote_repository_interface.dart';
import 'package:nutritional_management/common/usecase/register_use_case/register_use_case_interface.dart';

class UserRegisterUseCase implements UserRegisterUseCaseInterface {
  final UserLocalRepositoryInterface userLocalRepository;
  final UserRemoteRepositoryInterface userRemoteRepository;

  UserRegisterUseCase(this.userLocalRepository, this.userRemoteRepository);

  @override
  Future<void> call(String name, List<int>? imageBytes, String uid) async {
    String? base64ImageData;
    if (imageBytes != null) {
      base64ImageData = base64Encode(imageBytes);
    }

    final userID =
        await userRemoteRepository.create(name, base64ImageData, uid);
    final localResult = await userLocalRepository.saveUserInfo(userID);

    return localResult;
  }
}
