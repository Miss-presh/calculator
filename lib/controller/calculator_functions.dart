// Scientific calculator functions
import 'package:my_calculator_app/controller/calculator_controllers.dart';
import 'package:my_calculator_app/models/calculators_model.dart';
import 'dart:math' as math;

class ScientificCalculator extends CalculatorLogic {
  static CalculatorState handleScientificFunction(CalculatorState state, String function) {
    final current = state.currentValue ?? 0;
    double? result;
    
    switch (function) {
      case "sin":
        result = math.sin(current * math.pi / 180); // Convert to radians
        break;
      case "cos":
        result = math.cos(current * math.pi / 180);
        break;
      case "tan":
        result = math.tan(current * math.pi / 180);
        break;
      case "log":
        if (current <= 0) return state.copyWith(display: "Error");
        result = math.log(current) / math.ln10;
        break;
      case "ln":
        if (current <= 0) return state.copyWith(display: "Error");
        result = math.log(current);
        break;
      case "x²":
        result = current * current;
        break;
      case "x³":
        result = current * current * current;
        break;
      case "1/x":
        if (current == 0) return state.copyWith(display: "Error");
        result = 1 / current;
        break;
    }
    
    if (result == null) return state;
    
    return state.copyWith(
      display: CalculatorLogic.formatDisplay(result),
      currentValue: result,
    );
  }
}
