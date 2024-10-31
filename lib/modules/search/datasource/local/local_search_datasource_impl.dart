import 'package:corelab_app_challenge/modules/search/datasource/local/local_search_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSearchDatasourceImpl extends LocalSearchDataSource {
  static const maxHistorySize = 20;

  static const historyKey = 'search_history';

  @override
  Future<List<String>> fetchHistory() async {
    final pref = await SharedPreferences.getInstance();
    final history = pref.getStringList(historyKey) ?? [];

    return history.toList();
  }

  @override
  Future saveHistory(String search) async {
    final pref = await SharedPreferences.getInstance();
    List<String> history = await fetchHistory();

    history = [search, ...history];

    if (history.length > maxHistorySize) {
      history.removeRange(history.length - maxHistorySize, history.length);
    }

    await pref.setStringList(historyKey, history);
  }
}
