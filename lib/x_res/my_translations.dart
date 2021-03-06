import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'my_config.dart';

/// createdby Daewu Bintara
/// Tuesday, 1/26/21

class MyTranslations extends Translations {

  // Default locale
  static final en = Locale('en');

  // fallbackLocale saves the day when the locale gets in trouble
  static final vi = Locale('en');

  static void init() {
    final box = GetStorage();
    String locale = box.read(MyConfig.LANGUAGE);
    if(locale == null) {
      Get.updateLocale(Locale('en'));
      box.write(MyConfig.LANGUAGE, 'en');
    } else {
      Get.updateLocale(Locale(locale));
    }
  }

  static void updateLocale({@required String langCode = 'en'}) {
    final box = GetStorage();
    Get.updateLocale(Locale(langCode));
    box.write(MyConfig.LANGUAGE, langCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'id': { // INDONESIAN
      'title_app': 'Judul Aplikasimu',
      'saya' : 'Sayaa',
      'peringatan': 'Peringatan',
      'tutup': 'Tutup',
      'reload': 'Ulangi',
      'error_message': 'Terjadi kesalahan, coba beberapa saat lagi...',
      'beranda': 'Beranda',
      'change_lang': 'Ubah Bahasa',
      'increment': 'Penambahan',
      'goto_test': 'Menuju Halaman Test',
      'test_screen': 'Halaman Test',
      'my_flutter': 'Flutter Saya',
      'change_theme': 'Ubah Tema',
      'account':'Account',
      'password':'Password',
    },
    'en': { // ENGLISH
      'title_app': 'Your App Title',
      'checkin_title': 'CHECK-IN',
      'checkout_title':'CHECK-OUT',
      'login_notify' : 'You need login to use the system',
      'tutup' : 'Close',
      'reload' : 'Reload',
      'error_message': 'Something went wrong, try again later...',
      'beranda': 'Home',
      'change_lang': 'Change Language',
      'increment': 'Increment',
      'goto_test': 'Go to Test Screen',
      'test_screen': 'Test Screen',
      'my_flutter': 'My Flutter',
      'change_theme': 'Change Theme',
      'account':'Account',
      'password':'Password',
      'login':'Login',
      'first_name':'First Name',
      'last_name': 'Last Name',
      'email':"Email",
      'option':'Optional',
      'dob':'Date of Birth'
    },
    'vi': { // VietNamese
      'title_app': 'Nail',
      'checkin_title': 'CHECK-IN',
      'checkout_title':'CHECK-OUT',
      'saya': 'T??i l??',
      'peringatan' : 'Th??ng b??o',
      'tutup' : '????ng',
      'reload' : 'T???i l???i',
      'error_message': 'C?? g?? ???? kh??ng ????ng,vui l??ng t???i l???i...',
      'beranda': 'Trang ch???',
      'change_lang': '?????i ng??n ng???',
      'increment': 'T??ng',
      'goto_test': '??i ?????n m??n Test',
      'test_screen': 'Test Screen',
      'my_flutter': 'My Flutter',
      'change_theme': 'Change Theme',
      'account': 'T??i kho???n',
      'password':'M???t kh???u',
      'login':'????ng nh???p',
      'first_name':'T??n',
      'last_name': 'H???',
      'email':"Email",
      'option':'Kh??ng b???t bu???c',
      'dob':'Ng??y sinh'
    }
  };
}