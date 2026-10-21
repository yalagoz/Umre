// Umre duaları.
//
// Arapça metinler; Diyanet İşleri Başkanlığı Hac ve Umre Eğitim sitesindeki
// dualar (hacumreegitim.hac.gov.tr/dualar), Kur'an-ı Kerim ve hadis
// kaynaklarıyla karşılaştırılarak hazırlanmıştır. Türkçe anlamlar sade bir
// dille yeniden yazılmıştır.

import 'package:flutter/material.dart';

import '../models.dart';

// ---------------------------------------------------------------------------
// Yolculuk
// ---------------------------------------------------------------------------

const evdenCikarken = Dua(
  id: 'evden_cikarken',
  title: "Evden Çıkarken",
  when: "Yolculuğa çıkmak için evden ayrılırken.",
  arabic: "بِسْمِ اللّٰهِ تَوَكَّلْتُ عَلَى اللّٰهِ، لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ",
  okunus: "Bismillâhi tevekkeltü ala'llâh, lâ havle ve lâ kuvvete illâ billâh.",
  anlam: "Allah'ın adıyla (çıkıyorum). Allah'a dayanıp güvendim. Güç ve kuvvet ancak Allah'ın yardımıyladır.",
  kaynak: "Ebû Dâvûd, Edeb 103 (5095); Tirmizî, Daavât 34.",
);

const aracaBinerken = Dua(
  id: 'araca_binerken',
  title: "Araca Binerken (Yolculuk Duası)",
  when: "Uçağa, otobüse veya herhangi bir araca binince.",
  arabic: "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ ۝ وَإِنَّا إِلٰى رَبِّنَا لَمُنْقَلِبُونَ",
  okunus: "Sübhâne'llezî sahhara lenâ hâzâ ve mâ künnâ lehû mukrinîn. Ve innâ ilâ rabbinâ le munkalibûn.",
  anlam: "Bunu bizim hizmetimize veren Allah'ı tesbih ederiz; yoksa biz buna güç yetiremezdik. Şüphesiz biz Rabbimize döneceğiz.",
  kaynak: "Zuhruf 43/13-14; Müslim, Hac 425 (1342).",
);

// ---------------------------------------------------------------------------
// İhram
// ---------------------------------------------------------------------------

const ihramNamaziNiyeti = Dua(
  id: 'ihram_namazi_niyeti',
  title: "İhram Namazı Niyeti",
  when: "İhram örtüleri giyildikten sonra, kerahat vakti değilse.",
  okunus: "Niyet ettim Allah rızası için iki rekât ihram namazı kılmaya.",
  anlam: "Niyet kalben yapılır; dil ile söylenmesi güzeldir.",
  not: "Birinci rekâtta Kâfirûn, ikinci rekâtta İhlâs sûresinin okunması sünnettir. Erkekler bu namazı başları açık olmadan, normal şekilde kılar.",
);

const umreNiyeti = Dua(
  id: 'umre_niyeti',
  title: "Umre Niyeti",
  when: "İhram namazından sonra, mikat sınırını geçmeden.",
  arabic: "اَللّٰهُمَّ إِنِّي أُرِيدُ الْعُمْرَةَ فَيَسِّرْهَا لِي وَتَقَبَّلْهَا مِنِّي",
  okunus: "Allâhümme innî urîdü'l-umrete fe yessirhâ lî ve tekabbelhâ minnî.",
  anlam: "Allah'ım! Umre yapmak istiyorum. Onu bana kolaylaştır ve benden kabul eyle.",
  not: "Niyetin hemen ardından telbiye getirilir. Niyet ve telbiye ile ihrama girilmiş olur ve ihram yasakları başlar.",
);

const telbiye = Dua(
  id: 'telbiye',
  title: "Telbiye",
  when: "Niyetten hemen sonra; ihramlı iken sık sık. Umrede tavafa başlayınca telbiye kesilir.",
  arabic: "لَبَّيْكَ اللّٰهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ",
  okunus: "Lebbeyk, Allâhümme lebbeyk. Lebbeyke lâ şerîke leke lebbeyk. İnne'l-hamde ve'n-ni'mete leke ve'l-mülk, lâ şerîke lek.",
  anlam: "Buyur Allah'ım, davetine geldim! Buyur, Senin hiçbir ortağın yoktur, emrindeyim! Hamd Sana mahsustur; nimet de mülk de Senindir. Senin hiçbir ortağın yoktur.",
  kaynak: "Buhârî, Hac 26 (1549); Müslim, Hac 19 (1184).",
  not: "Erkekler telbiyeyi sesli, kadınlar ise kendilerinin duyacağı kadar alçak sesle okur. Genellikle üç defa tekrarlanır, ardından salavat getirilip dua edilir.",
);

// ---------------------------------------------------------------------------
// Zikirler
// ---------------------------------------------------------------------------

