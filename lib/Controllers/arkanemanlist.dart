import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/appaudios/appaudio.dart';
import 'package:deen/core/utils/appimage/app_images.dart';

class ArkanemanData {
  static String emanvideo = 'https://youtu.be/FqxXnxABr-c?si=TwrGn2beaZNfPCvO';

  static List<Mostofcategorymodel> items = [
    Mostofcategorymodel(image: Arkanemanimage.one, sound: Arkanemanaudio.one),
    Mostofcategorymodel(image: Arkanemanimage.two, sound: Arkanemanaudio.two),
    Mostofcategorymodel(
        image: Arkanemanimage.three, sound: Arkanemanaudio.three),
    Mostofcategorymodel(image: Arkanemanimage.four, sound: Arkanemanaudio.four),
    Mostofcategorymodel(image: Arkanemanimage.five, sound: Arkanemanaudio.five),
    Mostofcategorymodel(image: Arkanemanimage.six, sound: Arkanemanaudio.six),
  ];
}
