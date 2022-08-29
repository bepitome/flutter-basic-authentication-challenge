import 'package:stack_trace/stack_trace.dart';

class TraceUtil {
  TraceUtil._();

  static String? getClassName() {
    return Trace.current().frames[2].member?.split(".")[0];
  }

  static String? getMethodName() {
    return Trace.current().frames[2].member?.split(".")[1];
  }
}