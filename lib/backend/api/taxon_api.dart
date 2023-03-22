import 'package:http/http.dart' as http;

class TaxonAPI {
  final taxonGroups = {"birds": 8};

  final basePath = 'https://artskart.artsdatabanken.no/publicapi/api/taxon';

  //final basePath = 'https://artskart.artsdatabanken.no/appapi/api/data/SearchTaxons';

  TaxonAPI() : super();

  Future<http.Response> searchForTaxons(String searchTerm) {
    return http.get(Uri.parse('$basePath?term=$searchTerm'),
        //&taxonGroups=${taxonGroups["birds"]}
        headers: {'accept': 'application/json'});
  }
}
