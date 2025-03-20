import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioPlayer _audioPlayer = AudioPlayer(); // Global player

  static Future<void> playSound(String soundPath) async {
    await _audioPlayer.stop(); // Stop any currently playing sound
    await _audioPlayer.play(AssetSource(soundPath));
  }

  static Future<void> stopSound() async {
    await _audioPlayer.stop(); // Stop when switching screens
  }

  static Future<void> pauseSound() async {
    await _audioPlayer.pause(); // Pause instead of stopping (faster)
  }

  static void dispose() {
    _audioPlayer.dispose();
  }
}
