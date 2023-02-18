import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';

class AudioManager {
  static final sfxEnabled = ValueNotifier(true);
  static final musicEnabled = ValueNotifier(true);

  static void init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      'coin.mp3',
      'hit.mp3',
      'synth.mp3',
      'never_still.mp3',
    ]);
  }

  static void playSfx(String file) {
    if (sfxEnabled.value) {
      FlameAudio.play(file, volume: 0.5);
    }
  }

  static Future<void> playMusic(String file, String file1) async {
    if (musicEnabled.value) {
      await stopMusic();
      FlameAudio.bgm.play(file, volume: 0.25);
      FlameAudio.bgm.play(file1, volume: 0.25);
    }
  }

  static Future<void> stopMusic() async {
    await FlameAudio.bgm.stop();
  }
}
