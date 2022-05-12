// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:unitins_imc/person_model.dart';

void main() {
  test('Teste de IMC deve retornar valor igual à 21', () {
    final person = PersonModel(height: 1.84, weight: 70.0);

    expect(person.getIMC().round(), 21);
  });
}
