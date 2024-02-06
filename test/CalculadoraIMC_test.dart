import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyectos/main.dart';
void main() {
  testWidgets('TEST 1: Prueba de CalculadoraIMC', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculadoraIMC())); // Asegúrate de importar correctamente la clase CalculadoraIMC

    // Ingresa valores de prueba y presiona el botón de cálculo
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el peso en KG'), '70');
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el altura en metros'), '1.73');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica si el resultado se muestra correctamente
    expect(find.text('Tu IMC es de: 23.4'), findsOneWidget);
  });
  testWidgets('TEST 2: Prueba de CalculadoraIMC', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculadoraIMC())); // Asegúrate de importar correctamente la clase CalculadoraIMC

    // Ingresa valores de prueba y presiona el botón de cálculo
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el peso en KG'), '60');
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el altura en metros'), '1.75');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica si el resultado se muestra correctamente
    expect(find.text('Tu IMC es de: 19.6'), findsOneWidget);
  });
  testWidgets('TEST 3: Prueba de CalculadoraIMC', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculadoraIMC())); // Asegúrate de importar correctamente la clase CalculadoraIMC

    // Ingresa valores de prueba y presiona el botón de cálculo
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el peso en KG'), '62');
    await tester.enterText(find.widgetWithText(TextField, 'Introduce el altura en metros'), '1.70');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica si el resultado se muestra correctamente
    expect(find.text('Tu IMC es de: 21.5'), findsOneWidget);
  });
}