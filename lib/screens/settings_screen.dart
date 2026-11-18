import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme.dart';

const appVersion = '1.1.2';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final theme = Theme.of(context);

    Widget header(String text) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
      child: Text(
        text,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          header('Görünüm'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.brightness_auto),
                  label: Text('Sistem'),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(Icons.light_mode),
                  label: Text('Açık'),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: Icon(Icons.dark_mode),
                  label: Text('Koyu'),
                ),
              ],
              selected: {state.themeMode},
              onSelectionChanged: (s) => state.themeMode = s.first,
            ),
          ),
          const _TextSizeControl(),
          header('Dua Gösterimi'),
          SwitchListTile(
            title: const Text('Arapça metin'),
            value: state.showArabic,
            onChanged: (v) => state.showArabic = v,
          ),
          SwitchListTile(
            title: const Text('Okunuşu (Latin harfleriyle)'),
            value: state.showOkunus,
            onChanged: (v) => state.showOkunus = v,
          ),
          SwitchListTile(
            title: const Text('Türkçe anlamı'),
            value: state.showAnlam,
            onChanged: (v) => state.showAnlam = v,
          ),
          header('Hakkında'),
          ListTile(
            leading: const Icon(Icons.source_outlined),
            title: const Text('Kaynaklar'),
            onTap: () => _showSources(context),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Lisanslar'),
            onTap: () => showLicensePage(
              context: context,
              applicationName: 'Umre Rehberi',
              applicationVersion: appVersion,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sürüm'),
            subtitle: Text(appVersion),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Bu uygulama bilgilendirme amaçlıdır ve internet bağlantısı olmadan çalışır. '
              'Fıkhi konularda tereddüt ettiğinizde kafile din görevlinize danışınız.',
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  void _showSources(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kaynaklar'),
        content: const SingleChildScrollView(
          child: Text(
            '• T.C. Diyanet İşleri Başkanlığı, Hac ve Umre Duaları (hacumreegitim.hac.gov.tr)\n'
            '• TDV İslâm Ansiklopedisi, "Umre" maddesi\n'
            '• Kur\'ân-ı Kerîm\n'
            '• Sahîh-i Buhârî, Sahîh-i Müslim, Sünen-i Ebû Dâvûd, Sünen-i İbn Mâce, Sünen-i Tirmizî\n'
            '• Suudi e-Vize portalı (visa.visitsaudi.com) ve Haremeyn Hızlı Treni (sar.hhr.sa)\n\n'
            'Arapça metinler bu kaynaklarla karşılaştırılarak hazırlanmıştır. '
            'Hükümler Hanefî mezhebine göre özetlenmiştir.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }
}

class _TextSizeControl extends StatelessWidget {
  const _TextSizeControl();

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Yazı boyutu (%${(state.textScale * 100).round()})'),
          Row(
            children: [
              const Icon(Icons.text_decrease, size: 20),
              Expanded(
                child: Slider(
                  value: state.textScale,
                  min: AppState.minTextScale,
                  max: AppState.maxTextScale,
                  divisions: 15,
                  onChanged: (v) => state.textScale = v,
                ),
              ),
              const Icon(Icons.text_increase, size: 20),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  'لَبَّيْكَ اللّٰهُمَّ لَبَّيْكَ',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: arabicFontFamily,
                    fontSize: 27 * state.textScale,
                    height: 1.9,
                  ),
                ),
                Text(
                  'Lebbeyk, Allâhümme lebbeyk.',
                  style: TextStyle(
                    fontSize: 17 * state.textScale,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Dua ekranından hızlıca yazı boyutunu değiştirmek için alt sayfa.
void showTextSizeSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (_) => const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: _TextSizeControl(),
      ),
    ),
  );
}
