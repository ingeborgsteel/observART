import 'package:http/http.dart' as http;

class TaxonAPI {
  //final basePath = 'https://artskart.artsdatabanken.no/PublicApi/Taxon';
  final basePath =
      'https://artskart.artsdatabanken.no/appapi/api/data/SearchTaxons';

  TaxonAPI() : super();

  Future<http.Response> searchForTaxons(String searchTerm) {
    return http.get(Uri.parse('$basePath?maxCount=20&name=$searchTerm}'));
  }
}
