import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/appaudios/appaudio.dart';
import 'package:deen/core/utils/appimage/app_images.dart';

class ArkaneslamData {
  static String eslamvideo = 'https://youtu.be/k9dO6laLPhs?si=b-SsOp0k7fK2hzAL';

  static List<Mostofcategorymodel> items = [
    Mostofcategorymodel(image: Arkaneslamimage.one, sound: Arkaneslamaudio.one),
    Mostofcategorymodel(image: Arkaneslamimage.two, sound: Arkaneslamaudio.two),
    Mostofcategorymodel(
        image: Arkaneslamimage.three, sound: Arkaneslamaudio.three),
    Mostofcategorymodel(
        image: Arkaneslamimage.four, sound: Arkaneslamaudio.four),
    Mostofcategorymodel(
        image: Arkaneslamimage.five, sound: Arkaneslamaudio.five),
  
  ];
}