const tekbir = Dua(
  id: 'tekbir',
  title: "Tekbir",
  when: "İhramlı iken, tavaf ve sa'y sırasında, Kâbe'yi görünce.",
  arabic: "اَللّٰهُ أَكْبَرُ اَللّٰهُ أَكْبَرُ، لَا إِلٰهَ إِلَّا اللّٰهُ وَاللّٰهُ أَكْبَرُ، اَللّٰهُ أَكْبَرُ وَلِلّٰهِ الْحَمْدُ",
  okunus: "Allâhu ekber Allâhu ekber, lâ ilâhe illallâhu vallâhu ekber, Allâhu ekber ve lillâhi'l-hamd.",
  anlam: "Allah en büyüktür, Allah en büyüktür. Allah'tan başka ilah yoktur. Allah en büyüktür, Allah en büyüktür; hamd yalnızca Allah'a mahsustur.",
);

const tehlil = Dua(
  id: 'tehlil',
  title: "Tehlil",
  when: "İhramlı iken, tavaf ve sa'y sırasında.",
  arabic: "لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلٰى كُلِّ شَيْءٍ قَدِيرٌ",
  okunus: "Lâ ilâhe illallâhu vahdehû lâ şerîke leh, lehü'l-mülkü ve lehü'l-hamdü ve hüve alâ külli şey'in kadîr.",
  anlam: "Allah'tan başka ilah yoktur; O tektir, ortağı yoktur. Mülk O'nundur, hamd O'na mahsustur. O her şeye gücü yetendir.",
  kaynak: "Buhârî, Ezân 155 (844); Müslim, Mesâcid 137 (593).",
);

const tesbih = Dua(
  id: 'tesbih',
  title: "Tesbih",
  when: "İhramlı iken, tavaf ve sa'y sırasında, her zaman.",
  arabic: "سُبْحَانَ اللّٰهِ وَالْحَمْدُ لِلّٰهِ وَلَا إِلٰهَ إِلَّا اللّٰهُ وَاللّٰهُ أَكْبَرُ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ الْعَلِيِّ الْعَظِيمِ",
  okunus: "Sübhânallâhi ve'l-hamdü lillâhi ve lâ ilâhe illallâhu vallâhu ekber. Ve lâ havle ve lâ kuvvete illâ billâhi'l-aliyyi'l-azîm.",
  anlam: "Allah'ı her türlü eksiklikten tenzih ederim. Hamd Allah'a mahsustur. Allah'tan başka ilah yoktur, Allah en büyüktür. Güç ve kuvvet ancak yüce ve büyük olan Allah'ın yardımıyladır.",
);

const salavat = Dua(
  id: 'salavat',
  title: "Salavat",
  when: "Telbiyeden sonra, tavaf ve sa'yde, Medine'de ve her fırsatta.",
  arabic: "اَللّٰهُمَّ صَلِّ عَلٰى مُحَمَّدٍ وَعَلٰى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلٰى إِبْرَاهِيمَ وَعَلٰى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ. اَللّٰهُمَّ بَارِكْ عَلٰى مُحَمَّدٍ وَعَلٰى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلٰى إِبْرَاهِيمَ وَعَلٰى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ",
  okunus: "Allâhümme salli alâ Muhammedin ve alâ âli Muhammed, kemâ salleyte alâ İbrâhîme ve alâ âli İbrâhîm, inneke hamîdün mecîd. Allâhümme bârik alâ Muhammedin ve alâ âli Muhammed, kemâ bârekte alâ İbrâhîme ve alâ âli İbrâhîm, inneke hamîdün mecîd.",
  anlam: "Allah'ım! İbrahim'e ve ailesine rahmet ettiğin gibi Muhammed'e ve ailesine de rahmet et. Şüphesiz Sen övülmeye layık ve şanı yüce olansın. Allah'ım! İbrahim'e ve ailesine bereket verdiğin gibi Muhammed'e ve ailesine de bereket ver. Şüphesiz Sen övülmeye layık ve şanı yüce olansın.",
  kaynak: "Buhârî, Enbiyâ 10 (3370); Müslim, Salât 66 (406).",
);

// ---------------------------------------------------------------------------
// Mescid-i Haram ve Kâbe
// ---------------------------------------------------------------------------

const mescideGirerken = Dua(
  id: 'mescide_girerken',
  title: "Mescide Girerken",
  when: "Mescid-i Haram'a, Mescid-i Nebevî'ye ve her mescide sağ ayakla girerken.",
  arabic: "بِسْمِ اللّٰهِ وَالصَّلَاةُ وَالسَّلَامُ عَلٰى رَسُولِ اللّٰهِ، اَللّٰهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
  okunus: "Bismillâhi ve's-salâtü ve's-selâmü alâ Rasûlillâh. Allâhümme'ftah lî ebvâbe rahmetik.",
  anlam: "Allah'ın adıyla. Salât ve selam Allah'ın Resûlü'ne olsun. Allah'ım! Bana rahmetinin kapılarını aç.",
  kaynak: "Müslim, Müsâfirîn 68 (713); İbn Mâce, Mesâcid 13 (771).",
);

