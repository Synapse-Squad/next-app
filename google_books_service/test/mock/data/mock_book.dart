import 'package:google_books_service/src/data/dtos/google_book_dto.dart';

final mockBook = GoogleBookDto(
  kind: 'books#volume',
  id: 'ByiFDwAAQBAJ',
  volumeInfo: VolumeInfoDto(
    title: 'Çərpələng uçuran',
    authors: ['Xalid Hüseyni'],
    publishedDate: '2018-01-01',
    pageCount: 450,
    language: 'az',
    previewLink:
        'http://books.google.com/books?id=ByiFDwAAQBAJ&pg=PA3&dq=%C3%A7%27'
        'rp%27l%27ng&hl=&cd=1&source=gbs_api',
    categories: ['Fiction'],
    description:
        'Xalid Hüseyninin bu debüt romanını artıq yeni əsrin baş romanı, '
        'müəllifini isə canlı klassik hesab eləyirlər. “Çərpaləng uçuran” bu '
        'an yaşanan müstəmləkəçilik sonrası yeni müstəmləkəçilik (neokolonial), '
        'qloballaşma, mədəniyyətlərarası savaş, vətəndaş müharibəsi və '
        'miqrasiya kimi mövzulara bədii baxış açısı gətirir. Bundan əlavə, '
        'müəllif xatirələr, aydınlatma, cinsi ilişkilər kimi qavrayışlara da '
        'toxunur. Kitab sözün əsl mənasında dostluq, sədaqət, xəyanət, '
        'günahlardan arınma haqqındadır və Xalid Hüseyninin bu incə, canayaxın, '
        'ironik və sözün yaxşı mənasında sentimental romanı doymadan və göz '
        'çəkə bilmədən baxdıqca baxılan möhtəşəm bir rəsm əsərinə bənzəyir. '
        'Müəllif, əsərin adından da göründüyü kimi, Əfqan uşaqlarının çərpələng '
        'uçurmaq əyləncəsini yada salır. Bu yarışlardan birində əsərin '
        'qəhrəmanlarından biri – Həzara (Xəzər) oğlu Həsənin başına dəhşətli '
        'hadisə gəlir, o bu hadisəyə dostu bildiyi Əmirin naminə razı olur, '
        'ancaq onu kədərləndirmək haqda düşünmür. Həmin dost isə, bu dəhşəti '
        'kənardan görür, lakin gizlənib səsini çıxarmır. Bununla da faciə '
        'böyüyür, getdikcə davam edir. Öz qorxaqlığından çıldıran Əmir '
        'ayılanda artıq gec olduğunu düşünür. Haçansa gec olurmu?',
    imageLinks: ImageLinkDto(
      smallThumbnail:
          'http://books.google.com/books/content?id=ByiFDwAAQBAJ&printsec='
          'frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
      thumbnail:
          'http://books.google.com/books/content?id=ByiFDwAAQBAJ&printsec='
          'frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    ),
  ),
);
