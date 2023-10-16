import 'package:get/get.dart';

class Controller extends GetxController{
  var count =0.obs;
  var _text = 'TEXT Counter'.obs;
  final List<String> _list = ['Bangla', 'Hindi'].obs;
  void _incrementCounter() {

      count++;

      _text = 'TEXT Counter= ${count.toString()}' as RxString;

      _list.add('TEXT Counter= ${count.toString()}');

  }
}