import 'package:flutter/material.dart' show BuildContext;
import 'package:login_flow_bloc/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showAuthError({
  required String authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: 'Error',
    content: authError,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}