const mesciddenCikarken = Dua(
  id: 'mescidden_cikarken',
  title: "Mescidden Çıkarken",
  when: "Mescidden sol ayakla çıkarken.",
  arabic: "بِسْمِ اللّٰهِ وَالصَّلَاةُ وَالسَّلَامُ عَلٰى رَسُولِ اللّٰهِ، اَللّٰهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
  okunus: "Bismillâhi ve's-salâtü ve's-selâmü alâ Rasûlillâh. Allâhümme innî es'elüke min fadlik.",
  anlam: "Allah'ın adıyla. Salât ve selam Allah'ın Resûlü'ne olsun. Allah'ım! Senden lütfunu ve ihsanını istiyorum.",
  kaynak: "Müslim, Müsâfirîn 68 (713); İbn Mâce, Mesâcid 13 (771).",
);

const kabeyiGorunce = Dua(
  id: 'kabeyi_gorunce',
  title: "Kâbe'yi Görünce",
  when: "Kâbe ilk defa görüldüğünde; önce tekbir ve tehlil getirilir, ardından bu dua okunur.",
  arabic: "اَللّٰهُمَّ زِدْ هٰذَا الْبَيْتَ تَشْرِيفًا وَتَعْظِيمًا وَتَكْرِيمًا وَمَهَابَةً، وَزِدْ مَنْ شَرَّفَهُ وَكَرَّمَهُ مِمَّنْ حَجَّهُ أَوِ اعْتَمَرَهُ تَشْرِيفًا وَتَكْرِيمًا وَتَعْظِيمًا وَبِرًّا، اَللّٰهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ",
  okunus: "Allâhümme zid hâze'l-beyte teşrîfen ve ta'zîmen ve tekrîmen ve mehâbeh. Ve zid men şerrefehû ve kerramehû mimmen haccehû evi'temerahû teşrîfen ve tekrîmen ve ta'zîmen ve birrâ. Allâhümme ente's-selâmü ve minke's-selâm, tebârekte yâ ze'l-celâli ve'l-ikrâm.",
  anlam: "Allah'ım! Bu Beyt'in şerefini, yüceliğini, itibarını ve heybetini artır. Onu hac veya umre için ziyaret edip ona saygı gösterenlerin de şerefini, itibarını, yüceliğini ve iyiliğini artır. Allah'ım! Sen Selâm'sın, esenlik Sendendir. Ey celâl ve ikram sahibi, Sen ne yücesin!",
  kaynak: "Beyhakî, es-Sünenü'l-kübrâ, V, 73; Diyanet Hac ve Umre Duaları.",
  not: "Kâbe'yi ilk görünce bir süre durup, samimiyetle kendisi, ailesi ve bütün Müslümanlar için dua etmek tavsiye edilir.",
);

// ---------------------------------------------------------------------------
// Tavaf
// ---------------------------------------------------------------------------

const tavafNiyeti = Dua(
  id: 'tavaf_niyeti',
  title: "Umre Tavafı Niyeti",
  when: "Hacerülesved hizasında, tavafa başlamadan önce.",
  arabic: "اَللّٰهُمَّ إِنِّي أُرِيدُ طَوَافَ الْعُمْرَةِ فَيَسِّرْهُ لِي وَتَقَبَّلْهُ مِنِّي",
  okunus: "Allâhümme innî urîdü tavâfe'l-umrati fe yessirhü lî ve tekabbelhü minnî.",
  anlam: "Allah'ım! Umre tavafı yapmak istiyorum. Onu bana kolaylaştır ve benden kabul eyle.",
);

const tavafaBaslarken = Dua(
  id: 'tavafa_baslarken',
  title: "Tavafa Başlarken (İstilam)",
  when: "Niyetten sonra Hacerülesved'e dönüp eller kaldırılarak selamlanırken (istilam).",
  arabic: "بِسْمِ اللّٰهِ اَللّٰهُ أَكْبَرُ، اَللّٰهُمَّ إِيمَانًا بِكَ وَتَصْدِيقًا بِكِتَابِكَ وَوَفَاءً بِعَهْدِكَ وَاتِّبَاعًا لِسُنَّةِ نَبِيِّكَ مُحَمَّدٍ صَلَّى اللّٰهُ عَلَيْهِ وَسَلَّمَ",
  okunus: "Bismillâhi Allâhu ekber. Allâhümme îmânen bike ve tasdîkan bi kitâbike ve vefâen bi ahdike ve'ttibâan li sünneti nebiyyike Muhammedin sallallâhu aleyhi ve sellem.",
  anlam: "Allah'ın adıyla, Allah en büyüktür. Allah'ım! Sana iman ederek, Kitabını tasdik ederek, Sana verdiğim söze bağlı kalarak ve Peygamberin Muhammed'in (s.a.s.) sünnetine uyarak (tavafa başlıyorum).",
  kaynak: "Hz. Ali ve Abdullah b. Ömer'den nakledilmiştir (Taberânî, el-Mu'cemü'l-evsat); Diyanet Hac ve Umre Duaları.",
);

