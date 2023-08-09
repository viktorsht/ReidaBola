abstract class HeadersApi {
  Map<String, String> get headers;
}

class DefaultHeadersApi extends HeadersApi {
  @override
  Map<String, String> get headers => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
}
