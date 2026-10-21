// Adım adım umre rehberi.
//
// Hükümler Hanefî mezhebine ve Diyanet İşleri Başkanlığı yayınlarına göre
// özetlenmiştir. Tereddüt halinde kafile din görevlisine danışılmalıdır.

import 'package:flutter/material.dart';

import '../models.dart';

const List<GuideStep> guideSteps = [
  GuideStep(
    id: 'umre_nedir',
    title: "Umre Nedir?",
    summary: "Umrenin farzları, vacipleri ve zamanı",
    icon: Icons.info_outline,
    blocks: [
      GuideParagraph(
        "Umre; mikatta ihrama girip Kâbe'yi tavaf etmek, Safa ile Merve arasında sa'y yapmak ve tıraş olarak ihramdan çıkmaktan ibaret bir ibadettir. Hanefî mezhebine göre ömürde bir defa umre yapmak müekked sünnettir.",
      ),
      GuideBullets([
        "İhram — umrenin şartıdır.",
        "Tavaf — umrenin rüknüdür (farzıdır).",
        "Sa'y — vaciptir.",
        "Tıraş veya saç kısaltma — vaciptir.",
      ], title: "Umrenin Esasları"),
      GuideParagraph(
        "Umre yılın her zamanı yapılabilir. Ramazan ayında yapılan umrenin sevabı daha fazladır. Hanefîlere göre arefe günü ve Kurban Bayramı'nın dört gününde umre yapmak tahrîmen mekruhtur.",
      ),
      GuideCallout(
        "Umrenin dört temel adımı: İhram → Tavaf → Sa'y → Tıraş. Bu uygulamadaki rehberi sırasıyla takip edebilirsiniz.",
      ),
    ],
  ),
  GuideStep(
    id: 'hazirlik',
    title: "Yolculuk Öncesi Hazırlık",
    summary: "Evrak, sağlık ve manevi hazırlık",
    icon: Icons.luggage,
    duaIds: ['evden_cikarken', 'araca_binerken'],
    blocks: [
      GuideBullets([
        "Pasaportunuzun en az 6 ay geçerli olduğundan emin olun.",
        "Umre vizesi, uçak bileti ve tur belgelerinizi kontrol edin.",
        "Gerekli aşıları (ör. menenjit) ve sağlık kontrolünü yaptırın. Güncel şartları tur şirketinizden öğrenin.",
        "Düzenli kullandığınız ilaçları reçeteleriyle birlikte yanınıza alın.",
      ], title: "Evrak ve Sağlık"),
      GuideBullets([
        "Samimi bir niyet ve tövbe ile yola çıkın.",
        "Kul haklarını gözetin, varsa borçlarınızı ödeyin, yakınlarınızla helalleşin.",
        "Umrenin yapılışını ve duaları yolculuktan önce öğrenin.",
        "Dua etmek istediğiniz kişilerin ve selam iletilecek olanların listesini hazırlayın.",
      ], title: "Manevi Hazırlık"),
      GuideCallout(
        "Uygulamadaki \"Hazırlık\" sekmesinde yanınıza almanız gerekenleri işaretleyebileceğiniz bir kontrol listesi bulunur.",
      ),
    ],
  ),
  GuideStep(
    id: 'ihram_hazirlik',
    title: "İhrama Hazırlık",
    summary: "Temizlik, gusül ve ihram kıyafeti",
    icon: Icons.checkroom,
    blocks: [
      GuideBullets(
        [
          "Tırnaklar kesilir, koltuk altı ve kasık temizliği yapılır; erkekler saç, sakal ve bıyık bakımını yapar.",
          "Mümkünse gusül (boy abdesti) alınır; değilse abdest alınır.",
          "İhrama girmeden önce bedene güzel koku sürmek sünnettir. İhram örtülerine koku sürülmez.",
        ],
        title: "Temizlik",
        numbered: true,
      ),
      GuideBullets([
        "Erkekler dikişsiz iki parça beyaz örtüye bürünür: belden aşağıya \"izâr\", omuzlara \"ridâ\".",
        "Ayağa, topuk ve ayak üstündeki kemik açıkta kalacak şekilde terlik veya sandalet giyilir.",
        "Kadınlar tesettüre uygun normal kıyafetleriyle ihrama girer; yüz ve eller açık kalır.",
        "Bel çantası veya kemer takılabilir.",
      ], title: "İhram Kıyafeti"),
      GuideCallout(
        "İhram örtülerini giymek tek başına ihrama girmek değildir. İhrama, niyet edip telbiye getirerek girilir.",
      ),
    ],
  ),
  GuideStep(
    id: 'mikat',
    title: "Mikat ve İhrama Giriş",
    summary: "İhram namazı, niyet ve telbiye",
    icon: Icons.place,
    duaIds: ['ihram_namazi_niyeti', 'umre_niyeti', 'telbiye'],
    blocks: [
      GuideParagraph(
        "Mikat, Mekke'ye gelenlerin ihramsız geçemeyeceği sınırdır. Mekke'ye hangi yönden geliniyorsa o yöndeki mikatta veya hizasında ihrama girilir.",
      ),
      GuideBullets([
        "Zülhuleyfe (Ebyâr-ı Ali) — Medine yönünden gelenler",
        "Cuhfe (Râbiğ) — Türkiye, Suriye ve Mısır yönünden gelenler",
        "Karnü'l-Menâzil (Seylü'l-Kebîr) — Necid ve Tâif yönünden gelenler",
        "Yelemlem — Yemen yönünden gelenler",
        "Zâtü Irk — Irak yönünden gelenler",
      ], title: "Mikat Yerleri"),
      GuideParagraph(
        "Türkiye'den uçakla doğrudan Cidde'ye gidenler, uçak mikat hizasına gelmeden ihrama girer (genellikle ihram havalimanında giyilir, niyet uçakta duyuru yapılınca edilir). Önce Medine'ye gidenler, Mekke'ye giderken Zülhuleyfe'de (Ebyâr-ı Ali Mescidi) ihrama girer.",
      ),
      GuideBullets(
        [
          "Kerahat vakti değilse iki rekât ihram namazı kılınır.",
          "Umre için niyet edilir.",
          "Hemen ardından telbiye getirilir.",
        ],
        title: "İhrama Giriş",
        numbered: true,
      ),
      GuideCallout(
        "Mikatı ihramsız geçmek ceza (dem) gerektirir. Uçakta ihrama girme duyurusunu kaçırmamaya dikkat edin.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'yasaklar',
    title: "İhram Yasakları",
    summary: "İhramlı iken yapılmayacaklar",
    icon: Icons.block,
    blocks: [
      GuideBullets([
        "Dikişli elbise, iç çamaşırı, çorap giymek",
        "Başı ve yüzü örtmek",
        "Ayak üstündeki kemiği örten ayakkabı giymek",
      ], title: "Erkekler İçin"),
      GuideBullets([
        "Yüzü örtmek (peçe takmak)",
        "Eldiven giymek",
      ], title: "Kadınlar İçin"),
      GuideBullets([
        "Koku sürmek, kokulu sabun, şampuan veya ıslak mendil kullanmak",
        "Saç, sakal veya vücuttan kıl koparmak ya da kesmek",
        "Tırnak kesmek",
        "Kara hayvanlarını avlamak, Harem bölgesinde ağaç ve bitki koparmak",
        "Cinsel ilişki ve buna götüren davranışlar",
        "Tartışmak, kavga etmek, kötü söz söylemek",
      ], title: "Herkes İçin"),
      GuideBullets([
        "Kokusuz sabunla yıkanmak, ihram örtülerini değiştirmek",
        "Saat, gözlük, yüzük, bel çantası kullanmak",
        "Şemsiye ile gölgelenmek",
      ], title: "Serbest Olanlar"),
      GuideCallout(
        "Yasaklardan biri yapıldığında, türüne göre dem (kurban) veya sadaka gerekebilir. Böyle bir durumda kafile din görevlinize danışın.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'mekke',
    title: "Mekke ve Mescid-i Haram",
    summary: "Mescide giriş ve Kâbe'yi görünce",
    icon: Icons.mosque,
    duaIds: ['mescide_girerken', 'kabeyi_gorunce', 'tekbir', 'tehlil'],
    blocks: [
      GuideParagraph(
        "Mekke'ye varınca otele yerleşip kısa bir dinlenmenin ardından abdestli olarak telbiye getirerek Mescid-i Haram'a gidilir. Mescide sağ ayakla ve mescide giriş duası okunarak girilir.",
      ),
      GuideParagraph(
        "Kâbe ilk görüldüğünde tekbir ve tehlil getirilir, Kâbe'yi görünce okunacak dua ve kişinin kendi duaları yapılır.",
      ),
      GuideCallout(
        "Kaybolmamak için girdiğiniz kapının adını ve numarasını not edin, grubunuzla bir buluşma noktası belirleyin.",
      ),
    ],
  ),
  GuideStep(
    id: 'tavaf',
    title: "Umre Tavafı",
    summary: "Kâbe'nin etrafında 7 şavt",
    icon: Icons.sync,
    counterMode: CounterMode.tavaf,
    duaIds: [
      'tavaf_niyeti',
      'tavafa_baslarken',
      'hacerulesved_tekbir',
      'rabbena_atina',
    ],
    blocks: [
      GuideParagraph(
        "Tavaf abdestli olarak yapılır. Erkekler tavaftan önce ıztıba yapar: ridânın ortası sağ koltuk altından geçirilip iki ucu sol omuz üzerine atılır, sağ omuz açık kalır.",
      ),
      GuideBullets(
        [
          "Hacerülesved hizasına (yeşil ışık bulunan yere) gelinir, Kâbe sol tarafta kalacak şekilde durulur ve tavafa niyet edilir.",
          "Hacerülesved'e dönülür, eller kaldırılarak \"Bismillâhi Allâhu ekber\" denir ve selamlanır (istilam). Telbiye kesilir.",
          "Kâbe sol tarafta kalacak şekilde, Hatîm'in (Hicr-i İsmâil) dışından yürünür.",
          "Erkekler ilk üç şavtta remel yapar: omuzlar silkelenerek kısa adımlarla, çalımlı ve hızlı yürünür.",
          "Rükn-i Yemânî köşesine gelince mümkünse el ile dokunulur; kalabalıksa dokunmadan geçilir.",
          "Rükn-i Yemânî ile Hacerülesved arasında \"Rabbenâ âtinâ...\" duası okunur.",
          "Hacerülesved hizasına her gelişte bir şavt tamamlanır ve yeniden istilam yapılır.",
          "Yedi şavt tamamlanınca sekizinci istilam ile tavaf bitirilir.",
        ],
        title: "Tavafın Yapılışı",
        numbered: true,
      ),
      GuideParagraph(
        "Tavaf boyunca belirli bir duanın okunması şart değildir. Tekbir, tehlil, salavat, Kur'an ve kişinin kendi diliyle yaptığı dualar okunabilir.",
      ),
      GuideCallout(
        "Şavt sayısında şüpheye düşerseniz az olan sayıyı esas alın. Hatîm'in içinden geçilen şavt geçersizdir. Sayımı kolaylaştırmak için \"Sayaç\" sekmesini kullanabilirsiniz.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'tavaf_sonrasi',
    title: "Tavaf Namazı ve Zemzem",
    summary: "İki rekât namaz, Mültezem ve Zemzem",
    icon: Icons.water_drop,
    duaIds: ['tavaf_namazi_niyeti', 'multezem', 'zemzem', 'rabbena_tekabbel'],
    blocks: [
      GuideBullets([
        "Erkekler ıztıbayı bırakır, sağ omuz örtülür.",
        "Mümkünse Makam-ı İbrahim'in arkasında, değilse Mescid-i Haram'ın uygun bir yerinde iki rekât tavaf namazı kılınır (vaciptir). Birinci rekâtta Kâfirûn, ikincide İhlâs okunur.",
        "Namazdan sonra dua edilir.",
        "İmkân varsa Mültezem'de (Kâbe kapısı ile Hacerülesved arası) dua edilir; kalabalıkta uzaktan yönelmek yeterlidir.",
        "Kıbleye dönülerek, besmeleyle ve dua ederek doyasıya zemzem içilir.",
      ], numbered: true),
      GuideCallout(
        "Kerahat vaktinde tavaf namazı kılınmaz; vaktin çıkması beklenir.",
      ),
    ],
  ),
  GuideStep(
    id: 'say',
    title: "Sa'y",
    summary: "Safa ile Merve arasında 7 şavt",
    icon: Icons.swap_vert,
    counterMode: CounterMode.say,
    duaIds: ['say_niyeti', 'safaya_yaklasirken', 'safa_merve', 'yesil_isiklar'],
    blocks: [
      GuideBullets(
        [
          "Mümkünse Hacerülesved bir kez daha selamlanır ve Safa tepesine gidilir.",
          "Safa'ya yaklaşınca ayet okunur, tepeye çıkılıp Kâbe'ye dönülür ve sa'ye niyet edilir.",
          "Eller dua için kaldırılarak tekbir, tehlil, salavat getirilir ve dua edilir.",
          "Merve'ye doğru yürünür. Erkekler yeşil ışıklarla işaretli bölümde koşar adımla (hervele) yürür.",
          "Merve'ye varınca Kâbe'ye dönülür, Safa'daki gibi zikir ve dua yapılır. Bu, birinci şavttır.",
          "Merve'den Safa'ya dönüş ikinci şavttır. Böylece yedi şavt tamamlanır; sa'y Merve'de biter.",
        ],
        title: "Sa'yin Yapılışı",
        numbered: true,
      ),
      GuideParagraph(
        "Sa'y için abdest şart değildir ama abdestli olmak daha faziletlidir. Gücü yetenlerin sa'yi yürüyerek yapması vaciptir; yaşlı ve hastalar tekerlekli sandalye kullanabilir. Namaz vakti girerse ara verilip kalınan yerden devam edilir.",
      ),
      GuideCallout(
        "Sa'y Safa'dan başlar, Merve'de biter. Safa → Merve bir şavt, Merve → Safa bir şavt sayılır.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'tiras',
    title: "Tıraş ve İhramdan Çıkış",
    summary: "Saçları kısaltıp umreyi tamamlamak",
    icon: Icons.content_cut,
    duaIds: ['rabbena_tekabbel'],
    blocks: [
      GuideBullets([
        "Erkekler için saçın tamamını tıraş etmek (halk) daha faziletlidir. Hanefîlere göre başın en az dörtte birindeki saçları parmak ucu kadar kısaltmak (taksîr) da yeterlidir.",
        "Kadınlar saçlarının ucundan parmak ucu (bir boğum) kadar keser.",
        "Tıraş, Harem sınırları içinde yapılır.",
      ]),
      GuideParagraph(
        "Tıraş ile ihram yasakları sona erer ve umre tamamlanmış olur. Allah kabul etsin!",
      ),
      GuideCallout(
        "Birkaç tel saç kesmek Hanefî mezhebine göre yeterli değildir.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'kadinlar',
    title: "Kadınlar İçin Notlar",
    summary: "Kadınlara özel hükümler",
    icon: Icons.woman,
    blocks: [
      GuideBullets([
        "Tesettüre uygun normal kıyafetle ihrama girilir; yüz ve eller açık kalır, eldiven ve peçe takılmaz.",
        "Telbiye alçak sesle okunur.",
        "Tavafta ıztıba ve remel, sa'yde hervele yapılmaz.",
        "Tıraş yerine saçların ucundan parmak ucu kadar kesilir.",
        "Mahrem veya güvenilir bir grupla seyahat edilir.",
      ]),
      GuideParagraph(
        "Hayız veya lohusa hâlindeki kadın ihrama girebilir ve telbiye getirebilir; ancak temizlenmeden tavaf yapamaz ve mescide giremez. Temizlendikten sonra gusül alıp tavaf ve sa'yini yapar.",
      ),
      GuideCallout(
        "Dönüş tarihi yaklaştığı hâlde temizlenme gerçekleşmezse kafile din görevlinize danışın.",
        warning: true,
      ),
    ],
  ),
  GuideStep(
    id: 'mekke_kalis',
    title: "Mekke'de Kalış",
    summary: "Namaz, nafile tavaf ve ziyaret yerleri",
    icon: Icons.access_time,
    blocks: [
      GuideBullets([
        "Beş vakit namazı Mescid-i Haram'da cemaatle kılmaya özen gösterin.",
        "Mekke dışından gelenler için nafile tavaf, nafile namazdan daha faziletlidir.",
        "Bol bol Kur'an okuyun, dua ve zikirle meşgul olun.",
        "Yeniden umre yapmak isteyenler Harem sınırının dışına (Ten'îm'deki Hz. Âişe Mescidi veya Ci'râne) çıkarak ihrama girer.",
      ]),
      GuideBullets([
        "Hira Dağı (Nur Dağı) ve Sevr Dağı",
        "Arafat, Müzdelife ve Mina",
        "Cennetü'l-Muallâ Kabristanı",
      ], title: "Ziyaret Yerleri"),
    ],
  ),
  GuideStep(
    id: 'medine',
    title: "Medine Ziyareti",
    summary: "Mescid-i Nebevî, Ravza ve Bakî",
    icon: Icons.location_city,
    duaIds: [
      'medine_gorulunce',
      'mescide_girerken',
      'peygamberimize_selam',
      'ebubekire_selam',
      'omere_selam',
      'kabristan',
    ],
    blocks: [
      GuideParagraph(
        "Medine ziyareti umrenin bir parçası değildir; ancak çok faziletli bir ziyarettir. Mescid-i Nebevî'de kılınan namaz, diğer mescitlerde kılınan bin namazdan daha hayırlıdır.",
      ),
      GuideBullets([
        "Mescid-i Nebevî'ye salavat getirerek ve giriş duasıyla girilir.",
        "Ravza-i Mutahhara'da iki rekât namaz kılınır. Ravza ziyareti için genellikle Nusuk uygulamasından randevu alınması gerekir; güncel bilgiyi rehberinizden öğrenin.",
        "Kabr-i Şerif önünde edeple, sesi yükseltmeden Peygamberimize, ardından Hz. Ebû Bekir ve Hz. Ömer'e selam verilir.",
        "Cennetü'l-Bakî ziyaret edilir.",
        "Kuba Mescidi'ne abdestli gidip iki rekât namaz kılmak umre sevabına denktir (Tirmizî, Salât 126; İbn Mâce, İkâmet 197).",
        "Uhud Dağı ve Uhud Şehitliği, Kıbleteyn Mescidi ziyaret edilebilir.",
      ], title: "Medine'de Yapılacaklar"),
    ],
  ),
  GuideStep(
    id: 'veda',
    title: "Veda ve Dönüş",
    summary: "Veda tavafı ve eve dönüş",
    icon: Icons.flight_land,
    duaIds: ['rabbena_tekabbel', 'araca_binerken'],
    blocks: [
      GuideParagraph(
        "Hanefî mezhebine göre umre için veda tavafı vacip değildir; ancak Mekke'den ayrılmadan önce Kâbe'yi tavaf ederek vedalaşmak güzeldir.",
      ),
      GuideBullets([
        "Zemzem, havayolunun kurallarına uygun kapalı bidonlarla getirilir.",
        "Dönüşte ziyaretçilerinize umrede yaşadıklarınızı ve öğrendiklerinizi anlatın.",
        "Umrenin kazandırdığı manevi hâli korumaya gayret edin.",
      ]),
    ],
  ),
  GuideStep(
    id: 'hatalar',
    title: "Sık Yapılan Hatalar",
    summary: "Dikkat edilmesi gerekenler",
    icon: Icons.warning_amber,
    blocks: [
      GuideBullets([
        "Mikatı ihramsız geçmek.",
        "İhramlıyken kokulu sabun, şampuan veya ıslak mendil kullanmak.",
        "Sağ omzu tavaf dışında, özellikle namazda açık bırakmak. Iztıba yalnızca tavaf sırasında yapılır.",
        "Hatîm'in (Hicr-i İsmâil) içinden geçerek tavaf etmek.",
        "Hacerülesved'e ulaşmak için itişip kakışmak, başkalarına eziyet etmek.",
        "Sa'ye Merve'den başlamak veya Safa–Merve gidiş-dönüşünü tek şavt saymak.",
        "Saçı yeterince kısaltmamak (birkaç tel kesmek).",
        "Hayızlı iken tavaf etmek.",
        "Tavaf ve sa'yde başkalarının duymasını engelleyecek kadar yüksek sesle grup halinde dua etmek.",
      ]),
    ],
  ),
];

GuideStep? guideStepById(String id) {
  for (final step in guideSteps) {
    if (step.id == id) return step;
  }
  return null;
}
