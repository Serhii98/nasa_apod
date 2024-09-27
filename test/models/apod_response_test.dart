import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

void main() {
  group('ApodResponse', () {
    test('should initialize ApodResponse correctly', () {
      final ApodResponse apod = ApodResponse(
        copyright: 'NASA',
        date: '2024-09-26',
        explanation: 'Test explanation',
        hdurl: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg',
        mediaType: 'image',
        serviceVersion: 'v1',
        title: 'Test Title',
        url: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg',
      );

      expect(apod.copyright, 'NASA');
      expect(apod.date, '2024-09-26');
      expect(apod.explanation, 'Test explanation');
      expect(apod.hdurl, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg');
      expect(apod.mediaType, 'image');
      expect(apod.serviceVersion, 'v1');
      expect(apod.title, 'Test Title');
      expect(apod.url, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg');
    });

    test('should create ApodResponse from JSON', () {
      final Map<String, String> json = <String, String>{
        'copyright': 'NASA',
        'date': '2024-09-26',
        'explanation': 'Test explanation',
        'hdurl': 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg',
        'media_type': 'image',
        'service_version': 'v1',
        'title': 'Test Title',
        'url': 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg',
      };

      final ApodResponse apod = ApodResponse.fromJson(json);

      expect(apod.copyright, 'NASA');
      expect(apod.date, '2024-09-26');
      expect(apod.explanation, 'Test explanation');
      expect(apod.hdurl, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg');
      expect(apod.mediaType, 'image');
      expect(apod.serviceVersion, 'v1');
      expect(apod.title, 'Test Title');
      expect(apod.url, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg');
    });

    test('should convert ApodResponse to JSON', () {
      final ApodResponse apod = ApodResponse(
        copyright: 'NASA',
        date: '2024-09-26',
        explanation: 'Test explanation',
        hdurl: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg',
        mediaType: 'image',
        serviceVersion: 'v1',
        title: 'Test Title',
        url: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg',
      );

      final Map<String, dynamic> json = apod.toJson();

      expect(json['copyright'], 'NASA');
      expect(json['date'], '2024-09-26');
      expect(json['explanation'], 'Test explanation');
      expect(json['hdurl'], 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg');
      expect(json['media_type'], 'image');
      expect(json['service_version'], 'v1');
      expect(json['title'], 'Test Title');
      expect(json['url'], 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg');
    });

    test('should create a copy of ApodResponse with new values', () {
      final ApodResponse apod = ApodResponse(
        copyright: 'NASA',
        date: '2024-09-26',
        explanation: 'Test explanation',
        hdurl: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg',
        mediaType: 'image',
        serviceVersion: 'v1',
        title: 'Test Title',
        url: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg',
      );

      final ApodResponse updatedApod = apod.copyWith(
        title: 'Updated Title',
        url: 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg',
      );

      expect(updatedApod.copyright, 'NASA');
      expect(updatedApod.date, '2024-09-26');
      expect(updatedApod.explanation, 'Test explanation');
      expect(updatedApod.hdurl, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_3000.jpg');
      expect(updatedApod.mediaType, 'image');
      expect(updatedApod.serviceVersion, 'v1');
      expect(updatedApod.title, 'Updated Title');
      expect(updatedApod.url, 'https://apod.nasa.gov/apod/image/2409/Comet23A3_LucyHu_960.jpg');
    });
  });
}