const hacerulesvedTekbir = Dua(
  id: 'hacerulesved_tekbir',
  title: "Her Şavtta Hacerülesved Hizasında",
  when: "Her şavtın başında Hacerülesved hizasına gelince, eli ona doğru kaldırıp selamlarken.",
  arabic: "بِسْمِ اللّٰهِ اَللّٰهُ أَكْبَرُ",
  okunus: "Bismillâhi Allâhu ekber.",
  anlam: "Allah'ın adıyla, Allah en büyüktür.",
  kaynak: "Buhârî, Hac 62 (1613); Beyhakî, es-Sünenü'l-kübrâ, V, 79.",
  not: "Kalabalıkta Hacerülesved'e dokunmak veya onu öpmek için itişip kakışmak doğru değildir; uzaktan el ile işaret ederek selamlamak yeterlidir.",
);

const rabbenaAtina = Dua(
  id: 'rabbena_atina',
  title: "Rükn-i Yemânî ile Hacerülesved Arasında",
  when: "Her şavtın sonunda, Rükn-i Yemânî köşesinden Hacerülesved'e kadar yürürken.",
  arabic: "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
  okunus: "Rabbenâ âtinâ fi'd-dünyâ haseneten ve fi'l-âhirati haseneten ve kınâ azâbe'n-nâr.",
  anlam: "Rabbimiz! Bize dünyada da iyilik ver, ahirette de iyilik ver ve bizi cehennem azabından koru.",
  kaynak: "Bakara 2/201; Ebû Dâvûd, Menâsik 52 (1892).",
);

const tavafNamaziNiyeti = Dua(
  id: 'tavaf_namazi_niyeti',
  title: "Tavaf Namazı Niyeti",
  when: "Tavaf bittikten sonra, mümkünse Makam-ı İbrahim'in arkasında; değilse Mescid-i Haram'ın uygun bir yerinde.",
  okunus: "Niyet ettim Allah rızası için iki rekât tavaf namazı kılmaya.",
  anlam: "Tavaf namazı vaciptir. Kerahat vakti ise vaktin çıkması beklenir.",
  kaynak: "Bakara 2/125; Müslim, Hac 147 (1218).",
  not: "Birinci rekâtta Kâfirûn, ikinci rekâtta İhlâs sûresi okunur. Namazdan önce sağ omuz örtülür (ıztıba bırakılır).",
);

const multezemDuasi = Dua(
  id: 'multezem',
  title: "Mültezem'de Dua",
  when: "Tavaftan sonra Kâbe kapısı ile Hacerülesved arasındaki Mültezem'de; kalabalıkta uzaktan Mültezem'e yönelerek.",
  arabic: "اَللّٰهُمَّ يَا رَبَّ الْبَيْتِ الْعَتِيقِ، أَعْتِقْ رِقَابَنَا وَرِقَابَ آبَائِنَا وَأُمَّهَاتِنَا وَإِخْوَانِنَا وَأَوْلَادِنَا مِنَ النَّارِ، يَا ذَا الْجُودِ وَالْكَرَمِ وَالْفَضْلِ وَالْمَنِّ وَالْعَطَاءِ وَالْإِحْسَانِ. اَللّٰهُمَّ أَحْسِنْ عَاقِبَتَنَا فِي الْأُمُورِ كُلِّهَا، وَأَجِرْنَا مِنْ خِزْيِ الدُّنْيَا وَعَذَابِ الْآخِرَةِ. اَللّٰهُمَّ إِنِّي عَبْدُكَ وَابْنُ عَبْدِكَ وَابْنُ أَمَتِكَ، وَاقِفٌ تَحْتَ بَابِكَ، مُلْتَزِمٌ بِأَعْتَابِكَ، يَا قَدِيمَ الْإِحْسَانِ. اَللّٰهُمَّ إِنِّي أَسْأَلُكَ أَنْ تَرْفَعَ ذِكْرِي، وَتَضَعَ وِزْرِي، وَتَغْفِرَ لِي ذَنْبِي، وَأَسْأَلُكَ الدَّرَجَاتِ الْعُلٰى مِنَ الْجَنَّةِ",
  okunus: "Allâhümme yâ Rabbe'l-beyti'l-atîk, a'tik rikâbenâ ve rikâbe âbâinâ ve ümmehâtinâ ve ihvâninâ ve evlâdinâ mine'n-nâr. Yâ ze'l-cûdi ve'l-kerami ve'l-fadli ve'l-menni ve'l-atâi ve'l-ihsân. Allâhümme ahsin âkıbetenâ fi'l-umûri küllihâ ve ecirnâ min hızyi'd-dünyâ ve azâbi'l-âhirah. Allâhümme innî abdüke ve'bnü abdike ve'bnü emetike, vâkıfun tahte bâbike, mültezimün bi a'tâbike, yâ kadîme'l-ihsân. Allâhümme innî es'elüke en terfea zikrî ve teda'a vizrî ve tağfira lî zenbî ve es'elüke'd-derecâti'l-ulâ mine'l-cenneh.",
  anlam: "Ey Beyt-i Atîk'in (Kâbe'nin) Rabbi olan Allah'ım! Bizi, babalarımızı, annelerimizi, kardeşlerimizi ve çocuklarımızı cehennem ateşinden azat eyle. Ey cömertlik, kerem, lütuf, ikram ve ihsan sahibi! Allah'ım! Bütün işlerimizin sonunu hayırlı eyle; bizi dünyada rezil olmaktan ve ahiret azabından koru. Allah'ım! Ben Senin kulunum, kulunun ve cariyenin evladıyım. Kapının önünde duruyor, eşiğine sarılıyorum, ey ihsanı daim olan! Allah'ım! Şanımı yüceltmeni, günah yükümü kaldırmanı, günahımı bağışlamanı istiyorum ve Senden cennetin yüksek derecelerini diliyorum.",
  kaynak: "Diyanet Hac ve Umre Duaları.",
  not: "Bu duanın okunması zorunlu değildir; kişi kendi diliyle de dua edebilir.",
);

