abstract class LocalSearchDataSource {
  Future<List<String>> fetchHistory();
  Future saveHistory(String search);
}
