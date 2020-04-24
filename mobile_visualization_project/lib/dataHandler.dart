import 'dart:core';

class DataHandler {
  List<String> disabilities;
  // type of disability, according to province
  Map<String, List<int>> disabilitiesByProvince;
  // male population by type of disability, according to age
  Map<String, List<int>> maleDisabilitiesByAge;
  // female population by type of disability, according to age
  Map<String, List<int>> femaleDisabilitiesByAge;

  DataHandler() {
    disabilities = ["Para ver aún con los anteojos o lentes puestos","Para oir","Para hablar","Para caminar o subir gradas","Para utilizar brazos o manos","Del tipo intelectual","Del tipo mental"];
    disabilitiesByProvince = {"San Jose": [88721,23782,9169,46533,15575,11765,9981],
      "Alajuela" : [44356,14081,5738,27374,9767,6765,5381],
      "Cartago" : [22061,7074,2785,14617,5241,4288,2904],
      "Heredia" : [24916,6113,2328,12296,4115,2858,2498],
      "Guanacaste" : [19840,5722,2775,11389,3883,3053,1904],
      "Puntarenas" : [25962,7564,3492,1515,5437,3762,2345],
      "Limón" : [25608,6373,3126,13014,4841,2925,1958]};
    maleDisabilitiesByAge = {"0 a 14 años": [7241,1844,4748,2523,1228,5686,1713],
      "15 a 29 años": [13164,2705,2870,4800,2465,6587,2948],
      "30 a 59 años": [52349,10727,4633,24450,9601,5975,5888],
      "60 a 64 años":	[10085,2963,680,6209,2179,407,723],
      "65 a 74 años": [15406,7145,1336,11381,3537,638,1208],
      "75 a 89 años":[12730,9993,1923,12888,3456,574,1428],
      "90 años y más": [1638,1863,405,2020,535,101,218]};
    femaleDisabilitiesByAge = {"0 a 14 años"	: [7230,1495,2583,222,974,3885,911],
      "15 a 29 años": [17497,2278,1940,3550,1488,4808,2009],
      "30 a 59 años":	[65160,9916,3726,24469,9929,4892,5370],
      "60 a 64 años": [12289,2446,530,7581,2587,359,706],
      "65 a 74 años":	[18683,5713,1133,15329,4679,566,1268],
      "75 a 89 años":	[15638,9265,2203,19333,5132,757,2086],
      "90 años y más":	[2354,2356,703,3621,1069,181,495]};
  }
}