import 'package:flutter/foundation.dart';
var tips = [
  'List 3 things that you were grateful for today, no matter how small',
  'Let go of your online presence for a few hours today and do anything you find fun face-to-face',
  'Go outside for 20 minutes and bask in the sunlight, get some Vitamin D to elevate your mood',
  'Try to stenghten your relationships with your family and/or friends today, they are your main pillars of support'
];
void motivationalnotifs() {
  for (int i = 0; i < tips.length; i++) {
    var x = i + 1;
    debugPrint('Tip #${x.toString()}: tips[i]\n');
  }
}
