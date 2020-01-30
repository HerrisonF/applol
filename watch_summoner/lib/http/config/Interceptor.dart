import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request url: ${data.baseUrl}');
    print('Request Headers: ${data.headers}');
    print('Request body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response body: ${data.body}');
    print('Response code: ${data.statusCode}');
    return data;
  }

  Client getInterceptorClient(){
    return HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  }
}