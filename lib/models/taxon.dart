class Taxon {
  int id;
  String taxonGroup;
  String scientificName;
  String popularName;

  Taxon(this.id, this.taxonGroup, this.scientificName, this.popularName);

  Taxon.fromJson(Map json)
      : id = json['Id'],
        taxonGroup = json['TaxonGroup'],
        scientificName = json['ValidScientificName'],
        popularName = json['PrefferedPopularname'];
}