const zemzemDuasi = Dua(
  id: 'zemzem',
  title: "Zemzem İçerken",
  when: "Kıbleye dönerek, besmele ile, üç nefeste ve doyasıya zemzem içerken.",
  arabic: "اَللّٰهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا وَاسِعًا، وَشِفَاءً مِنْ كُلِّ دَاءٍ وَسَقَمٍ",
  okunus: "Allâhümme innî es'elüke ilmen nâfiâ, ve rizkan vâsiâ, ve şifâen min külli dâin ve sekam.",
  anlam: "Allah'ım! Senden faydalı ilim, geniş ve bereketli rızık ve her türlü dert ve hastalıktan şifa istiyorum.",
  kaynak: "İbn Abbas'tan nakledilir (Dârekutnî, Hâkim). \"Zemzem ne niyetle içilirse o niyete göredir.\" (İbn Mâce, Menâsik 78 (3062))",
);

// ---------------------------------------------------------------------------
// Sa'y
// ---------------------------------------------------------------------------

const sayNiyeti = Dua(
  id: 'say_niyeti',
  title: "Sa'y Niyeti",
  when: "Safa tepesinde, sa'ye başlamadan önce.",
  arabic: "اَللّٰهُمَّ إِنِّي أُرِيدُ سَعْيَ الْعُمْرَةِ فَيَسِّرْهُ لِي وَتَقَبَّلْهُ مِنِّي",
  okunus:
      "Allâhümme innî urîdü sa'ye'l-umrati fe yessirhü lî ve tekabbelhü minnî.",
  anlam: "Allah'ım! Umrenin sa'yini yapmak istiyorum. Onu bana kolaylaştır ve benden kabul eyle.",
);

const safayaYaklasirken = Dua(
  id: 'safaya_yaklasirken',
  title: "Safa'ya Yaklaşırken",
  when:
      "Sa'ye başlarken Safa tepesine yaklaşınca (yalnızca ilk şavtın başında).",
  arabic: "إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللّٰهِ. أَبْدَأُ بِمَا بَدَأَ اللّٰهُ بِهِ",
  okunus: "İnne's-Safâ ve'l-Mervete min şeâirillâh. Ebdeü bimâ bedeallâhu bih.",
  anlam: "Şüphesiz Safa ile Merve, Allah'ın (dininin) nişanelerindendir. Allah'ın başladığı yerden başlıyorum.",
  kaynak: "Bakara 2/158; Müslim, Hac 147 (1218).",
);

const safaMerveZikri = Dua(
  id: 'safa_merve',
  title: "Safa ve Merve Tepelerinde",
  when: "Safa ve Merve tepelerinde Kâbe'ye dönüp eller dua için kaldırılarak; her varışta.",
  arabic: "اَللّٰهُ أَكْبَرُ، اَللّٰهُ أَكْبَرُ، اَللّٰهُ أَكْبَرُ. لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلٰى كُلِّ شَيْءٍ قَدِيرٌ. لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ، أَنْجَزَ وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ. لَا إِلٰهَ إِلَّا اللّٰهُ، وَلَا نَعْبُدُ إِلَّا إِيَّاهُ، مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْكَافِرُونَ",
  okunus: "Allâhu ekber, Allâhu ekber, Allâhu ekber. Lâ ilâhe illallâhu vahdehû lâ şerîke leh, lehü'l-mülkü ve lehü'l-hamdü ve hüve alâ külli şey'in kadîr. Lâ ilâhe illallâhu vahdeh, enceze va'deh, ve nasara abdeh, ve hezeme'l-ahzâbe vahdeh. Lâ ilâhe illallâhu ve lâ na'büdü illâ iyyâh, muhlisîne lehü'd-dîne ve lev kerihe'l-kâfirûn.",
  anlam: "Allah en büyüktür (3 kez). Allah'tan başka ilah yoktur; O tektir, ortağı yoktur. Mülk O'nundur, hamd O'na mahsustur; O her şeye gücü yetendir. Allah'tan başka ilah yoktur, O tektir. Vaadini yerine getirdi, kuluna yardım etti ve düşman toplulukları tek başına bozguna uğrattı. Allah'tan başka ilah yoktur. İnkârcılar hoşlanmasa da dini yalnız O'na has kılarak yalnızca O'na ibadet ederiz.",
  kaynak: "Müslim, Hac 147 (1218); son cümle: Müslim, Mesâcid 139 (594).",
  not: "Hz. Peygamber bu zikri üç defa tekrarlamış, aralarında dua etmiştir. Ardından kişi kendi diliyle dilediği gibi dua eder.",
);

