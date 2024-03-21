import 'package:get/state_manager.dart';

import '../models/quran_editions_model.dart';
import '../models/sadja_ayats_model.dart';
import '../models/search_text_In_Quran_model.dart';
import '../models/surah_meta_data_model.dart';
import '../models/surah_model.dart';

class CommonController extends GetxController {
  Rx<QuranEditionsModel> allQuranEditionsController = QuranEditionsModel().obs;
  Rx<SurahModel> surah = SurahModel().obs;
  Rx<SearchTextInQuranModel> allSearchTextInQuran =
      SearchTextInQuranModel().obs;

  Rx<SajdaAyatsModel> allSadjaAyatsInQuran = SajdaAyatsModel().obs;

  Rx<SurahMetaDataModel?> allSurahMetaData = SurahMetaDataModel().obs;
}
