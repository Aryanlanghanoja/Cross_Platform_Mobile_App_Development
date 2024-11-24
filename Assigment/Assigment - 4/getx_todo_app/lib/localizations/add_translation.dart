import 'package:get/get.dart';
import 'package:getx_todo_app/localizations/languages/ar.dart';
import 'package:getx_todo_app/localizations/languages/en.dart';
import 'package:getx_todo_app/localizations/languages/fr.dart';
import 'package:getx_todo_app/localizations/languages/gu.dart';
import 'package:getx_todo_app/localizations/languages/hi.dart';

class AddTraslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en': en, 'hi': hi, 'gu': gu, 'ar': ar, 'fr': fr};
}