const yesilIsiklar = Dua(
  id: 'yesil_isiklar',
  title: "Sa'y Sırasında (Yeşil Işıklar Arası)",
  when: "Safa ile Merve arasında yürürken, özellikle yeşil ışıklarla işaretli bölümde.",
  arabic: "رَبِّ اغْفِرْ وَارْحَمْ، إِنَّكَ أَنْتَ الْأَعَزُّ الْأَكْرَمُ",
  okunus: "Rabbiğfir verham, inneke ente'l-eazzü'l-ekrem.",
  anlam: "Rabbim! Bağışla ve merhamet et. Şüphesiz Sen en güçlü ve en cömert olansın.",
  kaynak: "Abdullah b. Mes'ûd ve Abdullah b. Ömer'den nakledilir (İbn Ebî Şeybe, el-Musannef; Beyhakî).",
  not: "Erkekler yeşil ışıklar arasında koşar adımla (hervele) yürür; kadınlar normal yürür. Sa'y boyunca tekbir, tehlil, salavat, Kur'an ve dilediğiniz dualar okunabilir.",
);

// ---------------------------------------------------------------------------
// Medine
// ---------------------------------------------------------------------------

const medineGorulunce = Dua(
  id: 'medine_gorulunce',
  title: "Medine Görülünce",
  when: "Medine-i Münevvere'ye yaklaşıp şehir görülünce; salavat çoğaltılır.",
  arabic: "اَللّٰهُمَّ افْتَحْ عَلَيَّ أَبْوَابَ رَحْمَتِكَ، وَارْزُقْنِي مَا رَزَقْتَهُ أَوْلِيَاءَكَ وَأَهْلَ طَاعَتِكَ، وَاغْفِرْ لِي وَارْحَمْنِي يَا خَيْرَ مَسْؤُولٍ",
  okunus: "Allâhümme'ftah aleyye ebvâbe rahmetik, verzuknî mâ razaktehû evliyâeke ve ehle tâatik, vağfir lî verhamnî yâ hayra mes'ûl.",
  anlam: "Allah'ım! Bana rahmetinin kapılarını aç. Dostlarına ve Sana itaat edenlere verdiğin nimetlerden bana da ver. Beni bağışla ve bana merhamet et, ey kendisinden istenenlerin en hayırlısı!",
  kaynak: "Diyanet Hac ve Umre Duaları.",
);

const peygamberimizeSelam = Dua(
  id: 'peygamberimize_selam',
  title: "Peygamberimize (s.a.s.) Selam",
  when:
      "Mescid-i Nebevî'de Kabr-i Şerif'in önünde, edeple ve sesi yükseltmeden.",
  arabic: "اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ يَا رَسُولَ اللّٰهِ، اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ يَا حَبِيبَ اللّٰهِ، اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ يَا رَحْمَةً لِلْعَالَمِينَ، اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ يَا سَيِّدَ الْمُرْسَلِينَ، اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ يَا خَاتَمَ النَّبِيِّينَ، اَلصَّلَاةُ وَالسَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ",
  okunus: "Es-salâtü ve's-selâmü aleyke yâ Rasûlallâh. Es-salâtü ve's-selâmü aleyke yâ Habîballâh. Es-salâtü ve's-selâmü aleyke yâ rahmeten li'l-âlemîn. Es-salâtü ve's-selâmü aleyke yâ seyyide'l-mürselîn. Es-salâtü ve's-selâmü aleyke yâ hâteme'n-nebiyyîn. Es-salâtü ve's-selâmü aleyke eyyühe'n-nebiyyü ve rahmetullâhi ve berakâtüh.",
  anlam: "Salât ve selam sana olsun ey Allah'ın Resûlü! Salât ve selam sana olsun ey Allah'ın sevgilisi! Salât ve selam sana olsun ey âlemlere rahmet olarak gönderilen! Salât ve selam sana olsun ey peygamberlerin efendisi! Salât ve selam sana olsun ey peygamberlerin sonuncusu! Ey Peygamber! Salât ve selam, Allah'ın rahmeti ve bereketi senin üzerine olsun.",
  kaynak: "Diyanet Hac ve Umre Duaları.",
  not: "Selam iletmenizi isteyenlerin selamlarını da iletin: \"Es-selâmü aleyke yâ Rasûlallâh min (kişinin adı).\" Ardından kıbleye dönüp kendiniz ve sevdikleriniz için dua edin.",
);

