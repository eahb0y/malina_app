// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Лента`
  String get home {
    return Intl.message(
      'Лента',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get favourite {
    return Intl.message(
      'Избранное',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Корзина`
  String get basket {
    return Intl.message(
      'Корзина',
      name: 'basket',
      desc: '',
      args: [],
    );
  }

  /// `Еда`
  String get basket_eat {
    return Intl.message(
      'Еда',
      name: 'basket_eat',
      desc: '',
      args: [],
    );
  }

  /// `Товары`
  String get basket_stuff {
    return Intl.message(
      'Товары',
      name: 'basket_stuff',
      desc: '',
      args: [],
    );
  }

  /// `Искать в Malina`
  String get search_on {
    return Intl.message(
      'Искать в Malina',
      name: 'search_on',
      desc: '',
      args: [],
    );
  }

  /// `Доставка`
  String get delivery {
    return Intl.message(
      'Доставка',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `В заведении`
  String get order_at {
    return Intl.message(
      'В заведении',
      name: 'order_at',
      desc: '',
      args: [],
    );
  }

  /// `Заказать`
  String get order {
    return Intl.message(
      'Заказать',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Очистить`
  String get clean {
    return Intl.message(
      'Очистить',
      name: 'clean',
      desc: '',
      args: [],
    );
  }

  /// `Поместите QR-код в рамку`
  String get qr_title {
    return Intl.message(
      'Поместите QR-код в рамку',
      name: 'qr_title',
      desc: '',
      args: [],
    );
  }

  /// `Товар добавлен в корзину`
  String get product_add_basket {
    return Intl.message(
      'Товар добавлен в корзину',
      name: 'product_add_basket',
      desc: '',
      args: [],
    );
  }

  /// `{num} C`
  String som(Object num) {
    return Intl.message(
      '$num C',
      name: 'som',
      desc: '',
      args: [num],
    );
  }

  /// `C`
  String get sum {
    return Intl.message(
      'C',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `Добавки`
  String get add {
    return Intl.message(
      'Добавки',
      name: 'add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
