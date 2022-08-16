
import 'package:flutter/material.dart';

import '../models/debug_log_item.dart';

class DebugViewController extends ChangeNotifier {
  final ValueNotifier<List<DebugLogItem>> listLog = ValueNotifier<List<DebugLogItem>>([]);

  addLog(DebugLogItem item) => listLog.value.add(item);
}