const ebubekireSelam = Dua(
  id: 'ebubekire_selam',
  title: "Hz. Ebû Bekir'e (r.a.) Selam",
  when: "Peygamberimize selam verdikten sonra biraz sağa ilerleyip Hz. Ebû Bekir'in kabri hizasında.",
  arabic: "اَلسَّلَامُ عَلَيْكَ يَا أَبَا بَكْرٍ الصِّدِّيقِ، اَلسَّلَامُ عَلَيْكَ يَا خَلِيفَةَ رَسُولِ اللّٰهِ، اَلسَّلَامُ عَلَيْكَ يَا صَاحِبَ رَسُولِ اللّٰهِ فِي الْغَارِ، جَزَاكَ اللّٰهُ عَنَّا أَفْضَلَ الْجَزَاءِ، فَالسَّلَامُ عَلَيْكَ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ",
  okunus: "Es-selâmü aleyke yâ Ebâ Bekri's-Sıddîk. Es-selâmü aleyke yâ halîfete Rasûlillâh. Es-selâmü aleyke yâ sâhibe Rasûlillâhi fi'l-ğâr. Cezâkellâhu annâ efdale'l-cezâ. Fe's-selâmü aleyke ve rahmetullâhi ve berakâtüh.",
  anlam: "Selam sana ey Ebû Bekir es-Sıddîk! Selam sana ey Allah Resûlü'nün halifesi! Selam sana ey mağarada Allah Resûlü'nün arkadaşı olan! Allah seni bizim adımıza en güzel şekilde mükâfatlandırsın. Allah'ın selamı, rahmeti ve bereketi üzerine olsun.",
  kaynak: "Diyanet Hac ve Umre Duaları.",
);

const omereSelam = Dua(
  id: 'omere_selam',
  title: "Hz. Ömer'e (r.a.) Selam",
  when: "Hz. Ebû Bekir'e selamdan sonra biraz daha sağa ilerleyerek.",
  arabic: "اَلسَّلَامُ عَلَيْكَ يَا أَمِيرَ الْمُؤْمِنِينَ عُمَرَ الْفَارُوقِ، اَلسَّلَامُ عَلَيْكَ يَا مُظْهِرَ الْإِسْلَامِ، جَزَاكَ اللّٰهُ عَنَّا أَفْضَلَ الْجَزَاءِ، فَالسَّلَامُ عَلَيْكَ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ",
  okunus: "Es-selâmü aleyke yâ Emîre'l-mü'minîne Ömere'l-Fârûk. Es-selâmü aleyke yâ muzhira'l-İslâm. Cezâkellâhu annâ efdale'l-cezâ. Fe's-selâmü aleyke ve rahmetullâhi ve berakâtüh.",
  anlam: "Selam sana ey müminlerin emiri Ömer el-Fârûk! Selam sana ey İslam'ı güçlendirip yücelten! Allah seni bizim adımıza en güzel şekilde mükâfatlandırsın. Allah'ın selamı, rahmeti ve bereketi üzerine olsun.",
  kaynak: "Diyanet Hac ve Umre Duaları.",
);

const kabristanZiyareti = Dua(
  id: 'kabristan',
  title: "Kabristan Ziyaretinde",
  when: "Cennetü'l-Bakî, Uhud Şehitliği, Cennetü'l-Muallâ ve diğer kabristanları ziyaret ederken.",
  arabic: "اَلسَّلَامُ عَلَيْكُمْ أَهْلَ الدِّيَارِ مِنَ الْمُؤْمِنِينَ وَالْمُسْلِمِينَ، وَإِنَّا إِنْ شَاءَ اللّٰهُ بِكُمْ لَلَاحِقُونَ، نَسْأَلُ اللّٰهَ لَنَا وَلَكُمُ الْعَافِيَةَ",
  okunus: "Es-selâmü aleyküm ehle'd-diyâri mine'l-mü'minîne ve'l-müslimîn, ve innâ inşâallâhu biküm le lâhıkûn. Nes'elullâhe lenâ ve lekümü'l-âfiyeh.",
  anlam: "Ey bu yurdun mümin ve Müslüman sakinleri! Selam üzerinize olsun. İnşallah biz de size katılacağız. Allah'tan bizim için de sizin için de afiyet dileriz.",
  kaynak: "Müslim, Cenâiz 104 (975).",
);

// ---------------------------------------------------------------------------
// Kur'an'dan dualar
// ---------------------------------------------------------------------------

