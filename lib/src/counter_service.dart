import 'package:shared_preferences/shared_preferences.dart';

class CounterService {
  SharedPreferences preferences;
  final String countKey = "COUNT";

  CounterService(this.preferences);

  bool get isInitialized => preferences == null;

  int getCount() => preferences.getInt(countKey);

  changeCount(int count) => preferences.setInt(countKey, count);
}
