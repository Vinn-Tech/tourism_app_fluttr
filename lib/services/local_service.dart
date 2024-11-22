import 'package:tourism_app/models/destinations.dart';
import 'package:tourism_app/utils/load_asset.dart';

class LocalService {
  final LoadAsset _loadAsset;

  const LocalService(this._loadAsset);

  Future<dynamic> getDestinations() async {
    try {
      final result = await _loadAsset.loadJsonAsset();

      return Destinations.fromJson(result);
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