const rabbenaTekabbel = Dua(
  id: 'rabbena_tekabbel',
  title: "Rabbenâ Tekabbel Minnâ",
  when: "Tavaf, sa'y ve her ibadetin sonunda. Hz. İbrahim ile Hz. İsmail'in Kâbe'yi inşa ederken yaptıkları duadır.",
  arabic: "رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ",
  okunus: "Rabbenâ tekabbel minnâ inneke ente's-semîu'l-alîm.",
  anlam: "Rabbimiz! Bizden (bu ibadetimizi) kabul buyur. Şüphesiz Sen hakkıyla işiten ve bilensin.",
  kaynak: "Bakara 2/127.",
);

const rabbenaLaTuzig = Dua(
  id: 'rabbena_la_tuzig',
  title: "Hidayette Sebat Duası",
  when: "Her zaman okunabilir.",
  arabic: "رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً إِنَّكَ أَنْتَ الْوَهَّابُ",
  okunus: "Rabbenâ lâ tüziğ kulûbenâ ba'de iz hedeytenâ ve heb lenâ min ledünke rahmeh, inneke ente'l-vehhâb.",
  anlam: "Rabbimiz! Bizi doğru yola ilettikten sonra kalplerimizi kaydırma. Bize katından rahmet bağışla. Şüphesiz Sen çok bağışta bulunansın.",
  kaynak: "Âl-i İmrân 3/8.",
);

const rabbicalni = Dua(
  id: 'rabbicalni',
  title: "Aile ve Anne-Baba İçin Dua",
  when: "Her zaman; özellikle Mültezem'de, Safa ve Merve'de.",
  arabic: "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ ۝ رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
  okunus: "Rabbi'c'alnî mukîme's-salâti ve min zürriyyetî, Rabbenâ ve tekabbel duâ. Rabbene'ğfir lî ve li vâlideyye ve li'l-mü'minîne yevme yekûmü'l-hisâb.",
  anlam: "Rabbim! Beni ve soyumdan gelecekleri namazı dosdoğru kılanlardan eyle. Rabbimiz! Duamı kabul et. Rabbimiz! Hesap gününde beni, anne babamı ve bütün müminleri bağışla.",
  kaynak: "İbrâhîm 14/40-41.",
);

// ---------------------------------------------------------------------------

const List<DuaCategory> duaCategories = [
  DuaCategory(
    id: 'yolculuk',
    title: "Yolculuk",
    description: "Evden çıkarken ve yolculukta",
    icon: Icons.flight_takeoff,
    duas: [evdenCikarken, aracaBinerken],
  ),
  DuaCategory(
    id: 'ihram',
    title: "İhram",
    description: "Niyet ve telbiye",
    icon: Icons.checkroom,
    duas: [ihramNamaziNiyeti, umreNiyeti, telbiye],
  ),
  DuaCategory(
    id: 'harem',
    title: "Mescid-i Haram",
    description: "Mescide giriş ve Kâbe'yi görünce",
    icon: Icons.mosque,
    duas: [mescideGirerken, kabeyiGorunce, mesciddenCikarken],
  ),
  DuaCategory(
    id: 'tavaf',
    title: "Tavaf",
    description: "Tavaf, tavaf namazı, Mültezem ve Zemzem",
    icon: Icons.sync,
    duas: [
      tavafNiyeti,
      tavafaBaslarken,
      hacerulesvedTekbir,
      rabbenaAtina,
      tavafNamaziNiyeti,
      multezemDuasi,
      zemzemDuasi,
    ],
  ),
  DuaCategory(
    id: 'say',
    title: "Sa'y",
    description: "Safa ile Merve arası",
    icon: Icons.swap_vert,
    duas: [sayNiyeti, safayaYaklasirken, safaMerveZikri, yesilIsiklar],
  ),
  DuaCategory(
    id: 'zikirler',
    title: "Zikirler ve Salavat",
    description: "İhramda, tavafta ve sa'yde okunabilecek zikirler",
    icon: Icons.auto_awesome,
    duas: [tekbir, tehlil, tesbih, salavat],
  ),
  DuaCategory(
    id: 'medine',
    title: "Medine",
    description: "Mescid-i Nebevî ve ziyaretler",
    icon: Icons.location_city,
    duas: [
      medineGorulunce,
      mescideGirerken,
      peygamberimizeSelam,
      ebubekireSelam,
      omereSelam,
      kabristanZiyareti,
    ],
  ),
  DuaCategory(
    id: 'kuran',
    title: "Kur'an'dan Dualar",
    description: "Her zaman okunabilecek dualar",
    icon: Icons.menu_book,
    duas: [rabbenaTekabbel, rabbenaAtina, rabbenaLaTuzig, rabbicalni],
  ),
];

/// Kimliğe göre benzersiz dua listesi.
final Map<String, Dua> duaById = {
  for (final category in duaCategories)
    for (final dua in category.duas) dua.id: dua,
};

/// Duanın ilk yer aldığı kategori.
DuaCategory categoryOf(Dua dua) =>
    duaCategories.firstWhere((c) => c.duas.contains(dua));
