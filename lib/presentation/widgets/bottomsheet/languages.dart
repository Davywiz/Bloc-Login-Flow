import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:login_flow_bloc/bloc/language/language_cubit.dart';
import 'package:login_flow_bloc/presentation/resources/language_manager.dart';
import 'package:login_flow_bloc/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void changeLanguage(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: Languages(
          context: ctx,
        ),
      );
    },
  );
}

class Languages extends StatelessWidget {
  final BuildContext context;
  const Languages({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(AppStrings.changeLanguage).tr(),
          Expanded(
            child: ListView(
              children: LanguageType.values
                  .map(
                    (e) => ListTile(
                      onTap: () async {
                        context.read<LanguageCubit>().setLanguageChanged(e);
                      },
                      title: Text(
                        e.getTextString(),
                      ).tr(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
