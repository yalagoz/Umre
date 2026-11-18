# Umre Rehberi

Umre ibadeti için basit ve kullanışlı bir **Android ve iOS** uygulaması. Flutter ile tek kod tabanından geliştirilmiştir ve **internet bağlantısı olmadan** çalışır. Mekke ve Medine'de veri bağlantısı olmasa da tüm içerik telefonunuzda hazırdır.

## Android'e kurulum

<img src="docs/apk-karekod.png" width="200" alt="Umre Rehberi APK indirme karekodu">

Telefonunuzun kamerasıyla karekodu okutun veya [bu bağlantıya](https://github.com/yalagoz/Umre/releases/latest/download/umre-rehberi.apk) dokunun. Karekod her zaman en son sürümün APK dosyasını indirir.

1. İndirilen `umre-rehberi.apk` dosyasını açın.
2. Android "bilinmeyen uygulamaları yükleme" izni isterse dosyayı açtığınız uygulamaya (Chrome veya Dosyalarım) bu izni verin.
3. **Yükle** düğmesine dokunun.

Sürüm 1.1.2 ve sonraki sürümler eski sürümün üzerine kurulur; notlarınız ve ayarlarınız korunur. Telefonunuzda 1.1.1 veya daha eski bir sürüm varsa önce onu kaldırmanız gerekir.

## Özellikler

- **Adım adım umre rehberi**: Umrenin esaslarından ihrama, tavaftan sa'ye, tıraştan Medine ziyaretine kadar 15 bölüm. Kadınlara özel notlar ve sık yapılan hatalar da bu bölümler arasında.
- **Umre duaları**: 8 kategoride 31 dua ve zikir. Her duada Arapça metin (harekeli), Latin harfleriyle okunuş, Türkçe anlam, ne zaman okunacağı ve kaynağı yer alır.
  - Arama (Türkçe karakter ve şapka duyarsız): "zemzem", "telbiye", "say" gibi.
  - Favorilere ekleme ve panoya kopyalama
  - Kaydırarak bir sonraki duaya geçiş
- **Tavaf ve sa'y sayacı**: 7 şavtlık halka, titreşimli geri bildirim, geri alma. Sayaç her şavtta yapılacakları gösterir: remel, Safa → Merve yönü, hervele. Uygulama kapansa bile sayı korunur.
- **Hazırlık listesi**: Evrak, ihram, sağlık, elektronik ve ibadet eşyaları için işaretlenebilir kontrol listesi.
- **Umre notları**: Umre yapmış kişilerin tecrübeleri dört bölümde toplanır: Gitmeden Önce (pasaport, vize, yeşil pasaport, Nusuk, tren bileti, para, elektrik prizleri), Mekke (Harem'e ulaşım ve kapılar, kadınlar için bilgiler, Harem'e yakın oteller, yemek), Medine (Bakî, yemek, hızlı tren) ve Dönüş (havalimanı, zemzem, Tax Free).
  - Her bölüme kendi notlarınızı ekleyip düzenleyebilir, tek tek paylaşabilirsiniz.
  - Her bölüm veya tüm notlar **PDF** olarak indirilebilir, paylaşılabilir ya da yazdırılabilir. PDF'e kişisel notlarınız da eklenir; "Gitmeden Önce" PDF'i hazırlık listesini de içerir.
- **Ayarlar**: Yazı boyutu, açık/koyu tema, Arapça, okunuş ve anlam metinlerini ayrı ayrı gösterme veya gizleme.

## Ekranlar

| Sekme | İçerik |
|---|---|
| Rehber | Umrenin 4 adımı (İhram → Tavaf → Sa'y → Tıraş) ve 15 bölümlük rehber |
| Dualar | Kategorilere ayrılmış dualar, arama ve favoriler |
| Sayaç | Tavaf ve sa'y şavt sayacı |
| Hazırlık | Yolculuk kontrol listesi |
| Notlar | Gitmeden Önce, Mekke, Medine ve Dönüş notları; kişisel notlar ve PDF |

## İçerik ve Kaynaklar

Arapça dua metinleri aşağıdaki kaynaklarla karşılaştırılarak hazırlanmıştır:

- T.C. Diyanet İşleri Başkanlığı, [Hac ve Umre Duaları](https://hacumreegitim.hac.gov.tr/dualar)
- Kur'ân-ı Kerîm; Buhârî, Müslim, Ebû Dâvûd, Tirmizî ve İbn Mâce'nin hadis külliyatları
- TDV İslâm Ansiklopedisi, [Umre](https://islamansiklopedisi.org.tr/umre) maddesi

Notlardaki vize bilgileri [Suudi e-Vize portalının](https://visa.visitsaudi.com/) kullanım koşullarına, tren bilgileri [Haremeyn Hızlı Treni](https://sar.hhr.sa/) bagaj ve bilet kurallarına dayanır. Ücretler ve kurallar zamanla değişebilir; yola çıkmadan önce resmi sitelerden kontrol ediniz.

Fıkhi hükümler Hanefî mezhebine göre özetlenmiştir. Uygulama bilgilendirme amaçlıdır; tereddüt halinde kafile din görevlinize danışınız.

Arapça metinler için [Amiri](https://github.com/aliftype/amiri), PDF'ler için [Noto Sans](https://github.com/notofonts/latin-greek-cyrillic) yazı tipi kullanılmıştır (SIL Open Font License 1.1).

## Kurulum dosyalarını indirme

`main` dalına yapılan her gönderimde GitHub Actions uygulamayı otomatik olarak derler. Derlenen dosyalar ilgili çalıştırmanın **Artifacts** bölümünden indirilebilir:

- `umre-rehberi-android` → **APK**, Android telefona doğrudan kurulabilir.
- `umre-rehberi-ios` → **imzasız IPA**. iPhone'a kurmak için Apple geliştirici hesabıyla imzalanması veya AltStore/Sideloadly gibi bir araç kullanılması gerekir.

`v1.0.0` gibi bir etiket (tag) gönderildiğinde bu dosyalar otomatik olarak bir **GitHub Release**'e eklenir:

```bash
git tag v1.0.0
git push origin v1.0.0
```

> Not: Sürüm APK'ları kalıcı bir imza anahtarıyla imzalanır; bu sayede yeni sürümler eski sürümün üzerine kurulabilir. Anahtar, depo ayarlarındaki `ANDROID_KEYSTORE_BASE64` ve `ANDROID_KEYSTORE_PASSWORD` gizli değişkenlerinden okunur. Bu değişkenler tanımlı değilse `main` derlemeleri geçici bir hata ayıklama anahtarıyla imzalanır, sürüm etiketi derlemeleri ise durdurulur.

## Geliştirme

Gereksinimler: [Flutter](https://docs.flutter.dev/get-started/install) 3.47 veya üzeri. Android derlemesi için Android Studio ve JDK 17, iOS derlemesi için macOS ve Xcode gerekir.

```bash
flutter pub get
flutter run            # bağlı cihazda veya emülatörde çalıştırır
flutter test           # testleri çalıştırır
flutter build apk      # Android APK
flutter build ios      # iOS (macOS gerekir)
```

### Proje yapısı

```
lib/
├── main.dart                 Uygulama girişi ve tema
├── models.dart               Dua, rehber adımı ve liste modelleri
├── data/
│   ├── dualar.dart           Dua metinleri ve kategoriler
│   ├── rehber.dart           Adım adım umre rehberi
│   ├── notlar.dart           Gitmeden Önce / Mekke / Medine / Dönüş notları
│   └── hazirlik.dart         Hazırlık listesi
├── services/pdf_export.dart  Notları PDF'e dönüştürme
├── state/app_state.dart      Ayarlar, favoriler, sayaç, kişisel notlar (cihazda saklanır)
├── screens/                  Ekranlar
└── widgets/                  Ortak bileşenler
```

Dua eklemek veya düzeltmek için `lib/data/dualar.dart`, rehberi güncellemek için `lib/data/rehber.dart`, hazır notları güncellemek için `lib/data/notlar.dart` dosyasını düzenlemeniz yeterlidir.
