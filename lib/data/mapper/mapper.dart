// to convert the response into non nullable objects (model)

import 'package:login_flow_bloc/app/extensions.dart';
import 'package:login_flow_bloc/data/response/responses.dart';
import 'package:login_flow_bloc/models/model.dart';

const EMPTY = "";
const ZERO = 0;

extension LoginResponseMapper on LoginResponse? {
  AuthData toDomain() {
    return AuthData(
      this?.token?.orEmpty() ?? EMPTY,
      this?.userId?.orEmpty() ?? EMPTY,
    );
  }
}
