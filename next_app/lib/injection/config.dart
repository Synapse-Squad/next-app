/// Application configuration
class Config {
  /// Creates a new [Config] instance.
  const Config();

  String get itunesApiBaseUrl =>
      const String.fromEnvironment('itunesApiBaseUrl');

  String get googleBooksApiBaseUrl =>
      const String.fromEnvironment('googleBooksApiBaseUrl');

  String get moviesDbApiBaseUrl =>
      const String.fromEnvironment('moviesDbApiBaseUrl');

  String get googleBooksApiKey =>
      const String.fromEnvironment('googleBooksApiKey');

  String get moviesDbBearerToken =>
      const String.fromEnvironment('moviesDbBearerToken');
}
