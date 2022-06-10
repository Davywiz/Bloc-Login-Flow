// extension on String

import 'package:login_flow_bloc/data/mapper/mapper.dart';
import 'package:flutter/foundation.dart' show kDebugMode;



extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}


extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

//extension on Integer
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}
