import 'package:dayout_weather/data/models/remote/response/weather/weather_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_remote_data_source.g.dart';

@RestApi()
abstract class WeatherRemoteDataSource {
  factory WeatherRemoteDataSource(Dio dio) = _WeatherRemoteDataSource;

  @GET('forecast')
  Future<WeatherResponseDto> getCurrentWeather(@Queries() Map<String, dynamic> queries);
}
