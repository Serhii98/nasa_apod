import 'package:nasa_apod/bootstrap.dart';
import 'package:nasa_apod/src/di/flavor.dart';

void main() async {
  await bootstrap(Flavor.prod);
}
