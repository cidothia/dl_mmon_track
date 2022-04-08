import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

final i18nRM = RM.injectI18N(
  {
    const Locale('en'): () => AppLocalizationsEn(),
  },
);
