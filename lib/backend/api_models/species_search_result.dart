class SpeciesSearchResult {
  int id;
  String taxonGroup;
  String scientificName;
  String name;
  bool selected;

  SpeciesSearchResult(
      this.id, this.taxonGroup, this.scientificName, this.name, this.selected);

  SpeciesSearchResult.fromJson(Map json)
      : id = json['Id'],
        taxonGroup = json['TaxonGroup'],
        scientificName = json['ValidScientificName'],
        name = json['PrefferedPopularname'],
        selected = false;
}
