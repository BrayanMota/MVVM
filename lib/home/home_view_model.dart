import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class IcmViewModel extends ChangeNotifier {
  void calculateIMC();
}

class HomeViewModelImpl extends IcmViewModel {
  num _height = 0;
  num _weight = 0;

  // Monitora o valor do _result, quando for alterado o RXNotifier irá alterar o estado da View.
  final _result = RxNotifier<String>('');

  @override
  void calculateIMC() {
    final num imcValue = _weight / math.pow(_height, 2);
    final String imcText = imcValue.toStringAsFixed(1);

    if (imcValue < 18.0) {
      _result.value = 'O seu IMC é de $imcText, você está abaixo do peso!';
    } else if (imcValue >= 18.0 && imcValue < 24.0) {
      _result.value = 'O seu IMC é de $imcText, você está bem!';
    } else {
      _result.value = 'O seu IMC é de $imcText, você está acima do peso!';
    }
  }

  set weight(String value) {
    _weight = double.tryParse(value) ?? 0;
  }

  set height(String value) {
    _height = double.tryParse(value) ?? 0;
  }

  get result => _result.value;
}