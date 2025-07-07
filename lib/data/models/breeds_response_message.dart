import 'package:json_annotation/json_annotation.dart';

part 'breeds_response_message.g.dart';

@JsonSerializable()
class BreedsResponseMessage {
  List<String>? affenpinscher;
  List<String>? african;
  List<String>? airedale;
  List<String>? akita;
  List<String>? appenzeller;
  List<String>? australian;
  List<String>? bakharwal;
  List<String>? basenji;
  List<String>? beagle;
  List<String>? bluetick;
  List<String>? borzoi;
  List<String>? bouvier;
  List<String>? boxer;
  List<String>? brabancon;
  List<String>? briard;
  List<String>? buhund;
  List<String>? bulldog;
  List<String>? bullterrier;
  List<String>? cattledog;
  List<String>? cavapoo;
  List<String>? chihuahua;
  List<String>? chippiparai;
  List<String>? chow;
  List<String>? clumber;
  List<String>? cockapoo;
  List<String>? collie;
  List<String>? coonhound;
  List<String>? corgi;
  List<String>? cotondetulear;
  List<String>? dachshund;
  List<String>? dalmatian;
  List<String>? dane;
  List<String>? danish;
  List<String>? deerhound;
  List<String>? dhole;
  List<String>? dingo;
  List<String>? doberman;
  List<String>? elkhound;
  List<String>? entlebucher;
  List<String>? eskimo;
  List<String>? finnish;
  List<String>? frise;
  List<String>? gaddi;
  List<String>? germanshepherd;
  List<String>? greyhound;
  List<String>? groenendael;
  List<String>? havanese;
  List<String>? hound;
  List<String>? husky;
  List<String>? keeshond;
  List<String>? kelpie;
  List<String>? kombai;
  List<String>? komondor;
  List<String>? kuvasz;
  List<String>? labradoodle;
  List<String>? labrador;
  List<String>? leonberg;
  List<String>? lhasa;
  List<String>? malamute;
  List<String>? malinois;
  List<String>? maltese;
  List<String>? mastiff;
  List<String>? mexicanhairless;
  List<String>? mix;
  List<String>? mountain;
  List<String>? mudhol;
  List<String>? newfoundland;
  List<String>? otterhound;
  List<String>? ovcharka;
  List<String>? papillon;
  List<String>? pariah;
  List<String>? pekinese;
  List<String>? pembroke;
  List<String>? pinscher;
  List<String>? pitbull;
  List<String>? pointer;
  List<String>? pomeranian;
  List<String>? poodle;
  List<String>? pug;
  List<String>? puggle;
  List<String>? pyrenees;
  List<String>? rajapalayam;
  List<String>? redbone;
  List<String>? retriever;
  List<String>? ridgeback;
  List<String>? rottweiler;
  List<String>? saluki;
  List<String>? samoyed;
  List<String>? schipperke;
  List<String>? schnauzer;
  List<String>? segugio;
  List<String>? setter;
  List<String>? sharpei;
  List<String>? sheepdog;
  List<String>? shiba;
  List<String>? shihtzu;
  List<String>? spaniel;
  List<String>? spitz;
  List<String>? springer;
  List<String>? stbernard;
  List<String>? terrier;
  List<String>? tervuren;
  List<String>? vizsla;
  List<String>? waterdog;
  List<String>? weimaraner;
  List<String>? whippet;
  List<String>? wolfhound;

  BreedsResponseMessage(
    this.affenpinscher,
    this.african,
    this.airedale,
    this.akita,
    this.appenzeller,
    this.australian,
    this.bakharwal,
    this.basenji,
    this.beagle,
    this.bluetick,
    this.borzoi,
    this.bouvier,
    this.boxer,
    this.brabancon,
    this.briard,
    this.buhund,
    this.bulldog,
    this.bullterrier,
    this.cattledog,
    this.cavapoo,
    this.chihuahua,
    this.chippiparai,
    this.chow,
    this.clumber,
    this.cockapoo,
    this.collie,
    this.coonhound,
    this.corgi,
    this.cotondetulear,
    this.dachshund,
    this.dalmatian,
    this.dane,
    this.danish,
    this.deerhound,
    this.dhole,
    this.dingo,
    this.doberman,
    this.elkhound,
    this.entlebucher,
    this.eskimo,
    this.finnish,
    this.frise,
    this.gaddi,
    this.germanshepherd,
    this.greyhound,
    this.groenendael,
    this.havanese,
    this.hound,
    this.husky,
    this.keeshond,
    this.kelpie,
    this.kombai,
    this.komondor,
    this.kuvasz,
    this.labradoodle,
    this.labrador,
    this.leonberg,
    this.lhasa,
    this.malamute,
    this.malinois,
    this.maltese,
    this.mastiff,
    this.mexicanhairless,
    this.mix,
    this.mountain,
    this.mudhol,
    this.newfoundland,
    this.otterhound,
    this.ovcharka,
    this.papillon,
    this.pariah,
    this.pekinese,
    this.pembroke,
    this.pinscher,
    this.pitbull,
    this.pointer,
    this.pomeranian,
    this.poodle,
    this.pug,
    this.puggle,
    this.pyrenees,
    this.rajapalayam,
    this.redbone,
    this.retriever,
    this.ridgeback,
    this.rottweiler,
    this.saluki,
    this.samoyed,
    this.schipperke,
    this.schnauzer,
    this.segugio,
    this.setter,
    this.sharpei,
    this.sheepdog,
    this.shiba,
    this.shihtzu,
    this.spaniel,
    this.spitz,
    this.springer,
    this.stbernard,
    this.terrier,
    this.tervuren,
    this.vizsla,
    this.waterdog,
    this.weimaraner,
    this.whippet,
    this.wolfhound,
  );

  factory BreedsResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$BreedsResponseMessageFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsResponseMessageToJson(this);
}
