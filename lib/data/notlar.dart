// Yolculuk notları: umre yapmış kişilerin tecrübeleri ve pratik bilgiler.
//
// Vize ve pasaport bilgileri visa.visitsaudi.com kullanım koşullarına,
// yeşil pasaport bilgisi Türkiye'nin Riyad Büyükelçiliği duyurusuna (AA,
// 3 Kasım 2026), tren kuralları sar.hhr.sa sitesine göre yazılmıştır.
// Ücretler ve kurallar değişebilir; yola çıkmadan önce kontrol edilmelidir.

import 'package:flutter/material.dart';

import '../models.dart';

const _visaLink = NoteLink(
  'Suudi e-Vize başvurusu',
  'https://visa.visitsaudi.com/',
);
const _trainTimetableLink = NoteLink(
  'Tren saatleri ve bilet',
  'https://sar.hhr.sa/timetable',
);
const _trainBaggageLink = NoteLink(
  'Trende bagaj kuralları',
  'https://sar.hhr.sa/travel/guidelines/baggage',
);
const _nusukLink = NoteLink(
  'Nusuk (umre izni, Ravza)',
  'https://www.nusuk.sa/',
);

const List<TripPhase> tripPhases = [
  TripPhase(
    id: 'once',
    title: 'Gitmeden Önce Yapılacaklar',
    tabLabel: 'Gitmeden Önce',
    icon: Icons.event_note,
    includesChecklist: true,
    sections: [
      TripNoteSection(
        title: 'Pasaport',
        icon: Icons.badge,
        items: [
          "Pasaport, Suudi Arabistan'a giriş tarihinde en az 6 ay geçerli olmalıdır (resmi şart).",
          'Sorun yaşamamak için en az 1 yıl geçerli bir pasaportla yola çıkmanız önerilir.',
          'Ülkeye vize başvurusunda kullandığınız pasaportla giriş yapmalısınız.',
        ],
      ),
      TripNoteSection(
        title: 'Vize Nasıl Alınır?',
        icon: Icons.verified_user,
        numbered: true,
        links: [_visaLink],
        items: [
          'visa.visitsaudi.com adresine girip "Apply Now" ile başvurun. Türkiye vatandaşları e-vize alabilir.',
          'Pasaport bilgileri, beyaz fonlu dijital vesikalık fotoğraf, geçerli bir e-posta adresi ve ödeme için kredi kartı hazırlayın.',
          'Ücreti kartla ödeyin. Kesin tutar (vize ücreti, sağlık sigortası ve KDV) ödeme adımında gösterilir. Farklı kaynaklarda toplam yaklaşık 100–145 USD olarak geçiyor.',
          'Onaylanan vize e-posta ile gelir. Çıktısını ve telefonda bir kopyasını yanınızda bulundurun.',
        ],
        warning: 'Vize 1 yıl geçerli ve çok girişlidir; tek seferde en fazla 3 ay kalınır ve uzatılamaz. Başvuru ücreti hiçbir durumda iade edilmez. 18 yaşından küçükler için başvuruyu veli yapar. Turistik vize sahipleri hac döneminde Mekke\'ye giremez.',
      ),
      TripNoteSection(
        title: 'Yeşil Pasaport',
        icon: Icons.book,
        items: [
          '6 Kasım 2026\'dan itibaren diplomatik ve hususi (yeşil) pasaport sahipleri Suudi Arabistan\'a vizesiz girebilir (180 günde en fazla 90 gün).',
          'Vizesiz girişte de pasaportun giriş tarihinde en az 6 ay geçerli olması gerekir.',
        ],
        warning: 'Anlaşmanın 5. maddesine göre hac ve umre amaçlı seyahatler muafiyetin kapsamı dışındadır. Umre için yeşil pasaportla da vize alınması gerekir. Yola çıkmadan önce konsolosluk veya tur şirketinizle teyit edin.',
      ),
      TripNoteSection(
        title: 'Nusuk ve Sağlık',
        icon: Icons.health_and_safety,
        links: [_nusukLink],
        items: [
          'Umre izni ve Ravza ziyareti randevusu için Nusuk uygulamasını telefonunuza yükleyin.',
          'Menenjit (ACWY) aşısını yolculuktan en az 10 gün önce yaptırın, aşı kartını yanınızda bulundurun.',
        ],
      ),
      TripNoteSection(
        title: 'Hızlı Tren Bileti',
        icon: Icons.train,
        links: [_trainTimetableLink, _trainBaggageLink],
        items: [
          'Haremeyn Hızlı Treni biletleri sar.hhr.sa sitesinden veya Haramain (HHR) mobil uygulamasından alınır. Sefer saatleri sar.hhr.sa/timetable adresinde.',
          'Medine–Mekke tek yön yaklaşık ücret: ekonomi 160–190 riyal, business 260 riyal ve üzeri. Fiyatlar tarihe ve KDV\'ye göre değişir.',
          'Kişi başı 1 büyük valiz (en fazla 25 kg ve 65×55×35 cm) ile 1 el çantası alınabilir.',
          'Kalkışa 20 dakikadan az kala bilet değiştirilemez; trene yetişemeyen yolcunun bileti yanar.',
        ],
      ),
      TripNoteSection(
        title: 'Para ve Ulaşım',
        icon: Icons.payments,
        items: [
          'Kredi kartı hemen her yerde geçiyor ve kur farkı genellikle daha uygun oluyor.',
          'Taksi için Uber uygulamasını önceden telefonunuza yükleyin.',
          'Büyük valizle yola çıkmayın: hızlı trende en büyük boy valizler kabul edilmiyor veya ek ücret isteniyor.',
        ],
      ),
    ],
  ),
  TripPhase(
    id: 'mekke',
    title: "Mekke'de Yapılacaklar",
    tabLabel: 'Mekke',
    icon: Icons.mosque,
    sections: [
      TripNoteSection(
        title: 'Mescid-i Haram Kapıları',
        icon: Icons.door_front_door,
        items: [
          'Kral Abdülaziz Kapısı\'ndan girince tavafa başlama (Hacerülesved\'i selamlama) noktasına çok yakın oluyorsunuz; buradan girmek uygundur.',
          'Çıkarken yanındaki kapıyı ya da 83, 84, 87, hatta 93 numaraya kadar olan kapıları kullanırsanız Mekke Kulesi\'ne (Saat Kulesi) yakın bir noktaya çıkarsınız.',
          'Cuma namazı için saat 09.00–09.30 arasında gidip Kral Abdülaziz Kapısı\'nın sağ tarafında yer bulursanız gölgede kalırsınız (Kasım ayı tecrübesi).',
        ],
      ),
      TripNoteSection(
        title: 'Kadınlar İçin',
        icon: Icons.woman,
        items: [
          'Mescid-i Haram\'da kadınların namaz ve oturma alanı Kral Fahd Kapısı\'nın sol tarafındadır.',
          'Kadınlar namaz vaktinden 20–30 dakika önce kadınlar bölümüne gitmelidir. Çok erken gidilirse görevliler dışarı çıkarabiliyor; bu aralıkta gidildiğinde içeride yer bulunabiliyor.',
        ],
      ),
      TripNoteSection(
        title: "Harem'e Yakın Oteller",
        icon: Icons.hotel,
        items: [
          'Hilton Suites Jabal Omar Makkah — Jabal Omar otellerinin Harem\'e en yakını; otelden çıkınca hemen Harem bölgesine giriyorsunuz.',
          'Jabal Omar Hyatt Regency Makkah',
          'Al Safwah Hotel Tower — Kral Abdülaziz Kapısı\'ndan girip hemen sağındaki kapıdan çıkınca çok yakın. Altında misvakçılar, tesbihçiler ve seccadeciler var.',
          'Makkah Hotel — biz burada kaldık, memnun kaldık.',
          'Swissôtel Al Maqam Makkah',
          'Elaf Kinda',
          'ZamZam Pullman — asansörler sıkıntılı, bekleme çok.',
        ],
      ),
      TripNoteSection(
        title: 'Alışveriş ve Ulaşım',
        icon: Icons.storefront,
        items: [
          'ZamZam girişinde uygun fiyatlı hurma ve maamul (hurmalı kurabiye) alınabilir.',
          'Şehir içinde Uber kullanılabilir. Bazı otellerin arka tarafına (ör. Makkah Hotel) Uber çağrılamayabiliyor; bu durumda taksiye binebilirsiniz.',
        ],
      ),
    ],
  ),
  TripPhase(
    id: 'medine',
    title: "Medine'de Yapılacaklar",
    tabLabel: 'Medine',
    icon: Icons.location_city,
    sections: [
      TripNoteSection(
        title: 'Ravza Ziyareti',
        icon: Icons.star,
        important: true,
        numbered: true,
        links: [_nusukLink],
        items: [
          "Ravza'ya girmek için Nusuk uygulamasından randevu alınması gerekiyor. Tarih yaklaşınca randevu Türkiye'den de alınabiliyor.",
          'Randevuyu namaz vaktinden yaklaşık 1 saat öncesine alın; böylece vakit namazını da orada kılmanız kolaylaşır.',
          'Randevu saatinden 20 dakika önce giriş yapılabiliyor. Girişte telefondaki karekodu okutup içeri giriyorsunuz.',
          "Önce içerideki bir bekleme alanında, yoğunluğa göre 10–20 dakika bekletiliyorsunuz; ardından asıl Ravza'ya geçiliyor.",
          'Girişte görevliler sağa doğru yönlendiriyor. Fırsat bulup sol tarafa geçin ve en öne doğru ilerleyin; görevlilerle olabildiğince göz göze gelmemeye çalışın.',
          'Asıl Ravza alanı en önde, sol tarafta iki sütun arasındadır.',
          'Yer bulduğunuz anda hemen namaza durun; namaz kılan kişiye görevliler dokunmuyor.',
          "Ezan vaktine 15 dakika kalaya kadar orada kalabilirseniz vakit namazını cemaatle Ravza'da kılabilirsiniz.",
          'Peygamberimiz (s.a.s.) bu alan için "Evimle minberim arası cennet bahçelerinden bir bahçedir." buyurmuştur (Buhârî, 1196; Müslim, 1391). Bu yüzden ziyaretçiler burada iki rekât namaz kılmaya özen gösterir.',
        ],
        warning: 'Ravza çok kalabalık olur. Öne geçmeye çalışırken kimseyi itip kakmadan, sakin ve edepli şekilde ilerleyin.',
      ),
      TripNoteSection(
        title: 'Mescid-i Nebevî ve Bakî',
        icon: Icons.mosque,
        items: [
          '365 numaralı kapının hemen yanında, ikindi namazından sonra Cennetü\'l-Bakî kapısı açılıyor; bu saatte ziyaret edilebilir.',
        ],
      ),
      TripNoteSection(
        title: 'Yemek',
        icon: Icons.restaurant,
        items: [
          '365 numaralı kapıdan çıkınca sol tarafta restoranlar var.',
          '3. katta Türk restoranı da dahil olmak üzere yemek yerleri bulunuyor.',
        ],
      ),
      TripNoteSection(
        title: "Hızlı Trenle Mekke'ye Geçiş",
        icon: Icons.train,
        links: [_trainTimetableLink],
        items: [
          'Hızlı tren kullanımı çok kolay. İstasyona girince üst kata çıkılıyor; burada mescit var ama ihram giyme alanı yok.',
          'Tren, kalkış saatinden yaklaşık 40 dakika önce yolcu almaya başlıyor; kalkışa 15 dakika kala yolcu alımı kapanıyor.',
          'Bagajlar trene binmeden önce güvenlik kontrolünden geçiyor.',
          'En büyük boy valizler kabul edilmiyor veya ek ücret isteniyor; kişi başı 1 büyük valiz (en fazla 25 kg) ve 1 el çantası hakkı var.',
        ],
        warning: 'Tren mikatta durmaz ve istasyonda ihram giyme alanı yoktur. İhramı otelde giyin; niyet edip telbiyeyi trene binmeden önce getirin. İhrama mikattan önce girmek caizdir.',
      ),
    ],
  ),
  TripPhase(
    id: 'donus',
    title: 'Dönüş Yolunda Yapılacaklar',
    tabLabel: 'Dönüş',
    icon: Icons.flight_land,
    sections: [
      TripNoteSection(
        title: 'Cidde Havalimanına Ulaşım',
        icon: Icons.local_taxi,
        items: [
          'Mekke\'den Cidde Havalimanı\'na araçla yaklaşık 1,5 saat sürüyor; trafik payı bırakarak erken yola çıkın.',
          'Makkah Hotel\'in arkasına Uber çağrılamadığı için taksiye bindik; Cidde Havalimanı\'na 130 riyal ödedik.',
        ],
      ),
      TripNoteSection(
        title: 'Zemzem',
        icon: Icons.water_drop,
        items: [
          'Cidde Havalimanı Terminal 1\'de C2 bölümünde zemzem alabilirsiniz; kişi başı 12,5 riyal.',
        ],
      ),
      TripNoteSection(
        title: 'Tax Free (Vergi İadesi)',
        icon: Icons.receipt_long,
        numbered: true,
        items: [
          'Tax Free uygulanan mağazalarda alışveriş yaparken vergi iadesi kaydı isteyin.',
          'Cidde Havalimanı Terminal 1\'de havalimanının en sonundaki E2 kapısına gidin; Global Blue Tax Free noktası burada.',
          'Buradaki cihazlara pasaportunuzu ve kredi kartınızı okutarak iade işlemini kendiniz yaparsınız.',
        ],
      ),
    ],
  ),
];

TripPhase tripPhaseById(String id) => tripPhases.firstWhere((p) => p.id == id);
