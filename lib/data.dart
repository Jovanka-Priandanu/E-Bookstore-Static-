// import package number format currency
import 'package:intl/intl.dart';

// class AllBook untuk variabel
class AllBook {
  final String title;
  final String author;
  final int price;
  final String image;
  final String category;
  final String desc;
  final String vol1;

  AllBook({required this.title, required this.author, required this.price, required this.image, required this.category, required this.desc, required this.vol1});
}

// class BookList untuk menyimpan array keseluruha  produk
class BookList {
  final List<AllBook> bookList = [
    AllBook(
        title:'Harry Potter (Full Bundle)',
        author: 'J.K Rowling', price: 3638595,
        image: 'assets/images/harrypotter.jpg',
        category: 'Novel',
        desc: '"Harry Potter Full Bundle" mencakup keseluruhan series dari Harry Potter and The Philosopher Stone, Harry Potter and the Chamber of Secrets, Harry Potter and the Prisoner of Azkaban, Harry Potter and the Goblet of Fire, Harry Potter and the Order of the Phoenix, Harry Potter and the Half-Blood Prince, hingga Harry Potter and the Deathly Hallows.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
  ),
    AllBook(
        title: 'Metro Complete Edition',
        author: 'Dmitry Glukhovsky',
        price: 250000,
        image: 'assets/images/metro.jpg',
        category: 'Novel',
        desc: '"Metro Complete Edition" mencakup seri lengkap novel bernuansa post-apocalypse ini. Dimulai dari seri Metro 2033, Metro 2034 dan Metro 2035.',
        vol1: 'Setelah perang nuklir global menghancurkan permukaan bumi, manusia yang selamat berlindung di sistem Metro Moskow. Permukaan bumi kini beracun dan dihuni oleh makhluk mutan berbahaya. Di bawah tanah, masyarakat terbagi dalam berbagai stasiun yang berfungsi seperti kota-kota kecil dengan ideologi yang berbeda. Stasiun VDNKh diserang oleh makhluk-makhluk mutan yang disebut "Dark Ones." Hunter, seorang prajurit yang tiba di VDNKh, meminta Artyom untuk pergi ke stasiun pusat, Polis, untuk memperingatkan tentang ancaman ini jika Hunter tidak kembali.Artyom memulai perjalanan berbahaya melalui sistem Metro. Dia bertemu berbagai kelompok dan individu, termasuk pedagang, tentara, dan pengungsi, yang membantu atau menghalangi perjalanannya. Sepanjang perjalanan, Artyom menghadapi berbagai bahaya seperti mutan, bandit, dan kondisi lingkungan yang keras. Dia juga menemukan berbagai komunitas dengan ideologi dan pemerintahan yang berbeda, menunjukkan keragaman dan perpecahan di Metro. Artyom mulai mengalami penglihatan dan mimpi yang aneh, mengindikasikan adanya koneksi dengan Dark Ones. Mereka digambarkan sebagai makhluk yang lebih kompleks dan bukan hanya sekadar ancaman fisik. Setelah perjalanan panjang dan penuh tantangan, Artyom tiba di Polis dan memperingatkan tentang Dark Ones. Sebuah misi diluncurkan untuk menghancurkan mereka menggunakan rudal yang tersisa dari perang nuklir. Di akhir cerita, Artyom berhasil meluncurkan rudal untuk menghancurkan sarang Dark Ones. Namun, dia menyadari bahwa Dark Ones mungkin mencoba berkomunikasi dan mencari perdamaian, bukan berperang. Keputusan Artyom membawa konsekuensi besar dan menimbulkan pertanyaan tentang kemanusiaan dan persepsi terhadap musuh.',
    ),
    AllBook(
        title: 'The Lord Of The Rings (Full Bundle)',
        author: 'J.R.R. Tolkien',
        price: 1670000,
        image: 'assets/images/ring.jpg',
        category: 'Novel',
        desc: '"The Lord of The Rings Full Bundle" mencakup keseluruhan seri novel The lord of the rings',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Harry Potter and The Philosopher Stone',
        author: 'J.K Rowling', price: 115000,
        image: 'assets/images/hp1.jpg',
        category: 'Novel',
        desc: '"Harry Potter and the Philosophers Stone" adalah novel fantasi karya J.K. Rowling yang mengisahkan tentang Harry Potter, seorang anak yatim piatu yang mengetahui bahwa dirinya adalah penyihir pada ulang tahunnya yang kesebelas. Harry mulai belajar di Hogwarts School of Witchcraft and Wizardry, di mana ia berteman dengan Ron Weasley dan Hermione Granger. Bersama-sama, mereka menjelajahi dunia sihir, mengungkap rahasia masa lalu Harry, dan berusaha mencegah seorang penyihir jahat mencuri Batu Bertuah yang dapat memberikan keabadian. Novel ini memperkenalkan pembaca kepada dunia sihir yang penuh petualangan, persahabatan, dan keberanian.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Harry Potter and The Chamber of Secret',
        author: 'J.K Rowling',
        price: 115000,
        image: 'assets/images/hp2.jpg',
        category: 'Novel',
        desc:'"Harry Potter and the Chamber of Secrets" adalah novel kedua dalam seri Harry Potter karya J.K. Rowling. Dalam novel ini, Harry Potter kembali untuk tahun keduanya di Hogwarts School of Witchcraft and Wizardry. Tahun ajaran ini terganggu oleh serangkaian serangan misterius yang membuat beberapa murid menjadi kaku seperti batu. Harry, bersama teman-temannya, Ron Weasley dan Hermione Granger, menyelidiki rumor tentang Kamar Rahasia yang konon tersembunyi di Hogwarts. Mereka menemukan bahwa kamar tersebut telah dibuka dan monster berbahaya berkeliaran di sekolah. Dengan bantuan dari sekutu yang tidak terduga, Harry menghadapi ancaman besar dan mengungkap kebenaran di balik serangan-serangan tersebut, serta menyelamatkan sekolah dari bahaya besar.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Bumi',
        author: 'Tere Liye',
        price: 92000,
        image: 'assets/images/bumi.jpg',
        category: 'Novel',
        desc: '"Bumi" adalah novel fantasi karya Tere Liye yang mengisahkan petualangan seorang gadis remaja bernama Raib. Raib memiliki kemampuan istimewa untuk menghilang dan menyembunyikan diri sejak kecil. Bersama dua temannya, Seli yang bisa mengeluarkan listrik dan Ali yang sangat cerdas, mereka menemukan dunia paralel bernama Klan Bulan. Di sana, mereka menghadapi berbagai tantangan dan bahaya, serta mengungkap banyak rahasia tentang diri mereka dan dunia tersebut. Novel ini adalah bagian pertama dari seri "Bumi" yang penuh dengan petualangan, persahabatan, dan penemuan jati diri.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Hamlet',
        author: 'William Shakespeare',
        price: 139999,
        image: 'assets/images/hamlet.jpg',
        category: 'Sastra',
        desc: '"Hamlet" adalah tragedi klasik karya William Shakespeare yang mengisahkan perjalanan tragis Pangeran Hamlet dari Denmark. Setelah kematian mendadak ayahnya, Raja Hamlet, sang pangeran merasa terguncang ketika mengetahui bahwa ibunya, Ratu Gertrude, dengan cepat menikah lagi dengan pamannya, Claudius, yang kini menjadi raja. Suatu malam, roh ayahnya muncul dan mengungkapkan bahwa ia dibunuh oleh Claudius. Hamlet bertekad untuk membalas dendam, tetapi kebingungan dan keraguan membuatnya mengambil keputusan yang tragis dan rumit. Drama ini mengeksplorasi tema-tema kematian, pengkhianatan, kegilaan, dan moralitas, serta menampilkan beberapa monolog paling terkenal dalam sastra Inggris, termasuk "To be, or not to be."',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Atomic Habits',
        author: 'James Clear',
        price: 168000,
        image: 'assets/images/atomic.jpg',
        category: 'Edukasi',
        desc:'"Atomic Habits" adalah buku pengembangan diri karya James Clear yang menawarkan panduan praktis untuk membentuk kebiasaan baik dan menghilangkan kebiasaan buruk. Clear mengajarkan bahwa perubahan kecil dan konsisten—atau "atomic habits"—dapat menghasilkan perbaikan besar dalam jangka panjang. Buku ini menjelaskan konsep-konsep seperti Hukum Empat Kebiasaan, yang mencakup cara membuat kebiasaan lebih jelas, menarik, mudah, dan memuaskan. Dengan menggunakan penelitian ilmiah dan berbagai contoh nyata, Clear menunjukkan bagaimana mengubah perilaku sehari-hari dapat membawa dampak besar pada produktivitas, kesehatan, dan kehidupan secara keseluruhan.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(title: 'Konosuba Vol 1',
        author: 'Natsume Akatsuki',
        price: 89000,
        image: 'assets/images/konosuba.jpg',
        category: 'Light Novel',
        desc: '"KonoSuba: God`s Blessing on This Wonderful World! Vol. 1" adalah volume pertama dari seri light novel komedi fantasi yang ditulis oleh Natsume Akatsuki. Ceritanya mengikuti Kazuma Satou, seorang remaja yang meninggal dalam kecelakaan lalu lintas dan diberi kesempatan untuk bereinkarnasi di dunia fantasi oleh dewi bernama Aqua. Diberi pilihan untuk membawa satu benda atau kekuatan bersamanya, Kazuma secara impulsif memilih Aqua sendiri. Namun, ia segera menyadari bahwa Aqua tidak seberguna yang ia kira. Bersama dengan dua petualang aneh lainnya, Megumin, seorang penyihir ledakan, dan Darkness, seorang kesatria masokis, mereka membentuk tim yang kocak dan ceroboh. Novel ini penuh dengan humor, petualangan, dan situasi konyol saat mereka mencoba untuk bertahan hidup dan mengatasi berbagai tantangan di dunia baru mereka',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
    AllBook(
        title: 'Moby-Dick',
        author: 'Herman Meville',
        price: 120000,
        image: 'assets/images/mobydick.jpg',
        category: 'Novel',
        desc:'"Moby-Dick" adalah novel klasik karya Herman Melville yang pertama kali diterbitkan pada tahun 1851. Ceritanya berpusat pada perjalanan kapal penangkap paus bernama Pequod, yang dipimpin oleh Kapten Ahab. Ahab terobsesi dengan balas dendam terhadap Moby Dick, paus sperma putih raksasa yang pernah merenggut kakinya. Narator cerita ini adalah Ishmael, seorang pelaut yang bergabung dengan kru Pequod. Melalui perjalanan mereka, novel ini menggali tema-tema seperti kegilaan, determinasi, dan alam semesta yang penuh teka-teki. "Moby-Dick" tidak hanya terkenal karena ceritanya yang epik dan karakter yang mendalam, tetapi juga karena gaya penulisan Melville yang kaya dan simbolisme yang kompleks.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',

    ),
    AllBook(
        title: 'Python for Dummies',
        author: 'Stef Maruch',
        price: 78500,
        image: 'assets/images/python-dummies.jpg',
        category: 'Sastra',
        desc: '"Python for Dummies" adalah buku panduan pemrograman yang ditulis oleh Stef Maruch dan Aahz Maruch. Buku ini dirancang untuk pemula yang ingin belajar bahasa pemrograman Python dari dasar. "Python for Dummies" menjelaskan konsep-konsep pemrograman secara sederhana dan praktis, mulai dari instalasi Python, penulisan skrip dasar, hingga pemahaman struktur data dan pengembangan aplikasi. Buku ini juga mencakup banyak contoh kode, latihan praktis, dan tip untuk menghindari kesalahan umum. Dengan gaya penulisan yang ramah dan informatif, buku ini membantu pembaca memulai perjalanan mereka dalam pemrograman dengan Python dengan mudah dan efektif.',
        vol1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
    ),
  ];

  // membuat variabel untuk setting currency (untuk price)
  final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

  // return array
  List<AllBook> getBooks() {
    return bookList;
  }

  // return currency
  NumberFormat getCurrencyFormat() {
    return currencyFormat;
  }
}
