import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:deen/core/utils/appaudios/appaudio.dart';
import 'package:deen/core/utils/appimage/app_images.dart';

class SalahData {
  static String salahavideo =
      'https://youtu.be/DmYs7KEtxMM?si=M5M8j0V9CP-zIh7p';

  static List<Mostofcategorymodel> items = [
    Mostofcategorymodel(image: SalahImage.one, sound: Salahaudio.one),
    Mostofcategorymodel(image: SalahImage.two, sound: Salahaudio.two),
    Mostofcategorymodel(image: SalahImage.three, sound: Salahaudio.three),
    Mostofcategorymodel(image: SalahImage.four, sound: Salahaudio.four),
    Mostofcategorymodel(image: SalahImage.five, sound: Salahaudio.five),
  ];
}
