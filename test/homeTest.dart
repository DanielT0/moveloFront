import 'package:flutter_test/flutter_test.dart';
import 'package:movelo/ui/widgets/infoCardNumbers.dart';
import 'package:flutter/material.dart';
void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(InfoCardNumbers(titulo: 'Hola', dato: 20, unidades: "3", color: Colors.green, icono: Icons.ac_unit,));
  });
}