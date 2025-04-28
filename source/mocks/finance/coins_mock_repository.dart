import 'package:finance/features/physical_assets/domain/models/coin_model.dart';
import 'package:finance/features/physical_assets/domain/models/precious_metal_type_model.dart';
import 'package:finance/features/physical_assets/domain/repositories/coins_repository.dart';

class CoinsMockRepository implements CoinsRepository {
  static const _kCorsProxy = 'https://corsproxy.io/?url=';

  static final coins = [
    CoinModel(
      id: '3',
      numistaId: '5308',
      name: '5 francs Napoleon III',
      weight: 1.61,
      size: 17,
      thickness: null,
      minYear: '1862',
      maxYear: '1869',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3116-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3116-180.jpg',
        lettering: 'NAPOLEON III EMPEREUR\nBARRE',
        description: 'The bust of Napoleon III facing right',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3117-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3117-180.jpg',
        lettering: 'EMPIRE FRANÇAIS\n5\nFRANCS\nDATE\nA',
        description: 'The value above the date in a wreath',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Milled.', copyright: ''),
    ),
    CoinModel(
      id: '6',
      numistaId: '6929',
      name: '10 francs Napoleon III',
      weight: 3.23,
      size: 19,
      thickness: null,
      minYear: '1861',
      maxYear: '1868',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3112-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3112-180.jpg',
        lettering: 'NAPOLEON III EMPEREUR\nBARRE',
        description: 'Laurel head to right; bee - signed BARRE underneath - anchor.',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3113-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3113-180.jpg',
        lettering: 'EMPIRE FRANÇAIS\n10\nFRANCS\nDATE\nBB',
        description: 'Wreath of laurels surrounding the face value',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '8',
      numistaId: '6718',
      name: '20 francs Napoleon III',
      weight: 6.45,
      size: 21,
      thickness: 1.25,
      minYear: '1861',
      maxYear: '1870',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/1965-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/1965-180.jpg',
        lettering: 'NAPOLEON III EMPEREUR',
        description: 'Head of Emperor Napoleon III with wreath facing right',
        copyright: '',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/1966-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/1966-180.jpg',
        lettering: 'EMPIRE FRANÇAIS\n20 FR\nDATE',
        description: 'Coat of arms of France',
        copyright: '',
      ),
      edge: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/65e704753bb2c1.05949925-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/65e704753bb2c1.05949925-180.jpg',
        lettering: '★  ★ ★ ★  ★  DIEU  ★   PROTEGE  ★  LA  ★  FRANCE',
        description: 'Plain excuse lettering',
        copyright: 'Polette',
      ),
    ),
    CoinModel(
      id: '10',
      numistaId: '11338',
      name: '50 francs Napoleon III',
      weight: 16.13,
      size: 28,
      thickness: null,
      minYear: '1862',
      maxYear: '1868',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/5429-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/5429-180.jpg',
        lettering: 'NAPOLEON III EMPEREUR',
        description: 'Napoleon III Head Laurel',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/5430-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/5430-180.jpg',
        lettering: 'EMPIRE FRANCAIS\n50 FR\nA DATE',
        description: 'Shield formed by an eagle on a beam surrounded by the collar of the Legion of Honor',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(
        pictureUrl: '',
        thumbnailUrl: '',
        lettering: 'DIEU PROTEGE LA FRANCE',
        description: 'Relief',
        copyright: '',
      ),
    ),
    CoinModel(
      id: '12',
      numistaId: '11339',
      name: '100 francs Napoleon III',
      weight: 32.26,
      size: 35,
      thickness: null,
      minYear: '1862',
      maxYear: '1870',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3114-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3114-180.jpg',
        lettering: 'NAPOLEON III EMPEREUR\nBARRE',
        description: 'Napoleon III head laurel.',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3115-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/3115-180.jpg',
        lettering: 'EMPIRE FRANÇAIS\n100 FRs\nBB DATE',
        description: 'Shield decorated with an eagle on a beam surrounded by the collar of the Legion of Honor.',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(
        pictureUrl: '',
        thumbnailUrl: '',
        lettering: 'DIEU PROTEGE LA FRANCE',
        description: 'Smooth with embossed inscriptions.',
        copyright: '',
      ),
    ),
    CoinModel(
      id: '13',
      numistaId: '6007',
      name: '10 francs | Marianne',
      weight: 3.23,
      size: 19,
      thickness: 0.8,
      minYear: '1899',
      maxYear: '1914',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/10884-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/10884-180.jpg',
        lettering: 'REPUBLIQUE FRANÇAISE',
        description: 'Marianne facing right',
        copyright: 'CassTaylor',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/10885-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/10885-180.jpg',
        lettering: 'LIBERTE·EGALITE·FRATERNITE\n10 Fcs\nDATE',
        description: 'Cockerel facing left',
        copyright: 'CassTaylor',
      ),
      edge: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/632f285c320799.39891937-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/france/632f285c320799.39891937-180.jpg',
        lettering: '',
        description: 'Reeded',
        copyright: 'Arno22',
      ),
    ),
    CoinModel(
      id: '16',
      numistaId: '29507',
      name: 'Krugerrand | 1/4 Ounce',
      weight: 8.48,
      size: 22,
      thickness: 1.83,
      minYear: '1980',
      maxYear: '2023',
      composition: PreciousMetalTypeModel.gold,
      purity: 9170,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1026-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1026-180.jpg',
        lettering: 'SUID-AFRIKA - SOUTH AFRICA',
        description:
            "Left facing portrait of Stephanus Johannes Paulus 'Paul' Kruger, president of the Zuid Afrikaansche Republiek, 1883-1900.",
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1027-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1027-180.jpg',
        lettering: '1/4 KRUGERRAND\nDATE\nCLS\nFYNGOUD 1/4OZ FINE GOLD',
        description: 'Pronking Springbok dividing date',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '17',
      numistaId: '11459',
      name: 'Krugerrand | 1/2 Ounce',
      weight: 16.97,
      size: 27,
      thickness: 2.2,
      minYear: '1980',
      maxYear: '2023',
      composition: PreciousMetalTypeModel.gold,
      purity: 9170,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1020-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1020-180.jpg',
        lettering: 'SUID-AFRIKA • SOUTH AFRICA',
        description: 'Bust of Paul Kruger left, adapted from the design of Otto Schultz',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1021-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1021-180.jpg',
        lettering: '1/2 KRUGERRAND\nDA     TE\nFYNGOUD 1/2OZ FINE GOLD',
        description: 'Springbok walking right divides date',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '18',
      numistaId: '6002',
      name: 'Krugerrand | 1 Ounce',
      weight: 33.93,
      size: 32.7,
      thickness: 2.85,
      minYear: '1967',
      maxYear: '2023',
      composition: PreciousMetalTypeModel.gold,
      purity: 9170,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1002-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1002-180.jpg',
        lettering: 'SUID-AFRIKA * SOUTH AFRICA',
        description: 'Bust of Paul Kruger facing left',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1003-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/afrique_du_sud/1003-180.jpg',
        lettering: 'KRUGERRAND\nDA TE\nCLS\nFYNGOUD 1 OZ FINE GOLD',
        description: 'Springbok walking right divides date',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '19',
      numistaId: '15038',
      name: '50 pesos',
      weight: 41.67,
      size: 37,
      thickness: 2.8,
      minYear: '1921',
      maxYear: '1947',
      composition: PreciousMetalTypeModel.gold,
      purity: 9000,
      obverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/mexique/1380-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/mexique/1380-180.jpg',
        lettering: 'ESTADOS UNIDOS MEXICANOS',
        description: 'National arms, eagle right.',
        copyright: 'Heritage Auctions',
      ),
      reverse: CoinFaceModel(
        pictureUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/mexique/1381-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/mexique/1381-180.jpg',
        lettering: '50\nPESOS\n37,5 Gr.\nORO\nPURO\n1821 1929',
        description: 'Winged Victory.',
        copyright: 'Heritage Auctions',
      ),
      edge: CoinFaceModel(
        pictureUrl: '',
        thumbnailUrl: '',
        lettering: 'INDEPENDENCIA Y LIBERTAD',
        description: 'Lettered',
        copyright: '',
      ),
    ),
    CoinModel(
      id: '20',
      numistaId: '366164',
      name: 'Maple Leaf | 1/4 Ounce',
      weight: 7.8,
      size: 20,
      thickness: null,
      minYear: '1982',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9999,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/maple-leaf-2021-1-4-oz-or.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-2021-1-4-oz-or.webp',
        lettering: 'ELIZABETH II\n10 DOLLARS DATE',
        description:
            'Head of Queen Elizabeth II, as at 77 years of age, bare headed, wearing necklace and earrings, facing right.',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/maple-leaf-1_4once-or1.webp|https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1_4once-or1.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1_4once-or1.webp',
        lettering: 'CANADA\n9999  9999\nFINE GOLD 1⁄4 OZ OR PUR',
        description: 'Coin features a stylized depiction of a sugar maple (Acer saccharum) leaf.',
        copyright: 'Godot & Fils',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Serrated', copyright: ''),
    ),
    CoinModel(
      id: '21',
      numistaId: '365997',
      name: 'Maple Leaf | 1/2 Ounce',
      weight: 15.55,
      size: 25,
      thickness: null,
      minYear: '1986',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9999,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/1-2-Oz-Or-Maple-2021-2.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/1-2-Oz-Or-Maple-2021-2.webp',
        lettering: 'ELIZABETH II\n20 DOLLARS DATE',
        description:
            'Head of Queen Elizabeth II, as at 77 years of age, bare headed, wearing necklace and earrings, facing right. Below, double dates “1952” and “2022”, separated by four pearls symbolizing the four effigies that have graced Canadian coins throughout her reign. Inscription with legend surrounding obverse. Radial line background.',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/maple-leaf-1_2once-or-1.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1_2once-or-1.webp',
        lettering: 'CANADA\n9999  9999\nFINE GOLD 1/2 OZ OR PUR',
        description:
            'Classic maple leaf design, encircled by lettering with small maple leaf security feature below with the number last two digits of the year engraved. Radial line background.',
        copyright: 'Godot & Fils',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Serrated', copyright: ''),
    ),
    CoinModel(
      id: '22',
      numistaId: '366704',
      name: 'Maple Leaf | 1 Ounce',
      weight: 31.1,
      size: 30,
      thickness: 2.93,
      minYear: '1979',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9999,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/maple-leaf-1oz-or-20212.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1oz-or-20212.webp',
        lettering: 'ELIZABETH II\n50 DOLLARS DATE',
        description:
            'Head of Queen Elizabeth II, as at 77 years of age, bare headed, wearing necklace and earrings, facing right.',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/maple-leaf-1once-or-1.webp|https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1once-or-1.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/maple-leaf-1once-or-1.webp',
        lettering: 'CANADA\n9999  9999\nFINE GOLD 1 OZ OR PUR',
        description: 'Classic maple leaf design, surrounded by lettering with security leaf and radial lines.',
        copyright: 'Godot & Fils',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Serrated', copyright: ''),
    ),
    CoinModel(
      id: '23',
      numistaId: '300375',
      name: 'American Eagle | 1/4 Ounce',
      weight: 8.48,
      size: 22,
      thickness: 1.83,
      minYear: '2021',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9167,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33616b42f12.40201666-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33616b42f12.40201666-180.jpg',
        lettering: 'LIBERTY\nDATE\nASG',
        description: 'The effigy of Liberty with the year to the right',
        copyright: 'JM Bullion',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f336174900b0.61187488-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f336174900b0.61187488-180.jpg',
        lettering:
            'UNITED STATES OF AMERICA\nE PLURIBUS UNUM\nIN GOD\nWE TRUST\n\nRG JN\n10 DOLLARS ★ 1/4 OZ. FINE GOLD',
        description:
            'A bald eagle head facing left with the country name and motto at the top and the denomination and amount of gold below',
        copyright: 'JM Bullion',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '24',
      numistaId: '300376',
      name: 'American Eagle | 1/2 Ounce',
      weight: 16.97,
      size: 27,
      thickness: 2.24,
      minYear: '2021',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9167,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33786368825.32963920-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33786368825.32963920-180.jpg',
        lettering: 'LIBERTY\nDATE\nASG',
        description: 'An effigy of Liberty with the year to the right and stars surrounding around the rim',
        copyright: 'JM Bullion',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33786c9d247.49704084-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f33786c9d247.49704084-180.jpg',
        lettering:
            'UNITED STATES OF AMERICA\nE PLURIBUS UNUM\nIN GOD\nWE TRUST\n\nRG JN\n25 DOLLARS ★ 1/2 OZ. FINE GOLD',
        description:
            'A bald eagle head facing left with the country name and motto at the top and the denomination and amount of gold below',
        copyright: 'JM Bullion',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '25',
      numistaId: '300377',
      name: 'American Eagle | 1 Ounce',
      weight: 33.93,
      size: 32.7,
      thickness: 2.87,
      minYear: '2021',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9167,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a5a92ef8.85802265-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a5a92ef8.85802265-180.jpg',
        lettering: 'LIBERTY\nDATE\nASG',
        description: 'An effigy of Liberty with the date to the right',
        copyright: 'JM Bullion',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a671cdc0.49770263-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a671cdc0.49770263-180.jpg',
        lettering: 'UNITED STATES OF AMERICA\nE PLURIBUS UNUM\nIN GOD\nWE TRUST\n\nRG JN\n50 DOLLARS ★ 1 OZ. FINE GOLD',
        description:
            'A bald eagle head facing left with the country name and motto at the top and the denomination and amount of gold below',
        copyright: 'JM Bullion',
      ),
      edge: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a6f31047.80765402-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60f338a671cdc0.49770263-180.jpg',
        lettering: '',
        description: 'Reeded with security feature',
        copyright: 'JM Bullion',
      ),
    ),
    CoinModel(
      id: '26',
      numistaId: '9167',
      name: 'Vienna Philharmonic | 1/4 Ounce',
      weight: 7.78,
      size: 22,
      thickness: null,
      minYear: '2002',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/Philharmonique-1_4-Oz-Or-2021.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/Philharmonique-1_4-Oz-Or-2021.webp',
        lettering: 'REPUBLIK ÖSTERREICH\n¼ UNZE GOLD 999.9\nDATE\n25 EURO',
        description: 'The Great Organ of the Vienna Philharmonic Orchestra.',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/philharmonique-or-GENERAL.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/philharmonique-or-GENERAL.webp',
        lettering: 'WIENER PHILARMONIKER',
        description: 'Musical instruments of the Vienna Philharmonic Orchestra.Automatically translated',
        copyright: 'Godot & Fils',
      ),
      edge: null,
    ),
    CoinModel(
      id: '27',
      numistaId: '41418',
      name: 'Vienna Philharmonic | 1/2 Ounce',
      weight: 15.52,
      size: 28,
      thickness: 1.6,
      minYear: '2002',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/philharmonique-1-2-oz-or-50-euro-or-2020.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/philharmonique-1-2-oz-or-50-euro-or-2020.webp',
        lettering: 'REPUBLIK ÖSTERREICH\n½ UNZE GOLD 999.9\nDATE\n50 EURO',
        description: 'The Great Organ of the Vienna Philharmonic Orchestra.',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/philharmonique-or-GENERAL.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/philharmonique-or-GENERAL.webp',
        lettering: 'WIENER PHILHARMONIKER',
        description: 'The design is of musical instruments representing the Vienna Philharmonic Orchestra.',
        copyright: 'Godot & Fils',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '28',
      numistaId: '23519',
      name: 'Vienna Philharmonic | 1 Ounce',
      weight: 31.1,
      size: 37,
      thickness: 2,
      minYear: '2002',
      maxYear: '',
      composition: PreciousMetalTypeModel.gold,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/philharmonique-or-1oz-2020.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/philharmonique-or-1oz-2020.webp',
        lettering: '|REPUBLIK ÖSTERREICH\n1 UNZE GOLD 999.9\nDATE\n100 EURO',
        description: 'The Golden Hall organ',
        copyright: 'Godot & Fils',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/philharmonique-or-GENERAL.webp',
        thumbnailUrl:
            '${_kCorsProxy}https://cdn.achat-or-et-argent.fr/ressources_v4/images/pieces/au/thumbs/philharmonique-or-GENERAL.webp',
        lettering: 'WIENER PHILHARMONIKER',
        description: 'Musical instruments',
        copyright: 'Godot & Fils',
      ),
      edge: CoinFaceModel(
        pictureUrl: '',
        thumbnailUrl: '',
        lettering: '',
        description: 'Segmented reeding',
        copyright: '',
      ),
    ),
    CoinModel(
      id: '37',
      numistaId: '9165',
      name: 'Vienna Philharmonic | 1 Ounce',
      weight: 31.1,
      size: 37,
      thickness: 3.2,
      minYear: '2008',
      maxYear: '',
      composition: PreciousMetalTypeModel.silver,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/autriche/62b2beed57fdb7.04290240-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/autriche/62b2beed57fdb7.04290240-180.jpg',
        lettering: 'REPUBLIK ÖSTERREICH\n1 UNZE FEINSILBER\n2022\n1,50 EURO',
        description: 'The golden concert hall',
        copyright: 'layflags',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/autriche/62b2beedc36f02.68846977-original.jpg',
        thumbnailUrl: '${_kCorsProxy}https://fr.numista.com/catalogue/photos/autriche/62b2beedc36f02.68846977-180.jpg',
        lettering: 'WIENER PHILHARMONIKER\nSILBER',
        description: 'Music instruments',
        copyright: 'layflags',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Plain', copyright: ''),
    ),
    CoinModel(
      id: '38',
      numistaId: '353110',
      name: 'Britannia Charles III | 1 Ounce',
      weight: 31.2,
      size: 38.6,
      thickness: 3,
      minYear: '2023',
      maxYear: '',
      composition: PreciousMetalTypeModel.silver,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/royaume-uni/63d58db1788ed3.11086427-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/royaume-uni/63d58db1788ed3.11086427-180.jpg',
        lettering: 'CHARLES III·D·G·REX·F·D·2 POUNDS ·\nMJ',
        description: 'Uncrowned portrait of King Charles III left, legend around.',
        copyright: 'The Royal Mint, 2023',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/royaume-uni/63d58db24e9864.50030186-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/royaume-uni/63d58db24e9864.50030186-180.jpg',
        lettering: "BRITANNIA ' 2023 ' 1 oz ' 999 ' FINE ' SILVER '\nDECUS ET TUTAMEN\nNATHAN",
        description:
            'Standing image of Britannia holding a trident in her right hand, with a shield bearing the Union flag and an olive branch in her left hand, security padlock, legend around.',
        copyright: 'The Royal Mint, 2023',
      ),
      edge: CoinFaceModel(pictureUrl: '', thumbnailUrl: '', lettering: '', description: 'Reeded', copyright: ''),
    ),
    CoinModel(
      id: '39',
      numistaId: '298883',
      name: 'American Silver Eagle | 1 Ounce',
      weight: 31.1,
      size: 40.6,
      thickness: 2.98,
      minYear: '2021',
      maxYear: '',
      composition: PreciousMetalTypeModel.silver,
      purity: 9990,
      obverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60dbfaa3ed3aa9.37302635-original.jpg|https://fr.numista.com/catalogue/photos/etats-unis/60dbfaa3ed3aa9.37302635-180.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60dbfaa3ed3aa9.37302635-180.jpg',
        lettering: 'LIBERTY\nIN GOD\nWE TRUST\nAAW\n2021',
        description:
            'Liberty in full stride, enveloped in folds of the flag, with her right hand extended and branches of laurel and oak in her left.',
        copyright: 'Image courtesy of the United States Mint',
      ),
      reverse: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60dbfaa4d928d2.25807912-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/60dbfaa4d928d2.25807912-180.jpg',
        lettering: 'UNITED STATES OF AMERICA\n·ONE DOLLAR·\nE PLURIBUS UNUM\n1 OZ. FINE SILVER',
        description: 'An eagle as it approaches a landing, carrying an oak branch.',
        copyright: 'Image courtesy of the United States Mint',
      ),
      edge: CoinFaceModel(
        pictureUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/626fdf502f00f2.50312004-original.jpg',
        thumbnailUrl:
            '${_kCorsProxy}https://fr.numista.com/catalogue/photos/etats-unis/626fdf502f00f2.50312004-180.jpg',
        lettering: '',
        description: 'Reeded',
        copyright: 'Harryg',
      ),
    ),
  ];

  @override
  Future<CoinModel> getCoin({required int id}) async {
    return coins.firstWhere((e) => e.id == '$id');
  }

  @override
  Future<List<CoinModel>> searchCoin({required String query}) async {
    return coins.where((e) => e.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
