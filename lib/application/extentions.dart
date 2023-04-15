import 'constants.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this==null){return Constants.empty;}else{return this!;}
  }
}
extension NonNullInt on int?{
  int orZero(){
    if(this==null){return Constants.zero;}else{return this!;}
  }
}

extension NonNullDouble on double?{
  double orZero(){
    if(this==null){return 0.0;}else{return this!;}
  }
}
extension NonNullBool on bool?{
  bool orFalse(){
    if(this==null){return false;}else{return this!;}
  }
}

/* toCallIt(){
  String? name = null;
  print(name.orEmpty());
} */