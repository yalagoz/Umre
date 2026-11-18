// Yolculuk notları: umre yapmış kişilerin tecrübeleri ve pratik bilgiler.
//
// Vize ve pasaport bilgileri visa.visitsaudi.com kullanım koşullarına,
// yeşil pasaport bilgisi Türkiye'nin Riyad Büyükelçiliği duyurusuna (AA,
// 3 Kasım 2026), tren kuralları sar.hhr.sa sitesine göre yazılmıştır.
// Ücretler ve kurallar değişebilir; yola çıkmadan önce kontrol edilmelidir.
//
// Metinler resmî bir dille ve devrik cümle kullanılmadan yazılmıştır.

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
          "Pasaportun, Suudi Arabistan'a giriş tarihi itibarıyla en az 6 ay geçerli olması gerekmektedir (resmî şart).",
          'Herhangi bir sorunla karşılaşmamak için en az 1 yıl geçerliliği bulunan bir pasaportla seyahat edilmesi önerilir.',
          'Ülkeye giriş, vize başvurusunda kullanılan pasaportla yapılmalıdır.',
        ],
      ),
      TripNoteSection(
        title: 'Vize Nasıl Alınır?',
        icon: Icons.verified_user,
        numbered: true,
        links: [_visaLink],
        items: [
          'visa.visitsaudi.com adresine girilerek "Apply Now" seçeneğiyle başvuru yapılır. Türkiye Cumhuriyeti vatandaşları e-vize alabilmektedir.',
          'Başvuru için pasaport bilgileri, beyaz fonlu dijital vesikalık fotoğraf, geçerli bir e-posta adresi ve ödeme için kredi kartı hazır bulundurulmalıdır.',
          "Ödeme kredi kartıyla yapılır. Vize ücreti, sağlık sigortası ve KDV'den oluşan kesin tutar ödeme adımında gösterilmektedir. Farklı kaynaklara göre toplam tutar yaklaşık 100–145 USD'dir.",
          'Onaylanan vize e-posta ile gönderilir. Vizenin basılı bir çıktısı ile telefonda kayıtlı bir kopyası seyahat süresince yanınızda bulunmalıdır.',
        ],
        warning: "Vize 1 yıl süreyle geçerlidir ve çok girişlidir. Her girişte en fazla 3 ay kalınabilir; bu süre uzatılamaz. Başvuru ücreti hiçbir durumda iade edilmez. 18 yaşından küçükler için başvuru veli tarafından yapılır. Turistik vize sahipleri hac döneminde Mekke'ye giremez.",
      ),
      TripNoteSection(
        title: 'Yeşil Pasaport',
        icon: Icons.book,
        items: [
          "6 Kasım 2026 tarihinden itibaren diplomatik ve hususi (yeşil) pasaport sahipleri Suudi Arabistan'a vizesiz giriş yapabilmektedir (180 gün içinde en fazla 90 gün).",
          'Vizesiz girişlerde de pasaportun giriş tarihi itibarıyla en az 6 ay geçerli olması gerekmektedir.',
        ],
        warning: 'Anlaşmanın 5. maddesi uyarınca hac ve umre amaçlı seyahatler muafiyet kapsamı dışındadır. Bu nedenle umre için yeşil pasaport sahiplerinin de vize alması gerekmektedir. Seyahatten önce bu bilginin konsolosluk veya tur şirketi aracılığıyla teyit edilmesi önerilir.',
      ),
      TripNoteSection(
        title: 'Nusuk ve Sağlık',
        icon: Icons.health_and_safety,
        links: [_nusukLink],
        items: [
          'Umre izni ve Ravza ziyareti randevusu için Nusuk uygulamasının telefona yüklenmesi gerekmektedir.',
          'Suudi Arabistan Sağlık Bakanlığı, vize türünden bağımsız olarak umre yapacak herkesin yolculuktan en az 10 gün önce menenjit (ACWY) aşısı yaptırmasını şart koşmaktadır.',
          'Uygulamada turistik vizeyle yapılan girişlerde aşı kartı her zaman kontrol edilmemektedir. Ancak kural her an uygulanabileceği için aşının yaptırılması ve aşı kartının seyahat süresince yanınızda bulundurulması önerilir.',
        ],
      ),
      TripNoteSection(
        title: 'Hızlı Tren Bileti',
        icon: Icons.train,
        links: [_trainTimetableLink, _trainBaggageLink],
        items: [
          'Haremeyn Hızlı Treni biletleri sar.hhr.sa internet sitesinden veya Haramain (HHR) mobil uygulamasından satın alınabilir. Sefer saatlerine sar.hhr.sa/timetable adresinden ulaşılabilir.',
          'Medine–Mekke arası tek yön bilet ücreti ekonomi sınıfında yaklaşık 160–190 riyal, business sınıfında ise 260 riyal ve üzeridir. Fiyatlar tarihe ve KDV oranına göre değişiklik gösterebilir.',
          'Yolcu başına 1 orta boy valiz (en fazla 25 kg ve 65×55×35 cm) ile 1 el çantası taşıma hakkı bulunmaktadır. Büyük boy valizler kabul edilmemekte veya ek ücrete tabi tutulmaktadır.',
          'Kalkışa 20 dakikadan az süre kala bilet değişikliği yapılamaz. Trene yetişemeyen yolcunun bileti geçersiz hâle gelir.',
        ],
      ),
      TripNoteSection(
        title: 'Para ve Ulaşım',
        icon: Icons.payments,
        items: [
          'Kredi kartı hemen her yerde kabul edilmektedir.',
          'Kuveyt Türk kredi kartları, yurt dışı harcamalarını kur farkı eklemeden alış ve satış kurunun ortalaması üzerinden ekstreye yansıtmaktadır. Örneğin alış kuru 13,00 TL ve satış kuru 13,50 TL olduğunda harcama 13,25 TL üzerinden hesaplanmaktadır. Bu nedenle Kuveyt Türk kartları bu konuda avantajlıdır; diğer bankaların uygulamaları ayrıca araştırılabilir.',
          'Taksi için Uber uygulamasının önceden telefona yüklenmesi önerilir.',
          'Hızlı trende büyük boy valizler kabul edilmemekte veya ek ücrete tabi tutulmaktadır. Bu nedenle orta boy valizle seyahat edilmesi önerilir.',
        ],
      ),
      TripNoteSection(
        title: 'Elektrik Prizleri',
        icon: Icons.power,
        items: [
          'Suudi Arabistan\'da çoğunlukla üç delikli İngiliz tipi (G) prizler kullanılmaktadır. Priz dönüştürücü önerilir ancak zorunlu değildir.',
          'Türkiye\'de kullanılan fişler de bu prizlere takılabilir. Bunun için prizin üst kısmındaki tekli deliğe tahta bir çubuk gibi yalıtkan bir cisim yerleştirilir; böylece priz kilidi açılır ve fiş alttaki iki deliğe takılabilir.',
        ],
        warning: 'Priz kilidini açmak için yalnızca kuru ve yalıtkan bir cisim kullanılmalıdır. Bu işlemde kesinlikle metal bir cisim kullanılmamalıdır.',
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
        title: "Harem'e Ulaşım ve Kapılar",
        icon: Icons.door_front_door,
        items: [
          "Mahbes (Mahbas Al Jinn) bölgesindeki otellerde konaklanıyorsa Harem'e otobüsle ulaşılır. Otobüsler Gazze durağına gelmekte, yolcular Peygamber Efendimizin evinin yakınında inmektedir. Buradan yürünerek Selam Kapısı'ndan Mescid-i Haram'a girmek en yakın yoldur.",
          "Harem'e yakın otellerde konaklanıyorsa Mescid-i Haram'a Kral Abdülaziz Kapısı'ndan girmek en rahat yoldur. Bu kapı, tavafın başlangıç noktası olan Hacerülesved hizasına (selamlama noktasına) da oldukça yakındır.",
          "Çıkışta Kral Abdülaziz Kapısı'nın yanındaki kapı veya 83, 84, 87 ve 93 numaraya kadar olan kapılar kullanıldığında Mekke Kulesi'ne (Saat Kulesi) yakın bir noktaya çıkılır.",
          "Cuma namazı için saat 09.00–09.30 arasında gelinip Kral Abdülaziz Kapısı'nın sağ tarafında yer bulunduğunda namaz gölgede kılınabilir (Kasım ayı tecrübesidir).",
        ],
      ),
      TripNoteSection(
        title: 'Kadınlar İçin',
        icon: Icons.woman,
        items: [
          "Mescid-i Haram'da kadınlara ayrılan namaz ve oturma alanı Kral Fahd Kapısı'nın sol tarafında yer almaktadır.",
          'Kadınların namaz vaktinden 20–30 dakika önce kadınlar bölümüne gitmeleri önerilir. Çok erken gelindiğinde görevliler alanı boşaltabilmektedir; belirtilen zaman aralığında gelindiğinde ise içeride yer bulunabilmektedir.',
        ],
      ),
      TripNoteSection(
        title: 'Kadınlar İçin Namaz Vaktinde Tavaf',
        icon: Icons.schedule,
        numbered: true,
        items: [
          'Tavafın namaz vaktine kadar tamamlanabileceği düşünülüyorsa tavafın bitirilmesi önerilir. Namaz vakti yaklaştığında görevliler kadınları mataf alanının dışına çıkarmaktadır.',
          'Tavafın namaz vaktine kadar tamamlanamayacağı düşünülüyorsa kadınlara ayrılan bir bölüme geçilerek namaz içeride kılınabilir ve namazdan sonra tavafa hemen devam edilebilir. Bunun nedeni, namaz vaktine çok yakın bir zamanda hâlâ mataf alanında bulunan kadınların görevlilerce dışarı çıkarılmasıdır. Bu durumda yeniden içeri girip tavafa devam etmek uzun zaman alabilmektedir.',
        ],
      ),
      TripNoteSection(
        title: "Harem'e Yakın Oteller",
        icon: Icons.hotel,
        items: [
          "Hilton Suites Jabal Omar Makkah — Jabal Omar otelleri arasında Harem'e en yakın olanıdır. Otelden çıkıldığında doğrudan Harem bölgesine girilmektedir.",
          'Jabal Omar Hyatt Regency Makkah',
          "Al Safwah Hotel Tower — Kral Abdülaziz Kapısı'ndan girildikten sonra hemen sağdaki kapıdan çıkıldığında otele kısa sürede ulaşılır. Otelin alt katında misvak, tesbih ve seccade satan dükkânlar bulunmaktadır.",
          'Makkah Hotel — Bu otelde konaklanmış ve hizmetinden memnun kalınmıştır.',
          'Swissôtel Al Maqam Makkah',
          'Elaf Kinda',
          'ZamZam Pullman — Asansörlerde uzun bekleme süreleri yaşanmaktadır.',
        ],
      ),
      TripNoteSection(
        title: 'Yemek',
        icon: Icons.restaurant,
        items: [
          "Konaklanan otelde yemek hizmeti bulunmuyorsa ZamZam Alışveriş Merkezi'nin 3. katındaki restoranlar tercih edilebilir.",
          'Bu katta bir Türk restoranı bulunmaktadır. Çorba 15 riyal, pide ve pizza ise 25 riyaldir.',
          'Arap yemekleri sunan restoranlar da denenebilir. İki kişilik pilav ve tavuk yaklaşık 35 riyaldir.',
          "Al Shufa Restoranı'nda açık büfe yemek 75 riyaldir.",
          "Al Baik'te hamburger ve nugget tarzı yemekler denenebilir. Yemekler lezzetlidir ancak restoran çok kalabalık olmaktadır. Kişi başı 15–30 riyal arasında yemek yenebilmektedir.",
          'Belirtilen fiyatlar tecrübeye dayanmaktadır ve zamanla değişebilir.',
        ],
        warning: 'Namazların hemen ardından alışveriş merkezi çok kalabalık olmaktadır. Bu nedenle yemek için namaz çıkışı saatleri tercih edilmemelidir.',
      ),
      TripNoteSection(
        title: 'Alışveriş ve Ulaşım',
        icon: Icons.storefront,
        items: [
          'ZamZam girişinde uygun fiyatlı hurma ve maamul (hurmalı kurabiye) satın alınabilir.',
          'Şehir içi ulaşımda Uber kullanılabilir. Bazı otellerin arka tarafına (ör. Makkah Hotel) Uber aracı çağırmak mümkün olmayabilir; bu durumda taksi tercih edilebilir.',
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
          "Ravza'ya girebilmek için Nusuk uygulaması üzerinden randevu alınması gerekmektedir. Ziyaret tarihi yaklaştığında randevu Türkiye'den de alınabilmektedir.",
          "Randevunun namaz vaktinden yaklaşık 1 saat önceye alınması önerilir. Bu sayede vakit namazının da Ravza'da kılınması kolaylaşır.",
          'Randevu saatinden 20 dakika önce girişe izin verilmektedir. Girişte telefondaki karekod okutulur.',
          'Ziyaretçiler önce bir bekleme alanına alınır ve yoğunluğa bağlı olarak 10–20 dakika bekletilir. Ardından asıl Ravza alanına geçilir.',
          'Girişte görevliler ziyaretçileri sağ tarafa yönlendirmektedir. Uygun bir fırsatta sol tarafa geçilerek öne doğru ilerlenmesi önerilir. Bu sırada görevlilerle göz teması kurmamaya özen gösterilmelidir.',
          'Asıl Ravza alanı en önde, sol tarafta, iki sütun arasında yer almaktadır.',
          'Yer bulunduğu anda hemen namaza durulmalıdır. Görevliler namaz kılan kişilere müdahale etmemektedir.',
          "Ezan vaktine 15 dakika kalana kadar Ravza'da kalınabilirse vakit namazı burada cemaatle kılınabilir.",
          'Peygamber Efendimiz (s.a.s.) bu alan hakkında "Evimle minberim arası cennet bahçelerinden bir bahçedir." buyurmuştur (Buhârî, 1196; Müslim, 1391). Bu nedenle ziyaretçiler burada iki rekât namaz kılmaya özen gösterir.',
        ],
        warning: "Ravza'da yoğun bir kalabalık oluşmaktadır. Öne ilerlerken kimseyi itmeden, sakin ve edepli bir şekilde hareket edilmelidir.",
      ),
      TripNoteSection(
        title: 'Mescid-i Nebevî ve Bakî',
        icon: Icons.mosque,
        items: [
          "Cennetü'l-Bakî Kapısı, 365 numaralı kapının hemen yanında yer almaktadır ve ikindi namazından sonra ziyarete açılmaktadır.",
        ],
      ),
      TripNoteSection(
        title: 'Yemek',
        icon: Icons.restaurant,
        items: [
          '365 numaralı kapıdan çıkıldığında sol tarafta restoranlar bulunmaktadır.',
          '3. katta bir Türk restoranı da dahil olmak üzere çeşitli restoranlar bulunmaktadır.',
        ],
      ),
      TripNoteSection(
        title: "Hızlı Trenle Mekke'ye Geçiş",
        icon: Icons.train,
        links: [_trainTimetableLink],
        items: [
          'Hızlı trenin kullanımı oldukça kolaydır. İstasyona girildikten sonra üst kata çıkılır. Bu katta mescit bulunmakla birlikte ihram giyme alanı bulunmamaktadır.',
          'Trene yolcu kabulü kalkış saatinden yaklaşık 40 dakika önce başlar ve kalkışa 15 dakika kala sona erer.',
          'Bagajlar trene binilmeden önce güvenlik kontrolünden geçirilir.',
          'Büyük boy valizler kabul edilmemekte veya ek ücrete tabi tutulmaktadır. Yolcu başına 1 orta boy valiz (en fazla 25 kg) ve 1 el çantası taşıma hakkı bulunmaktadır.',
        ],
        warning: 'Tren mikat sınırında durmamaktadır ve istasyonda ihram giyme alanı bulunmamaktadır. Bu nedenle ihram otelde giyilmeli, niyet edilip telbiye trene binilmeden önce getirilmelidir. Mikata gelmeden önce ihrama girmek caizdir.',
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
          "Mekke'den Cidde Havalimanı'na karayoluyla ulaşım yaklaşık 1,5 saat sürmektedir. Trafik yoğunluğu göz önünde bulundurularak erken yola çıkılması önerilir.",
          "Makkah Hotel'in arka tarafına Uber çağrılamadığından taksi kullanılmış ve Cidde Havalimanı'na kadar 130 riyal ödenmiştir.",
        ],
      ),
      TripNoteSection(
        title: 'Zemzem',
        icon: Icons.water_drop,
        items: [
          "Cidde Havalimanı Terminal 1'deki C2 bölümünden kişi başı 12,5 riyal karşılığında zemzem satın alınabilir.",
        ],
      ),
      TripNoteSection(
        title: 'Tax Free (Vergi İadesi)',
        icon: Icons.receipt_long,
        numbered: true,
        items: [
          'Tax Free uygulaması bulunan mağazalarda alışveriş sırasında vergi iadesi kaydı talep edilmelidir.',
          "Cidde Havalimanı Terminal 1'de, havalimanının en sonunda yer alan E2 kapısına gidilir. Global Blue Tax Free noktası bu bölümde bulunmaktadır.",
          'Buradaki cihazlara pasaport ve kredi kartı okutularak iade işlemi yolcu tarafından yapılır.',
        ],
      ),
    ],
  ),
];

TripPhase tripPhaseById(String id) => tripPhases.firstWhere((p) => p.id == id);
