class Taxon {
  int id;
  int parentId;
  int taxonCategory;
  int scientificNameId;
  String scientificName;
  String scientificNameAuthor;
  String popularName;
  String matchedName;
  int observationCount;
  int cumulativeObservationCount;
  List<String> popularNames;

  Taxon(
      this.id,
      this.parentId,
      this.taxonCategory,
      this.scientificName,
      this.scientificNameAuthor,
      this.cumulativeObservationCount,
      this.matchedName,
      this.observationCount,
      this.popularName,
      this.popularNames,
      this.scientificNameId);

  Taxon.fromJson(Map json)
      : id = json['Id'],
        parentId = json['ParentId'],
        taxonCategory = json['TaxonCategory'],
        scientificNameId = json['ScientificNameId'],
        scientificName = json['ScientificName'],
        scientificNameAuthor = json['ScientificNameAuthor'],
        popularName = json['PopularName'],
        matchedName = json['MatchedName'],
        observationCount = json['ObservationCount'],
        cumulativeObservationCount = json['CumulativeObservationCount'],
        popularNames = json['PopularNames'];
}
