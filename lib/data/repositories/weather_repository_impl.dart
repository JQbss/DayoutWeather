import 'package:dayout_weather/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:dayout_weather/data/mappers/weather_mapper.dart';
import 'package:dayout_weather/data/models/remote/request/weather_request_dto.dart';
import 'package:dayout_weather/domain/entities/wather_reading.dart';
import 'package:dayout_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final WeatherRemoteDataSource _dataSource;
  final WeatherMapper _mapper;

  WeatherRepositoryImpl({
    required WeatherRemoteDataSource dataSource,
    required WeatherMapper mapper,
  })  : _dataSource = dataSource,
        _mapper = mapper;

  @override
  Future<WeatherReading> fetchCurrent({
    required double lat,
    required double lon,
  }) async {
    final request = WeatherRequestDto(latitude: lat, longitude: lon);
    final response = await _dataSource.getCurrentWeather(request.toJson());
    return _mapper.fromResponseDto(response);
  }
}
