import 'package:dio/dio.dart';

const _baseUrl = 'http://localhost:8002';

// global variable
final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
