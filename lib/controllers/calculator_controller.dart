import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = ''.obs; // For showing the entered expression
  var result = '0'.obs; // For showing the calculated result

  // Append numbers/operators to the expression
  void append(String value) {
    if (expression.value.isEmpty && _isOperator(value)) return;
    expression.value += value;
  }

  // Clear everything
  void clear() {
    expression.value = '';
    result.value = '0';
  }

  // Remove the last entered value
  void delete() {
    if (expression.value.isNotEmpty) {
      expression.value = expression.value.substring(0, expression.value.length - 1);
    }
  }

  // Perform calculation
  void calculate() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression.value.replaceAll('×', '*').replaceAll('÷', '/'));
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      result.value = eval.toString();
    } catch (e) {
      result.value = 'Error';
    }
  }

  // Helper to check if a value is an operator
  bool _isOperator(String value) {
    return value == '+' || value == '-' || value == '×' || value == '÷';
  }
}
