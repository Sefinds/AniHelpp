
class Asso {
  final int idasso;
  final String nameasso;
  final String sloganasso;
  final String logoasso;
  final String aboutasso;
  final String journeyasso;
  final String contactasso;
  final int idevent;
  final int iddonation;
  final int idnews;

  const Asso({
    required this.idasso,
    required this.nameasso,
    required this.sloganasso,
    required this.logoasso,
    required this.aboutasso,
    required this.journeyasso,
    required this.contactasso,
    required this.idevent,
    required this.iddonation,
    required this.idnews,
  });

  static Asso fromJson(json) => Asso(
    idasso: json["idasso"],
    nameasso: json["nameasso"],
    sloganasso: json["sloganasso"],
    logoasso: json["logoasso"],
    aboutasso: json["aboutasso"],
    journeyasso: json["journeyasso"],
    contactasso: json["contactasso"],
    idevent: json["idevent"],
    iddonation: json["iddonation"],
    idnews: json["idnews"],
  );
}