enum Sex { male, female, both }

class SpeciesObservation {
  int id;
  String taxonGroup;
  String scientificName;
  String name;
  int? number;
  String? activity;
  Sex? sex;

  SpeciesObservation(this.id, this.taxonGroup, this.scientificName, this.name);
}
