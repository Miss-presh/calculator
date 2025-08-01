// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:my_calculator_app/controller/calculator_controllers.dart';
import 'package:my_calculator_app/models/calculators_model.dart';

void main() {
  group('Calculator Logic Tests', () {
    test('Basic addition', () {
      var state = const CalculatorState();
      state = CalculatorLogic.processInput(state, "2");
      state = CalculatorLogic.processInput(state, "+");
      state = CalculatorLogic.processInput(state, "3");
      state = CalculatorLogic.processInput(state, "=");
      
      expect(state.display, "5");
      expect(state.currentValue, 5.0);
    });
    
    test('Division by zero', () {
      var state = const CalculatorState();
      state = CalculatorLogic.processInput(state, "5");
      state = CalculatorLogic.processInput(state, "÷");
      state = CalculatorLogic.processInput(state, "0");
      state = CalculatorLogic.processInput(state, "=");
      
      expect(state.display, "Error");
    });
    
    test('Memory functions', () {
      var state = const CalculatorState();
      state = CalculatorLogic.processInput(state, "5");
      state = CalculatorLogic.processInput(state, "M+");
      expect(state.memory, 5.0);
      
      state = CalculatorLogic.processInput(state, "3");
      state = CalculatorLogic.processInput(state, "M+");
      expect(state.memory, 8.0);
      
      state = CalculatorLogic.processInput(state, "MR");
      expect(state.display, "8");
    });
    
    test('Complex calculation with history', () {
      var state = const CalculatorState();
      state = CalculatorLogic.processInput(state, "2");
      state = CalculatorLogic.processInput(state, "+");
      state = CalculatorLogic.processInput(state, "3");
      state = CalculatorLogic.processInput(state, "=");
      
      expect(state.history.length, 1);
      expect(state.history.first.expression, "2 + 3");
      expect(state.history.first.result, "5");
    });
  });
}
