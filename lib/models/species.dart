class Species {
  int id;
  String taxonGroup;
  String scientificName;
  String name;

  Species(this.id, this.taxonGroup, this.scientificName, this.name);

  Species.fromJson(Map json)
      : id = json['Id'],
        taxonGroup = json['TaxonGroup'],
        scientificName = json['ValidScientificName'],
        name = json['PrefferedPopularname'];
}
