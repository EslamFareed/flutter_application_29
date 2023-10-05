import 'package:flutter/material.dart';
import 'package:flutter_application_29/cubits/cubit/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcome),
      ),
      body: Center(
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return SwitchListTile(
              value:
                  MainCubit.get(context).currentLang == const Locale('en', ''),
              onChanged: (value) {
                if (AppLocalizations.of(context)!.localeName == "ar") {
                  MainCubit.get(context).changeLangToEn();
                } else {
                  MainCubit.get(context).changeLangToAr();
                }
              },
              title: Text(AppLocalizations.of(context)!.changelang),
            );
          },
        ),
      ),
    );
  }
}
