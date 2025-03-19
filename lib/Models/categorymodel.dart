import 'package:deen/core/utils/appimage/app_images.dart';

class Category {
  final String image;
  final String screen;

  Category(this.screen, {required this.image});
}

List<Category> categories = [
  Category("/ArkanEmanScreen", image: Appimage.arkanemancover),
  Category("/ArkanIslamScreen", image: Appimage.arkaneslamcover),
  Category("/DateHegryScreen", image: Appimage.datehegrycover),
  Category("/GhzawatScreen", image: Appimage.ghzawatcover),
  Category("/HadethScreen", image: Appimage.hadethcover),
  Category("/MalaekaScreen", image: Appimage.malaekacover),
  Category("/ProphetsScreen", image: Appimage.prophetscover),
  Category("/ProphetMohamedScreen", image: Appimage.prophetmohamedcover),
  Category("/ProftMohamedSonsScreen", image: Appimage.proftmohamedsonscover),
  Category("/ProphetMohamedWifesScreen",
      image: Appimage.prophetmohamedwifescover),
  Category("/WdooaScreen", image: Appimage.wdooacover),
  Category("/SalahScreen", image: Appimage.salahcover),
  Category("/TenOfGanaScreen", image: Appimage.tenofganacover),
  Category("/SadakaScreen", image: Appimage.sadakacover),
  Category("/NamesOfAllahScreen", image: Appimage.namesofallahcover),
];

List<Category> stories = [
  Category("/qurankareem", image: Storiesimage.qurankareem),
  Category("/hadethnabwy", image: Storiesimage.hadith),
  Category("/akedastories", image: Storiesimage.akedastories),
  Category("/ghzwatstories", image: Storiesimage.ghzwatstories),
  Category("/mixstories", image: Storiesimage.mixstories),
  Category("/prophetmohamedstories", image: Storiesimage.prophetmohamed),
  Category("/wemonstories", image: Storiesimage.wemonstories),
  Category("/prophetsstories", image: Storiesimage.prophetsstories),
  Category("/ayatstories", image: Storiesimage.ayatstories),
  Category("/humanstories", image: Storiesimage.humanstories),
  Category("/animalstories", image: Storiesimage.animalstories),
];
