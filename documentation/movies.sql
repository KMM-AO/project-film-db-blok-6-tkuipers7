-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 05 dec 2020 om 21:07
-- Serverversie: 10.4.11-MariaDB
-- PHP-versie: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL COMMENT 'id van de gender',
  `name` varchar(50) NOT NULL COMMENT 'naam van de gender'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(0, 'Unspecified'),
(1, 'Female'),
(2, 'Male');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genres`
--

CREATE TABLE `genres` (
  `tmdb_genre_id` int(11) UNSIGNED NOT NULL COMMENT 'id van de genre vanuit de API',
  `name` varchar(50) NOT NULL COMMENT 'de naam van de genre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `genres`
--

INSERT INTO `genres` (`tmdb_genre_id`, `name`) VALUES
(12, 'Adventure'),
(14, 'Fantasy'),
(16, 'Animation'),
(18, 'Drama'),
(27, 'Horror'),
(28, 'Action'),
(35, 'Comedy'),
(36, 'History'),
(37, 'Western'),
(53, 'Thriller'),
(80, 'Crime'),
(99, 'Documentary'),
(878, 'Science Fiction'),
(9648, 'Mystery'),
(10402, 'Music'),
(10749, 'Romance'),
(10751, 'Family'),
(10752, 'War'),
(10770, 'TV Movie');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `movies`
--

CREATE TABLE `movies` (
  `tmdb_id` int(11) UNSIGNED NOT NULL COMMENT 'id van de movie vanuit de API',
  `title` varchar(255) NOT NULL COMMENT 'de titel van de film',
  `original_title` varchar(255) NOT NULL COMMENT 'de orginele titel',
  `description` text NOT NULL COMMENT 'de beschrijving van de film',
  `adult` tinyint(1) NOT NULL COMMENT 'of de film 18+ is (true/false)',
  `runtime` int(50) UNSIGNED NOT NULL COMMENT 'hoelang de film duurt',
  `release_date` date NOT NULL COMMENT 'wanneer de film is uitgekomen',
  `poster_path` varchar(255) DEFAULT NULL COMMENT 'had pad naar de foto van de film (kan leeg zijn vanwege API)',
  `original_language` varchar(255) NOT NULL COMMENT 'de orginele gesproken taal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `movies`
--

INSERT INTO `movies` (`tmdb_id`, `title`, `original_title`, `description`, `adult`, `runtime`, `release_date`, `poster_path`, `original_language`) VALUES
(2, 'Ariel', 'Ariel', 'Taisto Kasurinen is a Finnish coal miner whose father has just committed suicide and who is framed for a crime he did not commit. In jail, he starts to dream about leaving the country and starting a new life. He escapes from prison but things don\'t go as planned...', 0, 73, '1988-10-21', '/ojDg0PGvs6R9xYFodRct2kdI6wC.jpg', 'fi'),
(3, 'Shadows in Paradise', 'Varjoja paratiisissa', 'An episode in the life of Nikander, a garbage man, involving the death of a co-worker, an affair and much more.', 0, 72, '1986-10-17', '/nj01hspawPof0mJmlgfjuLyJuRN.jpg', 'fi'),
(5, 'Four Rooms', 'Four Rooms', 'It\'s Ted the Bellhop\'s first night on the job...and the hotel\'s very unusual guests are about to place him in some outrageous predicaments. It seems that this evening\'s room service is serving up one unbelievable happening after another.', 0, 98, '1995-12-09', '/uZSmxBLIuZ8gpadjAWNdA5aQDAc.jpg', 'en'),
(6, 'Judgment Night', 'Judgment Night', 'While racing to a boxing match, Frank, Mike, John and Rey get more than they bargained for. A wrong turn lands them directly in the path of Fallon, a vicious, wise-cracking drug lord. After accidentally witnessing Fallon murder a disloyal henchman, the four become his unwilling prey in a savage game of cat & mouse as they are mercilessly stalked through the urban jungle in this taut suspense drama', 0, 110, '1993-10-15', '/rYFAvSPlQUCebayLcxyK79yvtvV.jpg', 'en'),
(8, 'Life in Loops (A Megacities RMX)', 'Life in Loops (A Megacities RMX)', 'Timo Novotny labels his new project an experimental music documentary film, in a remix of the celebrated film Megacities (1997), a visually refined essay on the hidden faces of several world \"megacities\" by leading Austrian documentarist Michael Glawogger. Novotny complements 30 % of material taken straight from the film (and re-edited) with 70 % as yet unseen footage in which he blends original shots unused by Glawogger with his own sequences (shot by Megacities cameraman Wolfgang Thaler) from Tokyo. Alongside the Japanese metropolis, Life in Loops takes us right into the atmosphere of Mexico City, New York, Moscow and Bombay. This electrifying combination of fascinating film images and an equally compelling soundtrack from Sofa Surfers sets us off on a stunning audiovisual adventure across the continents. The film also makes an original contribution to the discussion on new trends in documentary filmmaking. Written by KARLOVY VARY IFF 2006', 0, 80, '2006-01-01', NULL, 'en'),
(9, 'Sunday in August', 'Sonntag im August', '', 0, 15, '2004-09-02', NULL, 'de'),
(11, 'Star Wars', 'Star Wars', 'Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.', 0, 121, '1977-05-25', '/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg', 'en'),
(12, 'Finding Nemo', 'Finding Nemo', 'Nemo, an adventurous young clownfish, is unexpectedly taken from his Great Barrier Reef home to a dentist\'s office aquarium. It\'s up to his worrisome father Marlin and a friendly but forgetful fish Dory to bring Nemo home -- meeting vegetarian sharks, surfer dude turtles, hypnotic jellyfish, hungry seagulls, and more along the way.', 0, 100, '2003-05-30', '/8h0CG12Oft1GqthLmsctg8iuQQj.jpg', 'en'),
(13, 'Forrest Gump', 'Forrest Gump', 'A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.', 0, 142, '1994-07-06', '/clolk7rB5lAjs41SD0Vt6IXYLMm.jpg', 'en'),
(14, 'American Beauty', 'American Beauty', 'Lester Burnham, a depressed suburban father in a mid-life crisis, decides to turn his hectic life around after developing an infatuation with his daughter\'s attractive friend.', 0, 122, '1999-09-15', '/wby9315QzVKdW9BonAefg8jGTTb.jpg', 'en'),
(15, 'Citizen Kane', 'Citizen Kane', 'Newspaper magnate, Charles Foster Kane is taken from his mother as a boy and made the ward of a rich industrialist. As a result, every well-meaning, tyrannical or self-destructive move he makes for the rest of his life appears in some way to be a reaction to that deeply wounding event.', 0, 119, '1941-04-17', '/630cKYN0et63iZAUJJpowSL3vBU.jpg', 'en');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `movie_genre`
--

CREATE TABLE `movie_genre` (
  `id_movie` int(11) UNSIGNED NOT NULL COMMENT 'id van de movie',
  `id_genre` int(11) UNSIGNED NOT NULL COMMENT 'id van de genre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `movie_genre`
--

INSERT INTO `movie_genre` (`id_movie`, `id_genre`) VALUES
(2, 18),
(2, 80),
(2, 35),
(3, 18),
(3, 35),
(5, 80),
(5, 35),
(6, 28),
(6, 53),
(6, 80),
(8, 99),
(9, 18),
(11, 12),
(11, 28),
(11, 878),
(12, 16),
(12, 10751),
(13, 35),
(13, 18),
(13, 10749),
(14, 18),
(15, 9648),
(15, 18);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `movie_person`
--

CREATE TABLE `movie_person` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id van de relatie tussen de movie en de persoon',
  `id_movie` int(11) UNSIGNED NOT NULL COMMENT 'id van de movie',
  `id_person` int(11) UNSIGNED NOT NULL COMMENT 'id van de persoon',
  `role` varchar(50) NOT NULL COMMENT 'de role die de persoon had in de movie',
  `character_name` varchar(50) DEFAULT NULL COMMENT 'de naam van het gespeeld character (role = acteur)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `movie_person`
--

INSERT INTO `movie_person` (`id`, `id_movie`, `id_person`, `role`, `character_name`) VALUES
(6671, 2, 54768, 'actor', 'Taisto Olavi Kasurinen'),
(6672, 2, 54769, 'actor', 'Irmeli Katariina Pihlaja'),
(6673, 2, 4826, 'actor', 'Mikkonen'),
(6674, 2, 54770, 'actor', 'Riku'),
(6675, 2, 1177496, 'actor', 'Miner'),
(6676, 2, 2493350, 'actor', 'Mugger'),
(6677, 2, 2509142, 'actor', 'Accomplice'),
(6678, 2, 110757, 'actor', 'Tallyman'),
(6679, 2, 1034494, 'actor', 'Woman in the Harbour'),
(6680, 2, 2509144, 'actor', 'Man on the Beach'),
(6681, 2, 1207858, 'actor', 'Night Hostel Warden'),
(6682, 2, 2509145, 'actor', 'Man in the Night Hostel'),
(6683, 2, 53508, 'actor', 'Car Dealer'),
(6684, 2, 53512, 'actor', 'Judge'),
(6685, 2, 2509146, 'actor', 'Prison Doctor'),
(6686, 2, 4829, 'actor', 'Guard'),
(6687, 2, 2509147, 'actor', 'Guard'),
(6688, 2, 2509149, 'actor', 'Guard'),
(6689, 2, 1207842, 'actor', 'Mayor'),
(6690, 2, 56273, 'actor', 'Crook'),
(6691, 2, 2509151, 'actor', 'Doorman'),
(6692, 2, 2509152, 'actor', 'Skipper'),
(6693, 3, 4826, 'actor', 'Nikander'),
(6694, 3, 5999, 'actor', 'Ilona Rajamäki'),
(6695, 3, 4828, 'actor', 'Melartin'),
(6696, 3, 53508, 'actor', 'Co-worker'),
(6697, 3, 1086499, 'actor', 'Ilona\'s Girlfriend'),
(6698, 3, 222320, 'actor', 'Shop Steward'),
(6699, 3, 1086500, 'actor', 'Third Man'),
(6700, 3, 2307211, 'actor', 'Police'),
(6701, 3, 148389, 'actor', 'Nikander\'s Sister'),
(6702, 3, 1761924, 'actor', 'Pianist'),
(6703, 3, 2651471, 'actor', 'Pianist'),
(6704, 3, 106172, 'actor', 'Pelle'),
(6705, 3, 69552, 'actor', 'Staffan'),
(6706, 3, 2651474, 'actor', 'Melartin\'s Wife'),
(6707, 3, 1294421, 'actor', 'Cook'),
(6708, 3, 2651478, 'actor', 'Singer'),
(6709, 3, 2651481, 'actor', 'Man in the Restaurant'),
(6710, 3, 2651483, 'actor', 'Police'),
(6711, 3, 2651486, 'actor', 'Porter'),
(6712, 3, 2651487, 'actor', 'Woman in the Restaurant'),
(6713, 3, 2651488, 'actor', 'Hostess'),
(6714, 3, 2651489, 'actor', 'Garbage Man / Bartender'),
(6715, 3, 2651491, 'actor', 'Melartin\'s Daughter'),
(6716, 3, 16767, 'actor', 'Hotel Receptionist (uncredited)'),
(6717, 5, 3129, 'actor', 'Ted the Bellhop'),
(6718, 5, 3130, 'actor', 'Angela'),
(6719, 5, 3131, 'actor', 'Man'),
(6720, 5, 3124, 'actor', 'Athena'),
(6721, 5, 2555, 'actor', 'Siegfried'),
(6722, 5, 3122, 'actor', 'Jezebel'),
(6723, 5, 3123, 'actor', 'Diana'),
(6724, 5, 3125, 'actor', 'Elspeth'),
(6725, 5, 3126, 'actor', 'Eva'),
(6726, 5, 3127, 'actor', 'Raven'),
(6727, 5, 3128, 'actor', 'Kiva'),
(6728, 5, 3134, 'actor', 'Wife'),
(6729, 5, 3132, 'actor', 'Sarah'),
(6730, 5, 3135, 'actor', 'Juancho'),
(6731, 5, 3133, 'actor', 'Corpse'),
(6732, 5, 3136, 'actor', 'TV Dancing Girl'),
(6733, 5, 138, 'actor', 'Chester Rush'),
(6734, 5, 3137, 'actor', 'Norman'),
(6735, 5, 62, 'actor', 'Leo'),
(6736, 5, 3141, 'actor', 'Margaret'),
(6737, 5, 2545, 'actor', 'Long Hair Yuppy Scum'),
(6738, 5, 3138, 'actor', 'Betty'),
(6739, 5, 37336, 'actor', 'Hooker'),
(6740, 5, 3140, 'actor', 'Sam the Bellhop'),
(6741, 6, 2880, 'actor', 'Frank Wyatt'),
(6742, 6, 9777, 'actor', 'Mike Peterson'),
(6743, 6, 5724, 'actor', 'Fallon'),
(6744, 6, 12799, 'actor', 'Ray Cochran'),
(6745, 6, 11803, 'actor', 'Sykes'),
(6746, 6, 52422, 'actor', 'Teddy, the Kid'),
(6747, 6, 121667, 'actor', 'Rhodes'),
(6748, 6, 102710, 'actor', 'Travis'),
(6749, 6, 1077264, 'actor', 'Dre'),
(6750, 6, 154124, 'actor', 'Buck'),
(6751, 6, 55964, 'actor', 'Linda Wyatt'),
(6752, 6, 105988, 'actor', 'Clarissa'),
(6753, 6, 22621, 'actor', 'Rita'),
(6754, 6, 10822, 'actor', 'John Wyatt'),
(6755, 6, 1226696, 'actor', 'Charley'),
(6756, 9, 901, 'actor', 'Alexandra'),
(6757, 9, 902, 'actor', 'Er'),
(6758, 11, 2, 'actor', 'Luke Skywalker'),
(6759, 11, 3, 'actor', 'Han Solo'),
(6760, 11, 4, 'actor', 'Princess Leia Organa'),
(6761, 11, 5, 'actor', 'Grand Moff Tarkin'),
(6762, 11, 12248, 'actor', 'Obi-Wan \"Ben\" Kenobi'),
(6763, 11, 6, 'actor', 'C-3PO'),
(6764, 11, 130, 'actor', 'R2-D2'),
(6765, 11, 24343, 'actor', 'Chewbacca'),
(6766, 11, 24342, 'actor', 'Darth Vader (performer)'),
(6767, 11, 15152, 'actor', 'Darth Vader (voice)'),
(6768, 11, 33032, 'actor', 'Uncle Owen'),
(6769, 11, 131625, 'actor', 'Aunt Beru'),
(6770, 11, 132538, 'actor', 'Chief Jawa'),
(6771, 11, 216087, 'actor', 'General Dodonna'),
(6772, 11, 69249, 'actor', 'General Willard'),
(6773, 11, 47401, 'actor', 'Red Leader'),
(6774, 11, 47698, 'actor', 'Red Two (Wedge Antilles)'),
(6775, 11, 17356, 'actor', 'Red Three (Biggs Darklighter)'),
(6776, 11, 162432, 'actor', 'Red Four (John \"D\")'),
(6777, 11, 663, 'actor', 'Red Six (Porkins)'),
(6778, 11, 58475, 'actor', 'Gold Leader'),
(6779, 11, 151819, 'actor', 'Gold Two'),
(6780, 11, 202276, 'actor', 'Gold Five'),
(6781, 11, 42570, 'actor', 'General Taggi'),
(6782, 11, 12829, 'actor', 'General Motti'),
(6783, 11, 79489, 'actor', 'Commander #1'),
(6784, 11, 1729623, 'actor', 'Stormtrooper'),
(6785, 11, 1216947, 'actor', 'Red Two, Wedge Antilles (voice) (uncredited)'),
(6786, 11, 3044, 'actor', 'Stormtrooper (voice) (uncredited)'),
(6787, 11, 1271059, 'actor', 'Stormtrooper (uncredited)'),
(6788, 11, 1271060, 'actor', 'Cantina Alien (uncredited)'),
(6789, 11, 1271061, 'actor', 'Cantina Alien (uncredited)'),
(6790, 11, 199356, 'actor', 'Greedo (uncredited)'),
(6791, 11, 1271062, 'actor', 'Nabrun Leids (uncredited)'),
(6792, 11, 1271063, 'actor', 'Wuher (uncredited)'),
(6793, 11, 1271064, 'actor', 'Drifter (Red 12) (uncredited)'),
(6794, 11, 1271065, 'actor', 'Cantina Patron (uncredited)'),
(6795, 11, 1178140, 'actor', 'Stormtrooper (uncredited)'),
(6796, 11, 186229, 'actor', 'Wioslea (uncredited)'),
(6797, 11, 1271066, 'actor', 'Dr. Evazan (uncredited)'),
(6798, 11, 1271067, 'actor', 'Cantina Patron (uncredited)'),
(6799, 11, 104149, 'actor', 'Greedo (uncredited)'),
(6800, 11, 1271068, 'actor', 'Hrchek Kal Fas (uncredited)'),
(6801, 11, 1271069, 'actor', 'Jawa (uncredited)'),
(6802, 11, 53587, 'actor', 'Stormtrooper / Tusken Raider / Death Star Trooper '),
(6803, 11, 1271070, 'actor', 'Jawa (uncredited)'),
(6804, 11, 1271071, 'actor', 'Garindan (uncredited)'),
(6805, 11, 1271072, 'actor', 'Djas Puhr (uncredited)'),
(6806, 11, 202402, 'actor', 'Death Star Trooper (uncredited)'),
(6807, 11, 1271073, 'actor', 'Stormtrooper with Binoculars (uncredited)'),
(6808, 11, 1271074, 'actor', 'Cantina Patron (uncredited)'),
(6809, 11, 1195602, 'actor', 'Death Star Trooper (uncredited)'),
(6810, 11, 1271075, 'actor', 'Kabe (uncredited)'),
(6811, 11, 252527, 'actor', 'Kabe / Jawa / GONK Droid (uncredited)'),
(6812, 11, 1271076, 'actor', 'Cantina Patron (uncredited)'),
(6813, 11, 1271078, 'actor', 'Stormtrooper (uncredited)'),
(6814, 11, 964699, 'actor', 'Leia\'s Rebel Escort (uncredited)'),
(6815, 11, 1271079, 'actor', 'Stormtrooper (uncredited)'),
(6816, 11, 1271080, 'actor', 'Brea Tonnika (uncredited)'),
(6817, 11, 1271081, 'actor', 'Stormtrooper (uncredited)'),
(6818, 11, 1271082, 'actor', 'Ponda Baba (uncredited)'),
(6819, 11, 4945, 'actor', 'Death Star Trooper (uncredited)'),
(6820, 11, 1271083, 'actor', 'Mosep (uncredited)'),
(6821, 11, 1148750, 'actor', 'Chall Bekan (uncredited)'),
(6822, 11, 201344, 'actor', 'Solomohal (uncredited)'),
(6823, 11, 1271085, 'actor', 'Stormtrooper (voice) (uncredited)'),
(6824, 11, 1271086, 'actor', 'Jawa (uncredited)'),
(6825, 11, 1190780, 'actor', 'Jawa (uncredited)'),
(6826, 11, 190453, 'actor', 'Daine Jir (uncredited)'),
(6827, 11, 1012562, 'actor', 'BoShek (uncredited)'),
(6828, 11, 1271091, 'actor', 'Muftak / Cantina Band Member (uncredited)'),
(6829, 11, 1271092, 'actor', 'Temple Guard / Medal Bearer (uncredited)'),
(6830, 11, 1271095, 'actor', 'Jawa (uncredited)'),
(6831, 11, 1271096, 'actor', 'Takeel (uncredited)'),
(6832, 11, 1271102, 'actor', 'Death Star Gunner (uncredited)'),
(6833, 11, 1271104, 'actor', 'Cantina Patron (uncredited)'),
(6834, 11, 1271106, 'actor', 'Swilla Corey (uncredited)'),
(6835, 11, 1271107, 'actor', 'Massassi Base Rebel Scout (uncredited)'),
(6836, 11, 1183443, 'actor', 'Rycar Ryjerd (uncredited)'),
(6837, 11, 10657, 'actor', 'InCom Engineer (uncredited)'),
(6838, 11, 1271116, 'actor', 'Leesub Sirln (uncredited)'),
(6839, 11, 110319, 'actor', 'Cmdr. Praji (Imperial Officer #2 on rebel ship) (u'),
(6840, 11, 1271121, 'actor', 'Tawss Khaa (uncredited)'),
(6841, 11, 1271122, 'actor', 'Senni Tonnika (uncredited)'),
(6842, 11, 1271123, 'actor', 'Cantina Patron (uncredited)'),
(6843, 11, 1271124, 'actor', 'Cantina Patron (uncredited)'),
(6844, 11, 1271125, 'actor', 'Sai\'torr Kal Fas (uncredited)'),
(6845, 11, 187398, 'actor', 'Lt. Pol Treidum (uncredited)'),
(6846, 11, 1271126, 'actor', 'Cantina Voices (voice) (uncredited)'),
(6847, 11, 390158, 'actor', 'Massassi Outpost Announcer / Various Voices (voice'),
(6848, 11, 166258, 'actor', 'Lt. Shann Childsen (uncredited)'),
(6849, 11, 7727, 'actor', 'Cantina Alien (uncredited)'),
(6850, 11, 184980, 'actor', 'Del Goren (uncredited)'),
(6851, 11, 160947, 'actor', 'Stormtrooper (voice) (uncredited)'),
(6852, 11, 161301, 'actor', 'Stormtrooper (voice) (uncredited)'),
(6853, 11, 1271127, 'actor', 'Jawa (uncredited)'),
(6854, 11, 159108, 'actor', 'Greedo (voice) (uncredited)'),
(6855, 11, 1271128, 'actor', 'Thuku (uncredited)'),
(6856, 11, 24278, 'actor', 'Stormtrooper (uncredited)'),
(6857, 11, 1271131, 'actor', 'Cantina Patron (uncredited)'),
(6858, 11, 301657, 'actor', 'Rebel Pilot, Col. Takbright (uncredited)'),
(6859, 11, 1490615, 'actor', 'Jabba\'s Henchman (uncredited)'),
(6860, 11, 227857, 'actor', 'Sandtrooper / Fixer (uncredited)'),
(6861, 11, 2646226, 'actor', 'BoShek (uncredited)'),
(6862, 12, 13, 'actor', 'Marlin (voice)'),
(6863, 12, 14, 'actor', 'Dory (voice)'),
(6864, 12, 12, 'actor', 'Nemo (voice)'),
(6865, 12, 5293, 'actor', 'Gill (voice)'),
(6866, 12, 18, 'actor', 'Bloat (voice)'),
(6867, 12, 19, 'actor', 'Peach (voice)'),
(6868, 12, 6168, 'actor', 'Gurgle (voice)'),
(6869, 12, 17401, 'actor', 'Bubbles (voice)'),
(6870, 12, 14723, 'actor', 'Deb / Flo (voice)'),
(6871, 12, 7911, 'actor', 'Jacques (voice)'),
(6872, 12, 118, 'actor', 'Nigel (voice)'),
(6873, 12, 7, 'actor', 'Crush (voice)'),
(6874, 12, 20, 'actor', 'Coral (voice)'),
(6875, 12, 981048, 'actor', 'Squirt (voice)'),
(6876, 12, 10, 'actor', 'Mr. Ray (voice)'),
(6877, 12, 22, 'actor', 'Bruce (voice)'),
(6878, 12, 8783, 'actor', 'Anchor (voice)'),
(6879, 12, 27752, 'actor', 'Chum (voice)'),
(6880, 12, 23, 'actor', 'Dentist (voice)'),
(6881, 12, 981049, 'actor', 'Darla (voice)'),
(6882, 12, 1211731, 'actor', 'Tad (voice)'),
(6883, 12, 1372790, 'actor', 'Pearl (voice)'),
(6884, 12, 17190, 'actor', 'Sheldon (voice)'),
(6885, 12, 7907, 'actor', 'Fish School (voice)'),
(6886, 12, 19545, 'actor', 'Additional Voices (voice)'),
(6887, 12, 84493, 'actor', 'Additional Voices (voice)'),
(6888, 13, 31, 'actor', 'Forrest Gump'),
(6889, 13, 32, 'actor', 'Jenny Curran'),
(6890, 13, 33, 'actor', 'Dan Taylor'),
(6891, 13, 34, 'actor', 'Bubba'),
(6892, 13, 35, 'actor', 'Mrs. Gump'),
(6893, 13, 37821, 'actor', 'Young Forrest Gump'),
(6894, 13, 204997, 'actor', 'Young Jenny Curran'),
(6895, 13, 9640, 'actor', 'Forrest Gump Jr.'),
(6896, 13, 6751, 'actor', 'School Bus Driver'),
(6897, 13, 37825, 'actor', 'Drill Sergeant'),
(6898, 13, 37822, 'actor', 'Young Elvis Presley'),
(6899, 13, 37823, 'actor', 'College Football Coach'),
(6900, 13, 951881, 'actor', 'Barber'),
(6901, 13, 36221, 'actor', 'Principal'),
(6902, 13, 1215432, 'actor', 'Louise'),
(6903, 13, 1019727, 'actor', 'Boy with cross'),
(6904, 13, 37832, 'actor', 'Jenny\'s Father'),
(6905, 13, 29934, 'actor', 'High School Football Coach'),
(6906, 13, 14526, 'actor', 'Recruiter'),
(6907, 13, 6310, 'actor', 'Newscaster'),
(6908, 13, 154697, 'actor', 'Earl'),
(6909, 13, 37831, 'actor', 'Bubba\'s Mother'),
(6910, 13, 37830, 'actor', 'Bubba\'s Great Grandmother'),
(6911, 13, 975108, 'actor', 'Jenny\'s Date'),
(6912, 13, 129725, 'actor', 'Local Anchor #1'),
(6913, 13, 1748207, 'actor', 'Local Anchor #2'),
(6914, 13, 37824, 'actor', 'John F. Kennedy (voice)'),
(6915, 13, 1346510, 'actor', 'Army Recruiter'),
(6916, 13, 1088274, 'actor', 'Barracks Recruit'),
(6917, 13, 114326, 'actor', 'Club Patron'),
(6918, 13, 170051, 'actor', 'Club Patron'),
(6919, 13, 95140, 'actor', 'Club Patron'),
(6920, 13, 1446990, 'actor', 'Helicopter Gunman'),
(6921, 13, 1401994, 'actor', 'Cleveland'),
(6922, 13, 1235787, 'actor', 'Tex'),
(6923, 13, 163441, 'actor', 'Army Hospital Male Nurse'),
(6924, 13, 92658, 'actor', 'Wounded soldier'),
(6925, 13, 1089167, 'actor', 'Wounded Soldier'),
(6926, 13, 2207913, 'actor', 'Army Nurse'),
(6927, 13, 81692, 'actor', 'Hospital Officer'),
(6928, 13, 37827, 'actor', 'President Johnson (voice)'),
(6929, 13, 1313819, 'actor', 'Isabel'),
(6930, 13, 1409948, 'actor', 'Abbie Hoffman'),
(6931, 13, 1618488, 'actor', 'Black Panther'),
(6932, 13, 46921, 'actor', 'Black Panther'),
(6933, 13, 148122, 'actor', 'Wesley'),
(6934, 13, 406976, 'actor', 'Hollywood Boulevard Girlfriend'),
(6935, 13, 2207912, 'actor', 'Hollywood Boulevard Girlfriend'),
(6936, 13, 10565, 'actor', 'Dick Cavett'),
(6937, 13, 1405338, 'actor', 'Carla'),
(6938, 13, 21129, 'actor', 'Lenore'),
(6939, 13, 86434, 'actor', 'President Nixon (voice)'),
(6940, 13, 1465241, 'actor', 'Discharge Officer'),
(6941, 13, 92343, 'actor', 'Drugged Out Boyfriend'),
(6942, 13, 37828, 'actor', 'Elderly Southern Woman'),
(6943, 13, 1327149, 'actor', 'Waitress in cafe'),
(6944, 13, 37829, 'actor', 'Taxi Driver'),
(6945, 13, 176329, 'actor', 'Aging Hippie'),
(6946, 13, 169643, 'actor', 'Wild Eyed Man'),
(6947, 13, 196855, 'actor', 'Crony'),
(6948, 13, 98873, 'actor', 'Football Player (uncredited)'),
(6949, 13, 13204, 'actor', 'Cheerleader (uncredited)'),
(6950, 13, 84901, 'actor', 'Football Coach (uncredited)'),
(6951, 13, 1392671, 'actor', 'Barracks Recruit (uncredited)'),
(6952, 13, 1273540, 'actor', 'National Guardsman (uncredited)'),
(6953, 13, 42961, 'actor', 'Football Fan (uncredited)'),
(6954, 13, 1150593, 'actor', 'Football Player (uncredited)'),
(6955, 13, 567126, 'actor', 'Black Panther (uncredited)'),
(6956, 13, 173277, 'actor', 'Nicholas Katzenbach (uncredited)'),
(6957, 13, 23967, 'actor', 'Jenny\'s Babysitter (uncredited)'),
(6958, 13, 6856, 'actor', 'Elvis Presley (voice) (uncredited)'),
(6959, 13, 1806640, 'actor', 'Club Patron (uncredited)'),
(6960, 13, 2428975, 'actor', 'University Dean'),
(6961, 14, 1979, 'actor', 'Lester Burnham'),
(6962, 14, 516, 'actor', 'Carolyn Burnham'),
(6963, 14, 2155, 'actor', 'Jane Burnham'),
(6964, 14, 8210, 'actor', 'Ricky Fitts'),
(6965, 14, 8211, 'actor', 'Angela Hayes'),
(6966, 14, 2955, 'actor', 'Colonel Frank Fitts'),
(6967, 14, 19, 'actor', 'Barbara Fitts'),
(6968, 14, 8212, 'actor', 'Buddy Kane'),
(6969, 14, 2154, 'actor', 'Jim Olmeyer'),
(6970, 14, 8213, 'actor', 'Jim Berkley'),
(6971, 14, 8214, 'actor', 'Brad Dupree'),
(6972, 14, 68842, 'actor', 'Sale House Man #1'),
(6973, 14, 1658382, 'actor', 'Sale House Man #2'),
(6974, 14, 9634, 'actor', 'Sale House Man #3'),
(6975, 14, 64189, 'actor', 'Sale House Woman #1'),
(6976, 14, 166961, 'actor', 'Sale House Woman #2'),
(6977, 14, 1397945, 'actor', 'Sale House Woman #3'),
(6978, 14, 152796, 'actor', 'Sale House Woman #4'),
(6979, 14, 42715, 'actor', 'Christy Kane'),
(6980, 14, 12223, 'actor', 'Catering Boss'),
(6981, 14, 76742, 'actor', 'Janine'),
(6982, 14, 1441804, 'actor', 'Mr. Smiley\'s Manager'),
(6983, 14, 177623, 'actor', 'Firing Range Attendant'),
(6984, 14, 1448568, 'actor', 'Young Jane'),
(6985, 14, 101687, 'actor', 'Spartanette #1'),
(6986, 14, 1503019, 'actor', 'Spartanette #2'),
(6987, 14, 1503020, 'actor', 'Spartanette #3'),
(6988, 14, 1503021, 'actor', 'Spartanette #4'),
(6989, 14, 1503022, 'actor', 'Spartanette #5'),
(6990, 14, 1503023, 'actor', 'Spartanette #6'),
(6991, 14, 1503024, 'actor', 'Spartanette #7'),
(6992, 14, 1503030, 'actor', 'Spartanette #8'),
(6993, 14, 568656, 'actor', 'Spartanette #9'),
(6994, 14, 1503025, 'actor', 'Spartanette #10'),
(6995, 14, 1503026, 'actor', 'Playground Girl #1'),
(6996, 14, 1219143, 'actor', 'Playground Girl #2'),
(6997, 14, 1503027, 'actor', 'Newscaster (uncredited)'),
(6998, 14, 1503028, 'actor', 'Wedding Guest (uncredited)'),
(6999, 14, 1503029, 'actor', 'Advertising Executive (uncredited)'),
(7000, 14, 8215, 'actor', 'Bartender (uncredited)'),
(7001, 15, 40, 'actor', 'Charles Foster Kane'),
(7002, 15, 7664, 'actor', 'Jedediah Leland'),
(7003, 15, 11029, 'actor', 'Susan Alexander Kane'),
(7004, 15, 14518, 'actor', 'Jim W. Gettys'),
(7005, 15, 11028, 'actor', 'Walter Parks Thatcher'),
(7006, 15, 11025, 'actor', 'Mary Kane'),
(7007, 15, 11033, 'actor', 'Raymond'),
(7008, 15, 11026, 'actor', 'Emily Norton Kane'),
(7009, 15, 14364, 'actor', 'Herbert Carter'),
(7010, 15, 11030, 'actor', 'Jerry Thompson/Narrator'),
(7011, 15, 11027, 'actor', 'Mr. Bernstein'),
(7012, 15, 14979, 'actor', 'Signor Matiste'),
(7013, 15, 33743, 'actor', 'John'),
(7014, 15, 11031, 'actor', 'Mr. Rawlston'),
(7015, 15, 105021, 'actor', 'Bertha Anderson'),
(7016, 15, 4077, 'actor', 'Jim Kane'),
(7017, 15, 1198371, 'actor', 'Charles Foster Kane III'),
(7018, 15, 11032, 'actor', 'Young Charles Foster Kane'),
(7019, 15, 8504, 'actor', 'Interviewer'),
(7020, 15, 945285, 'actor', 'Man at Party in Everglades (uncredited)'),
(7021, 15, 70261, 'actor', 'Pianist in \'El Rancho\' (uncredited)'),
(7022, 15, 9096, 'actor', 'Gino (uncredited)'),
(7023, 15, 1142371, 'actor', 'Extra (uncredited)'),
(7024, 15, 1369283, 'actor', 'Newsreel Man (uncredited)'),
(7025, 15, 1099216, 'actor', 'Newsreel Man (uncredited)'),
(7026, 15, 1422325, 'actor', 'Newsreel Man (uncredited)'),
(7027, 15, 1596347, 'actor', 'Newsreel Man (uncredited)'),
(7028, 15, 198219, 'actor', 'Newsreel Man (uncredited)'),
(7029, 15, 1423323, 'actor', 'Newsreel Man (uncredited)'),
(7030, 15, 1506412, 'actor', 'Newsreel Man (uncredited)'),
(7031, 15, 1543340, 'actor', 'Newsreel Man (uncredited)'),
(7032, 15, 975503, 'actor', 'Newsreel Man (uncredited)'),
(7033, 15, 1291801, 'actor', 'Man at Xanadu Great Hall (uncredited)'),
(7034, 15, 1034935, 'actor', 'Man at Xanadu Great Hall (uncredited)'),
(7035, 15, 122984, 'actor', 'Man at Xanadu Great Hall (uncredited)'),
(7036, 15, 939834, 'actor', 'Maid in Xanadu Hall (uncredited)'),
(7037, 15, 590519, 'actor', 'Man at Boat Dock (uncredited)'),
(7038, 15, 1199823, 'actor', 'Man at Boat Dock (uncredited)'),
(7039, 15, 1283209, 'actor', 'Man at Boat Dock (uncredited)'),
(7040, 15, 1234546, 'actor', 'Woman at Boat Dock (uncredited)'),
(7041, 15, 1550460, 'actor', 'City Room Employee (uncredited)'),
(7042, 15, 940329, 'actor', 'City Editor (uncredited)'),
(7043, 15, 1295853, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7044, 15, 1404180, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7045, 15, 1731500, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7046, 15, 1468172, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7047, 15, 1331758, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7048, 15, 1170356, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7049, 15, 1419570, 'actor', 'Man Singing at Inquirer Party (uncredited)'),
(7050, 15, 1420567, 'actor', 'Man Singing at Inquirer Party (uncredited)');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `people`
--

CREATE TABLE `people` (
  `tmdb_person_id` int(11) UNSIGNED NOT NULL COMMENT 'id van de persoon vanuit de tmdb API',
  `name` varchar(255) NOT NULL COMMENT 'naam van de persoon',
  `biography` text NOT NULL COMMENT 'biografie van de persoon',
  `gender_id` int(11) NOT NULL COMMENT 'de gender van de persoon',
  `date_of_birth` date DEFAULT NULL COMMENT 'geboorte datum van de persoon. mag leeg zijn want API kan ook NULL geven',
  `date_of_death` date DEFAULT NULL COMMENT 'wanneer iemand dood ging. mag leeg zijn want ze kunnen nog leven',
  `place_of_birth` varchar(255) DEFAULT NULL COMMENT 'geboorteplaats van de persoon. mag leeg zijn want API kan ook NULL geven',
  `profile_path` varchar(255) DEFAULT NULL COMMENT 'het pad om de foto van de persoon op te halen. required de base path van de api'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `people`
--

INSERT INTO `people` (`tmdb_person_id`, `name`, `biography`, `gender_id`, `date_of_birth`, `date_of_death`, `place_of_birth`, `profile_path`) VALUES
(2, 'Mark Hamill', 'Mark Richard Hamill (born September 25, 1951) is an American actor, voice artist, producer, director, and writer. Hamill is best known for his role as Luke Skywalker in the original Star Wars trilogy and also well known for voice-acting characters such as the Joker in various animated series, animated films and video games, beginning with Batman: The Animated Series, the Skeleton king in Super Robot Monkey Team Hyperforce Go!, Fire Lord Ozai in Avatar: The Last Airbender, Master Eraqus in Kingdom Hearts: Birth by Sleep, Skips in Regular Show, and Senator Stampington on Metalocalypse.', 2, '1951-09-25', NULL, 'Concord, California, USA', '/9Wws35pCsT0KoZpiV4Gk5nbn9ZD.jpg'),
(3, 'Harrison Ford', 'Legendary Hollywood Icon Harrison Ford was born on July 13, 1942 in Chicago, Illinois.  His family history includes a strong lineage of actors, radio personalities, and models.  Harrison attended public high school in Park Ridge, Illinois where he was a member of the school Radio Station WMTH. Harrison worked as the lead voice for sports reporting at WMTH for several years.  Acting wasn’t a major interest to Ford until his junior year at Ripon College when he first took an acting class.  Harrison Ford’s career started in 1964 when he travelled to California in search of a voice-over job. He never received that position, but instead signed a contract with Columbia Pictures where he earned $150 weekly to play small fill in roles in various films.  Through the 60’s Harrison worked on several TV shows including Gunsmoke, Ironside, Kung Fu, and American Style.  It wasn’t until 1967 that Harrison received his first credited role in the Western film, A Time for Killing. Dissatisfied with the meager roles he was being offered, Ford took a hiatus from acting to work as a self-employed carpenter. This seemingly odd diversion turned out to be a blessing in disguise for Harrison’s acting career when he was soon hired by famous film producer George Lucas.  This was a turning point in Harrison’s life that led to him be casted in milestone roles such as Hans Solo and Indiana Jones.  Since his most famous roles in the Star Wars Trilogy and Raiders of the Lost Ark, Harrison Ford has starred in over 40 films.  Many criticize his recent work, saying his performances have been lackluster leading to commercially disappointing films.  Harrison has always worked hard to protect his off-screen private life, keeping details about his children and marriages quite.  He has a total of five children including one recent adoption with third and current wife Calista Flockhart. In addition to acting Harrison Ford is passionate about environmental conservation, aviation, and archeology.', 2, '1942-07-13', NULL, 'Chicago, Illinois, USA', '/5M7oN3sznp99hWYQ9sX0xheswWX.jpg'),
(4, 'Carrie Fisher', 'Carrie Frances Fisher (21 October 1956 - 27 December 2016) was an American actress, novelist, screenwriter, and lecturer. She is most famous for her portrayal of Princess Leia Organa in the original Star Wars trilogy, her bestselling novel Postcards from the Edge, for which she wrote the screenplay to the film of the same name, and her autobiography Wishful Drinking.', 1, '1956-10-21', '2016-12-27', 'Beverly Hills, Los Angeles, California, USA', '/rfJtncHewKVnHjqpIZvjn24ESeC.jpg'),
(5, 'Peter Cushing', 'Peter Wilton Cushing, OBE  (26 May 1913 – 11 August 1994) was an English actor, known for his many appearances in Hammer Films, in which he played Baron Frankenstein and Dr. Van Helsing, amongst many other roles, often appearing opposite Christopher Lee, and occasionally Vincent Price. A familiar face on both sides of the Atlantic, his most famous roles outside of \"Hammer Horror\" include his many appearances as Sherlock Holmes, as Grand Moff Tarkin in Star Wars (1977) and as the mysterious Doctor Who in Doctor Who and the Daleks and Daleks - Invasion Earth 2150 AD in 1965 and 1966, two cinema films based on the television series Doctor Who.\n\nDescription above from the Wikipedia article Peter Cushing, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1913-05-26', '1994-08-11', 'Kenley, Surrey, England, UK', '/rxfWFGJm35qJb2jy0jlauhYeNgV.jpg'),
(6, 'Anthony Daniels', 'Anthony Daniels (born 21 February 1946) is an English actor. He is best known for his role as the droid C-3PO in the Star Wars series of films made between 1977 and 2005.\n\nDescription above from the Wikipedia article Anthony Daniels, licensed under CC-BY-SA, full list of contributors on Wikipedia.​', 2, '1946-02-21', NULL, 'Salisbury, Wiltshire, England, UK', '/7kR4kwXtvXtvrsxWeX3QLX5NS5V.jpg'),
(7, 'Andrew Stanton', 'Andrew Stanton (born December 3, 1965) is an American film director, screenwriter, producer, and occasional voice actor based at Pixar Animation Studios. His film work includes writing and directing Finding Nemo and WALL-E; both films earned him the Academy Award for Best Animated Feature.\n\nDescription above from the Wikipedia article Andrew Stanton, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1965-12-03', NULL, 'Boston, Massachusetts, USA', '/tRwWuo06aN9vuXAPaswMN42x2ii.jpg'),
(10, 'Bob Peterson', 'Robert \"Bob\" Peterson (born January 1961) is an American animator, screenwriter, director and voice actor, who has worked for Pixar since 1994. His first job was working as a layout artist and animator on Toy Story. He was nominated for an Oscar for his screenplay for Finding Nemo. Petersonis a co-director and the writer of Up, which gained him his second Oscar nomination. He also performed the voices of Roz in Monsters, Inc., Mr. Ray in Finding Nemo, Dug the dog and Alpha the dog in Up and in Dug\'s Special Mission, and the Janitor in Toy Story 3.\n\nPeterson  was born in Wooster, Ohio, his family moved to Dover, Ohio, where he graduated from Dover High School. He received his undergraduate degree from Ohio Northern University, and a Master\'s degree in mechanical engineering from Purdue University in 1986. While attending Purdue, he wrote and illustrated the comic strip Loco Motives for the Purdue Exponent. Prior to coming to Pixar, Peterson worked at Wavefront Technologies and Rezn8 Productions.\n\nIn 2008,  Peterson played the part of Terry Cane, a puppeteer in Dan Scanlon\'s first feature film Tracy. He also played additional voices in Tokyo Mater in 2008, and the voice of Mr. Ray for the Finding Nemo Submarine Voyage ride at Disneyland Park in 2007. His most  recent job at Pixar was voicing the Janitor at Sunnyside Daycare Center in Pixar\'s 11th film, Toy Story 3, which was released on June 18, 2010.\n\nDescription above from the Wikipedia article Bob  Peterson (animator), licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1961-01-18', NULL, 'Wooster, Ohio, USA', '/1D5PtC97QwIks6xTjbJ1HNE8kbT.jpg'),
(12, 'Alexander Gould', 'From Wikipedia, the free encyclopedia.\n\nAlexander Jerome Gould (born May 4, 1994) is an American television actor and voice artist. He is best known for his role as Shane Botwin on the Showtime TV series Weeds and for having provided the voice of Nemo in Pixar\'s Finding Nemo.\n\nDescription above from the Wikipedia article Alexander Gould, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1994-05-04', NULL, 'Los Angeles, California, USA', '/4wOePXDww8YAKOwhBBCFScpPKCa.jpg'),
(13, 'Albert Brooks', 'Albert Lawrence Brooks (born Albert Lawrence Einstein; July 22, 1947) is an American actor, voice actor, writer, comedian and director. He received an Academy Award nomination in 1987 for his role in Broadcast News. His voice acting credits include Marlin the clownfish in Finding Nemo and recurring guest voices for the animated television series The Simpsons and Russ Cargill in its film adaptation The Simpsons Movie.\n\nDescription above from the Wikipedia article Albert Brooks, licensed under CC-BY-SA, full list of contributors on Wikipedia.​', 2, '1947-07-22', NULL, 'Beverly Hills, California, USA', '/8iDSGu5l93N7benjf6b3AysBore.jpg'),
(14, 'Ellen DeGeneres', 'Ellen DeGeneres is an American stand-up comic, television host, and actress. She hosts the syndicated talk show The Ellen DeGeneres Show, and was also a judge on American Idol for one year, having joined the show in its ninth season.\n\nDeGeneres has hosted both the Academy Awards and the Primetime Emmys. As a film actress, she starred in Mr. Wrong, appeared in EDtv and The Love Letter, and provided the voice of Dory in the Disney-Pixar animated film Finding Nemo, for which she was awarded a Saturn Award for Best Supporting Actress, the first and only time a voice performance won a Saturn Award.\n\nShe also starred in two television sitcoms, Ellen from 1994 to 1998 and The Ellen Show from 2001 to 2002. During the fourth season of Ellen in 1997, DeGeneres came out publicly as a lesbian in an appearance on The Oprah Winfrey Show. Shortly afterwards, her character Ellen Morgan also came out to a therapist played by Winfrey, and the series went on to explore various LGBT issues including the coming out process.\n\nShe has won twelve Emmys and numerous other awards for her work and charitable efforts.', 1, '1958-01-26', NULL, 'Metairie, Louisiana, USA', '/z8IEEid4z63CBlJtxrTKEfsW7NA.jpg'),
(18, 'Brad Garrett', 'Brad Garrett (born April 14, 1960) is an American actor, voice actor, and stand-up comedian. He is best known for Everybody Loves Raymond and \'Til Death.', 2, '1960-04-14', NULL, 'Woodland Hills, Los Angeles, California, USA', '/hYh3fR8UeKPVD4LcfDrit4JkCqD.jpg'),
(19, 'Allison Janney', 'Allison Brooks Janney (born November 19, 1959) is an American actress born in Boston, Massachusetts who studied at Kenyon College where she studied under Paul Newman. Janney pursued acting partially due to Newman\'s encouragement, going on to study drama at the Neighborhood Playhouse and the Royal Academy of Dramatic Art. Janney rose to prominence for her role as White House Press Secretary (and later Chief of Staff) C.J. Cregg on the television series The West Wing. Janney\'s portrayal of Cregg earned her multiple awards, including four Primetime Emmy Awards and seven Screen Actors Guild Awards, among many others. Prior to West Wing-fame, Janney performed in numerous American films and soap operas, including American Beauty, As the World Turns, and 10 Things I Hate About You.  Following her considerable television success, Janney has gone on to star in numerous critically acclaimed films and television programs. She remains active in theatre and often works with fellow West Wing alums. Janney currently lends her voice and talent to television and radio through notable guest spots and commercial advertising.', 1, '1959-11-19', NULL, 'Boston, Massachusetts, USA', '/cDcB8mKP1GiIeoM3Qe7GIucs0iv.jpg'),
(20, 'Elizabeth Perkins', 'Elizabeth Ann Perkins (born November 18, 1960) is an American actress.', 1, '1960-11-18', NULL, 'Queens, New York, USA', '/97iPhMyh7ou2tsJJ9FpgAcd0Nqv.jpg'),
(22, 'Barry Humphries', 'John Barry Humphries, AO, CBE (born 17 February 1934) is an Australian comedian, satirist, dadaist, artist, author and character actor, perhaps best known for his on-stage and television alter egos Dame Edna Everage, a Melbourne housewife and \"gigastar\", and Sir Les Patterson, Australia\'s foul-mouthed cultural attaché to the Court of St. James\'s.\n\nHe is a film producer and script writer, a star of London\'s West End musical theatre, an award-winning writer and an accomplished landscape painter. For his delivery of dadaist and absurdist humour to millions, biographer Anne Pender described Humphries in 2010 as not only the most significant theatrical figure of our time … [but] the most significant comedian to emerge since Charlie Chaplin. Humphries\' characters, especially Dame Edna Everage, have brought him international renown, and he has appeared in numerous films, stage productions and television shows. Originally conceived as a dowdy Moonee Ponds housewife who caricatured Australian suburban complacency and insularity, Edna has evolved over four decades to become a satire of stardom, the gaudily dressed, acid-tongued, egomaniacal, internationally feted Housewife Gigastar, Dame Edna Everage. Humphries\' other major satirical character creation was the archetypal Australian bloke Barry McKenzie, who originated as the hero of a comic strip about Australians in London (with drawings by Nicholas Garland) which was first published in Private Eye magazine.\n\nThe stories about \"Bazza\" (Humphries\' nickname, as well as an Australian term of endearment for the name Barry) gave wide circulation to Australian slang, particularly jokes about drinking and its consequences (much of which was invented by Humphries), and the character went on to feature in two Australian films, in which he was portrayed by Barry Crocker. Humphries\' other satirical characters include the \"priapic and inebriated cultural attaché\" Sir Les Patterson, who has \"continued to bring worldwide discredit upon Australian arts and culture, while contributing as much to the Australian vernacular as he has borrowed from it\", gentle, grandfatherly \"returned gentleman\" Sandy Stone, iconoclastic 1960s underground film-maker Martin Agrippa, Paddington socialist academic Neil Singleton, sleazy trade union official Lance Boyle, high-pressure art salesman Morrie O\'Connor and failed tycoon Owen Steele.\n\nDescription above from the Wikipedia article Barry Humphries, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1934-02-17', NULL, 'Camberwell, Melbourne, Australia', '/7WClJFIZ7QDkTMgFi8Rl1XQp6wV.jpg'),
(23, 'Bill Hunter', '​From Wikipedia, the free encyclopedia.  \n\nWilliam John \"Bill\" Hunter (27 February 1940 – 21 May 2011) was an Australian actor of film, stage and television. He appeared in more than 60 films and won two Australian Film Institute Awards.\n\nDescription above from the Wikipedia article Bill Hunter (actor), licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1940-02-27', '2011-05-21', 'Ballarat, Victoria, Australia', '/gvrRsTfx47KupgRwTKp0gqryHPe.jpg'),
(31, 'Tom Hanks', 'Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker. Known for both his comedic and dramatic roles, Hanks is one of the most popular and recognizable film stars worldwide, and is widely regarded as an American cultural icon.\n\nHanks made his breakthrough with leading roles in the comedies Splash (1984) and Big (1988). He won two consecutive Academy Awards for Best Actor for starring as a gay lawyer suffering from AIDS in Philadelphia (1993) and a young man with below-average IQ in Forrest Gump (1994). Hanks collaborated with film director Steven Spielberg on five films: Saving Private Ryan (1998), Catch Me If You Can (2002), The Terminal (2004), Bridge of Spies (2015), and The Post (2017), as well as the 2001 miniseries Band of Brothers, which launched him as a director, producer, and screenwriter.\n\nHanks\' other notable films include the romantic comedies Sleepless in Seattle (1993) and You\'ve Got Mail (1998); the dramas Apollo 13 (1995), The Green Mile (1999), Cast Away (2000), Road to Perdition (2002), and Cloud Atlas (2012); and the biographical dramas Saving Mr. Banks (2013), Captain Phillips (2013), Sully (2016), and A Beautiful Day in the Neighborhood (2019). He has also appeared as the title character in the Robert Langdon film series, and has voiced Sheriff Woody in the Toy Story film series.\n\nDescription above from the Wikipedia article Tom Hanks, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1956-07-09', NULL, 'Concord, California, USA', '/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg'),
(32, 'Robin Wright', 'Robin Gayle Wright (born April 8, 1966) is an American actress. She is best known for her roles as Jenny Curran in Forrest Gump, as Buttercup in The Princess Bride, and as Mary Surratt in The Conspirator. She has also been credited as Robin Wright Penn.', 1, '1966-04-08', NULL, 'Dallas, Texas, USA', '/8SWAGtDKEKWz3O5xV5Q31mZXUvL.jpg'),
(33, 'Gary Sinise', 'Gary Sinise (born March 17, 1955) is an American actor, film director and musician.', 2, '1955-03-17', NULL, 'Blue Island, Illinois, USA', '/ngYV91xYfCu0JNcSxJ4yQ7tzOna.jpg'),
(34, 'Mykelti Williamson', 'Michael T. \"Mykelti\" Williamson (born March 4, 1957) is an American actor best known for his role as Benjamin Buford (Bubba) Blue in the 1994 film Forrest Gump, as Detective Bobby \"Fearless\" Smith in the critically acclaimed but commercially unsuccessful crime drama Boomtown, and recently for appearing as the head of CTU for season 8 of the hit TV series 24.', 2, '1957-03-04', NULL, 'Saint Louis, Missouri, USA', '/b68ZTxJL8EuvGMCcgSH3Mbn2GxP.jpg'),
(35, 'Sally Field', 'Sally Margaret Field (born November 6, 1946) is an American actress and director. She is the recipient of various accolades, including two Academy Awards, three Primetime Emmy Awards, two Golden Globe Awards, and a Screen Actors Guild Award, and she has been nominated for a Tony Award and two BAFTA Awards.\n\nDescription above from the Wikipedia article Sally  Field, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1946-11-06', NULL, 'Pasadena, California, USA', '/36qWnokCU1VOdSyrmGbTxzGou44.jpg'),
(40, 'Orson Welles', 'George Orson Welles (May 6, 1915 – October 10, 1985), best known as Orson Welles, was an American film director, actor, theatre director, screenwriter, and producer, who worked extensively in film, theatre, television and radio. Noted for his innovative dramatic productions as well as his distinctive voice and personality, Welles is widely acknowledged as one of the most accomplished dramatic artists of the twentieth century, especially for his significant and influential early work—despite his notoriously contentious relationship with Hollywood. His distinctive directorial style featured layered, nonlinear narrative forms, innovative uses of lighting such as chiaroscuro, unique camera angles, sound techniques borrowed from radio, deep focus shots, and long takes. Welles\'s long career in film is noted for his struggle for artistic control in the face of pressure from studios. Many of his films were heavily edited and others left unreleased. He has been praised as a major creative force and as \"the ultimate auteur.\"\n\nAfter directing a number of high-profile theatrical productions in his early twenties, including an innovative adaptation of Macbeth and The Cradle Will Rock, Welles found national and international fame as the director and narrator of a 1938 radio adaptation of H. G. Wells\'s novel The War of the Worlds performed for the radio drama anthology series Mercury Theatre on the Air. It was reported to have caused widespread panic when listeners thought that an invasion by extraterrestrial beings was occurring. Although these reports of panic were mostly false and overstated,[2] they rocketed Welles to instant notoriety.\n\nCitizen Kane (1941), his first film with RKO, in which he starred in the role of Charles Foster Kane, is often considered the greatest film ever made. Several of his other films, including The Magnificent Ambersons (1942), The Lady from Shanghai (1947), Touch of Evil (1958), Chimes at Midnight (1965), and F for Fake (1974), are also widely considered to be masterpieces.\n\nIn 2002, he was voted the greatest film director of all time in two separate British Film Institute polls among directors and critics, and a wide survey of critical consensus, best-of lists, and historical retrospectives calls him the most acclaimed director of all time. Well known for his baritone voice, Welles was also an extremely well regarded actor and was voted number 16 in AFI\'s 100 Years... 100 Stars list of the greatest American film actors of all time. He was also a celebrated Shakespearean stage actor and an accomplished magician, starring in troop variety shows in the war years.', 2, '1915-05-06', '1985-10-10', 'Kenosha, Wisconsin, USA', '/c5wKlmD001cQAqJjvDbVOTVeAyV.jpg'),
(62, 'Bruce Willis', 'An American actor and producer. His career began in television in the 1980s and has continued both in television and film since, including comedic, dramatic, and action roles. He is well known for the role of John McClane in the Die Hard series. Willis was born in Idar-Oberstein, West Germany, the son of a Kassel-born German, Marlene, who worked in a bank, and David Willis, an American soldier. Willis is the eldest of four children. At the premiere for the film Stakeout, Willis met actress Demi Moore. They married on November 21, 1987 and had three daughters before the couple divorced on October 18, 2000. Since the divorce he has dated models Maria Bravo Rosado and Emily Sandberg; he was engaged to Brooke Burns until they broke up in 2004 after ten months together. He married Emma Heming on March 21, 2009.', 2, '1955-03-19', NULL, 'Idar-Oberstein, Germany', '/A1XBu3CffBpSK8HEIJM8q7Mn4lz.jpg'),
(118, 'Geoffrey Rush', 'Geoffrey Roy Rush (born 6 July 1951) is an Australian actor and film producer. As of November 2009, he was one of 25 people to have won the \"Triple Crown of Acting\": an Academy Award, a Tony Award and an Emmy Award. Apart from being nominated for 4 Academy Awards for acting (winning 1) and 5 BAFTA Awards (winning 3), he has also won 2 Golden Globe and 3 Screen Actors Guild Awards.\n\nDescription above from the Wikipedia article Geoffrey Rush, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1951-07-06', NULL, 'Toowoomba, Queensland, Australia', '/npXFjaFQzBNroCEPllGPTZ5IisA.jpg'),
(130, 'Kenny Baker', 'From Wikipedia, the free encyclopedia Kenneth George \"Kenny\" Baker (born 24 August 1934) was a British actor and musician, best known as the man inside R2-D2 in the popular Star Wars film series. Description above from the Wikipedia article Kenny Baker, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1934-08-24', '2016-08-13', 'Birmingham, England, UK', '/pwtOpCFlXny8YsG3uVz6MbCdY7U.jpg'),
(138, 'Quentin Tarantino', 'Quentin Jerome Tarantino (born March 27, 1963) is an American film director, screenwriter, producer, cinematographer and actor. In the early 1990s he was an independent filmmaker whose films used nonlinear storylines and aestheticization of violence. His films have earned him a variety of Academy Award, Golden Globe, BAFTA and Palme d\'Or Awards and he has been nominated for Emmy and Grammy Awards. In 2007, Total Film named him the 12th-greatest director of all time.\n\nTarantino was born in Knoxville, Tennessee, the son of Connie McHugh Tarantino Zastoupil, a health care executive and nurse born in Knoxville, and Tony Tarantino, an actor and amateur musician born in Queens, New York.\n\nTarantino\'s mother allowed him to quit school at age 17, to attend an acting class full time. Tarantino gave up acting while attending the acting school, saying that he admired directors more than actors. Tarantino also worked in a video rental store before becoming a filmmaker, paid close attention to the types of films people liked to rent, and has cited that experience as inspiration for his directorial career.\n\nTarantino has been romantically linked with numerous entertainers, including actress Mira Sorvino, directors Allison Anders and Sofia Coppola, actresses Julie Dreyfus and Shar Jackson and comedians Kathy Griffin and Margaret Cho. He has never married and has no children.\n\nDescription above from the Wikipedia article Quentin Tarantino, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1963-03-27', NULL, 'Knoxville, Tennessee, USA', '/1gjcpAa99FAOWGnrUvHEXXsRs7o.jpg'),
(516, 'Annette Bening', 'An American film and television actress. She\'s a four-time Academy Awards nominee for her roles in the feature films The Grifters, American Beauty, Being Julia and The Kids Are All Right, winning Golden Globe Awards for the latter two films.', 1, '1958-05-29', NULL, 'Topeka, Kansas, USA', '/bs4hB5t2mHMn6C2ZGOlP5LfSEPe.jpg'),
(663, 'William Hootkins', 'William Michael Hootkins was born on July 5, 1948, in Dallas, Texas. He moved to London, England in the early \'70s and lived there up until 2002. Hootkins was an actor at Theatre Intime while attending Princeton University where he learned how to speak fluent Mandarin Chinese. He also trained as an actor at the London Academy of Music and Dramatic Arts, and attended St. Marks, where he was in the same theater group as Tommy Lee Jones. The imposingly bulky and heavyset Hootkins first began acting in films and TV shows alike in the mid \'70s. His more noteworthy parts include the first of the Rebel fighter pilots to get killed while attacking the Death Star in \"Star Wars\", scientist Topol\'s bumbling oaf assistant in \"Flash Gordon\", Major Eaton, sent by the US government in \"Raiders of the Lost Ark\", one of Rod Steiger\'s demented sons in \"American Gothic\", a corrupt police lieutenant in \"Batman\", a disgusting sleazy voyeur in \"Hardware\", a coarse South African police chief in \"Dust Devil\", the mysterious and duplicitous Mr. X in \"Hear My Song\", a haughty corporate executive in \"Death Machine\", Santa Claus in \"Like Father, Like Santa\", and an opera-singing vampire in \"The Breed\". Moreover, Hootkins had small parts in two \"Pink Panther\" pictures: he\'s a taxi driver in both \"The Trail of the Pink Panther\" and \"Curse of the Pink Panther\".\n\nAmong the TV shows he did guest spots on are \"Yanks Go Home\", \"Agony\", \"Play for Today\", \"Tales of the Unexpected\", \"The Life and Times of David Lloyd George\", \"Brett Maverick\", \"Cagney and Lacey\", \"Taxi\", \"Hammer House of Mystery and Suspense\", \"Poirot\", \"Chancer\", \"The Young Indiana Jones Chronicles\", \"The Tomorrow People\", \"The West Wing\", and \"Absolute Power\". Hootkins received many accolades for his outstanding performance as Sir Alfred Hitchcock in Terry Johnson\'s hit play \"Hitchcock Blonde\". In addition to his substantial film and TV credits, Hootkins was also a popular and prolific voice artist who recorded dozens of plays for BBC Radio Drama; he supplied the voices for such iconic individuals as Orson Welles, J. Edgar Hoover, and Winston Churchill. William Hootkins died of pancreatic cancer on October 23, 2005.  IMDb Mini Biography', 2, '1948-07-05', '2005-10-23', 'Dallas, Texas, USA', '/dav2i86GN0UvYIyoTwQmGE8Nweg.jpg'),
(901, 'Rita Lengyel', '', 1, '1973-01-01', NULL, 'Düsseldorf, Germany', NULL),
(902, 'Milton Welsh', '', 2, '1969-01-01', NULL, 'Kassel - Germany', '/6t0LvgHgnUtnBHVOZEDt20YRbQf.jpg'),
(1979, 'Kevin Spacey', 'Kevin Spacey Fowler (born July 26, 1959), better known by his stage name Kevin Spacey, is an  American actor of screen and stage, film director, producer, screenwriter and singer who has resided in the United Kingdom since 2003. He began his career as a stage actor during the 1980s before obtaining supporting roles in film and television. He gained critical acclaim in the early 1990s that culminated in his first Academy Award for Best Supporting Actor for the neo-noir crime thriller The Usual Suspects (1995), and an Academy Award for Best Actor for midlife crisis-themed drama American Beauty (1999).\n\nHis other starring roles have included the comedy-drama film Swimming with Sharks (1994), psychological thriller Seven (1995), the neo-noir crime film L.A. Confidential (1997), the drama Pay It Forward (2000), the science fiction-mystery film K-PAX (2001), and the role of Lex Luthor in the superhero film Superman Returns (2006).\n\nDescription above from the Wikipedia article Kevin Spacey, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1959-07-26', NULL, 'South Orange, New Jersey, USA', '/8ERAowTTGib0IjSGr2jI5mrhm2O.jpg'),
(2154, 'Scott Bakula', '​From Wikipedia, the free encyclopedia.  \n\nScott Stewart Bakula (born October 9, 1954) is an American actor, known for his role as Sam Beckett in the television series Quantum Leap, for which he won the Golden Globe Award for Best Actor – Television Series Drama in 1991 and was nominated for four Emmy Awards. He also had a prominent role as Captain Jonathan Archer in Star Trek: Enterprise. Bakula also guest starred in seasons two and three of NBC\'s Chuck as the title character\'s father Stephen Bartowski. Bakula can currently be seen on the TNT series Men of a Certain Age, as Terry.', 2, '1954-10-09', NULL, 'St. Louis, Missouri, USA', '/meZvcpXmcFlrJUeme4UpH4GZeNV.jpg'),
(2155, 'Thora Birch', 'Thora Birch (born March 11, 1982) is an American actress. She was a child actor in the 1990s, starring in movies such as All I Want for Christmas (1991), Patriot Games (1992), Hocus Pocus (1993), Now and Then (1995), and Alaska (1996). She came to prominence in 1999 after earning worldwide attention and praise for her performance in American Beauty. She then starred in the well received film Ghost World (2001), which earned her a Golden Globe nomination.\n\nDescription above from the Wikipedia article Thora Birch, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1982-03-11', NULL, 'Los Angeles, California, USA', '/m5jrrJEPkVAiZFijCpZ6nh2VBOo.jpg'),
(2545, 'Lawrence Bender', '', 2, '1957-10-17', NULL, 'New York, New York, U.S.', '/mZRwkIvUj8USnS7Jfwd6VdHkY2x.jpg'),
(2555, 'David Proval', 'From Wikipedia, the free encyclopedia. David Aaron Proval (born May 20, 1942) is an American actor, known for his roles as Richie Aprile on the HBO television series The Sopranos and as Tony DeVienazo in the 1973 Martin Scorsese film Mean Streets opposite Robert De Niro and Harvey Keitel.\n\nProval was born in Brooklyn, New York of Jewish heritage,  the son of actress Clara Katz of Romanian origin.  He has appeared in such feature films as The Shawshank Redemption, Mob Queen, Four Rooms, UHF, Innocent Blood, The Siege, a cameo appearance in Smokin\' Aces, and has had recurring roles in television shows such as Picket Fences, Boomtown and Everybody Loves Raymond. In 1977 his voice was heard in the cult animated film WIZARDS, as the robot assassin Necron 99.\n\nIn 2008, David Proval starred in the comedy City of Shoulders and Noses. The film is being produced by Sybil Danning, George Parra, and Tommy Ardolino.\n\nDescription above from the Wikipedia article David Proval, licensed under CC-BY-SA,full list of contributors on Wikipedia.    ', 2, '1942-05-20', NULL, 'Brooklyn, New York, U.S.', '/ku3LWQXiJ80nWgs21fKvTMaR6Ui.jpg'),
(2880, 'Emilio Estevez', 'Emilio Estévez is an American actor, film director, and writer. He started his career as an actor and is well-known for being a member of the acting Brat Pack of the 1980s, starring in The Breakfast Club and St. Elmo\'s Fire. He is also known for Repo Man, The Mighty Ducks and its sequels, Maximum Overdrive, Bobby (which he also wrote and directed), and his performances in Western films such as Young Guns and its sequel. One of his first appearances was as \"Two-Bit\" in The Outsiders.', 2, '1962-05-12', NULL, 'New York City, New York, USA', '/lTyufiVNbc0WS6y8NVRN04hqow0.jpg'),
(2955, 'Chris Cooper', 'Christopher W. \"Chris\" Cooper (born July 9, 1951) is an American film actor. He became well known in the late 1990s, having appeared in supporting performances in several major Hollywood films, including The Bourne Identity, American Beauty, Capote, The Town, The Kingdom, Syriana, October Sky, Seabiscuit, and Adaptation, for which he won both the Academy Award and Golden Globe Award for Best Supporting Actor.', 2, '1951-07-09', NULL, 'Kansas City, Missouri, USA', '/ouXgwkpJ6UtjjDgAEPQNtimTbMx.jpg'),
(3044, 'Scott Beach', '', 2, '1931-01-13', '1996-02-13', NULL, '/5Y3SbZeqOcw2w5KUUwnUjGoir6b.jpg'),
(3122, 'Sammi Davis', 'From Wikipedia, the free encyclopedia.\n\nSammi Davis (born Samantha Davis; 21 June 1964) is a British actress.\n\nShe gained considerable praise for her performance in Ken Russell\'s The Rainbow (1989). She also had significant roles in Mike Hodges\' A Prayer For The Dying and John Boorman\'s Hope and Glory (both 1987) as well as a leading role in the Emmy Award-winning American television series, Homefront (1991–1993).\n\nDavis was married to the director Kurt Voss, whom she later divorced. After taking a few years out of the film industry to raise her family, she returned to the screen in a cameo role on Lost, playing the mother of Dominic Monaghan\'s character.\n\nDescription above from the Wikipedia article Sammi Davis, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1964-06-21', NULL, 'Kidderminster, Worcestershire, England, UK', '/6A6nYjHzjNkcsXskdxzHw2P7ROf.jpg'),
(3123, 'Amanda de Cadenet', '', 1, '1972-05-19', NULL, NULL, '/pLlI568voL7dkFbUDIq4hFI0o0v.jpg'),
(3124, 'Valeria Golino', 'Valeria Golino is an Italian actress and director. She is best known to English-language audiences for her roles in Rain Man, Big Top Pee-wee, and the two Hot Shots! movies. In addition to the awards David di Donatello, Silver Ribbon, Golden Ciak, and Italian Golden Globe, she is also one of the three actresses who has won the Best Actress award at the Venice Film Festival twice.', 1, '1965-10-22', NULL, 'Naples, Campania, Italy', '/q8YUigxxcdcoc9uOvb70rNF19sE.jpg'),
(3125, 'Madonna', 'Madonna (born Madonna Louise Ciccone) is a recording artist, actress and entrepreneur. Born in Bay City, Michigan, she moved to New York City in 1977 to pursue a career in modern dance. After performing in the music groups Breakfast Club and Emmy, she released her debut album in 1983. She followed it with a series of albums in which she found immense popularity by pushing the boundaries of lyrical content in mainstream popular music and imagery in her music videos, which became a fixture on MTV. Throughout her career, many of her songs have hit number one on the record charts, including \"Like a Virgin\", \"Papa Don\'t Preach\", \"Like a Prayer\", \"Vogue\", \"Frozen\", \"Music\", \"Hung Up\", and \"4 Minutes\". Critics have praised Madonna for her diverse musical productions while at the same time serving as a lightning rod for religious controversy.\n\nHer career was further enhanced by film appearances that began in 1979, despite mixed commentary. She won critical acclaim and a Golden Globe Award for Best Actress in Motion Picture Musical or Comedy for her role in Evita (1996), but has received harsh feedback for other film roles. Madonna\'s other ventures include being a fashion designer, children\'s book author, film director and producer. She has been acclaimed as a businesswoman, and in 2007, she signed an unprecedented US $120 million contract with Live Nation.\n\nMadonna has sold more than 300 million records worldwide and is recognized as the world\'s top-selling female recording artist of all time by the Guinness World Records. According to the Recording Industry Association of America (RIAA), she is the best-selling female rock artist of the 20th century and the second top-selling female artist in the United States, behind Barbra Streisand, with 64 million certified albums. In 2008, Billboard magazine ranked Madonna at number two, behind only The Beatles, on the Billboard Hot 100 All-Time Top Artists, making her the most successful solo artist in the history of the Billboard chart. She was also inducted into the Rock and Roll Hall of Fame in the same year. Considered to be one of the \"25 Most Powerful Women of the Past Century\" by Time for being an influential figure in contemporary music, Madonna is known for continuously reinventing both her music and image, and for retaining a standard of autonomy within the recording industry.', 1, '1958-08-16', NULL, 'Bay City, Michigan, USA', '/pI6g1iVlUy7cUAZ6AspVXWq4kli.jpg'),
(3126, 'Ione Skye', '​From Wikipedia, the free encyclopedia\n\nIone Skye Lee ( born Ione Skye Leitch; September 4, 1970) is an English-born American actress, who became a teen idol after the 1989 movie Say Anything.... In 2006 VH1 placed her at number 84 in the \"100 Greatest Teen Stars\" list.', 1, '1970-09-04', NULL, 'Hampstead, London, England, UK', '/ye8qsi6fn51HW93c7065Jogbh9p.jpg'),
(3127, 'Lili Taylor', 'Lili Taylor is an American film and television actress, best known for her roles in such award-winning indie films as Mystic Pizza, Short Cuts and I Shot Andy Warhol.', 1, '1967-02-20', NULL, 'Glencoe, Illinois, USA', '/mDhsbC9kjJnwJGHbpquKs8D1IUo.jpg'),
(3128, 'Alicia Witt', 'Alicia Roanne Witt is an American actress, singer-songwriter, and pianist. Witt was born on August 21, 1975, in Worcester, Massachusetts, to Diane (née Pietro), a junior high school reading teacher, and Robert Witt, a science teacher and photographer. \"Talking by age two and reading by the age of four\", Witt has been described as a child prodigy. She has a brother called Ian.\n\nHer acting talent was recognized by director David Lynch discovered her when he heard her recite Shakespeare\'s Romeo and Juliet on the television show That\'s Incredible! at age 5. This led Lynch to cast her in the role of Alia, the \"flame-haired\" sister of Paul Atreides, in Dune (1984). She turned 8 during filming. He would begin working with her in film and television even before Witt earned her high school equivalency credential (at age 14). She did undergraduate work in piano at Boston University and competed nationally.\n\nThis page is based on a Wikipedia article written by contributors. Text is available under the CC BY-SA 4.0 license; additional terms may apply.', 1, '1975-08-21', NULL, 'Worcester, Massachusetts, USA', '/teO46k2FjbFwaqOCmOmfctBiY1G.jpg'),
(3129, 'Tim Roth', 'Often mistaken for an American because of his skill at imitating accents, actor Tim Roth was born Timothy Simon Roth on May 14, 1961 in Lambeth, London, England. His mother, Ann, was a teacher and landscape painter. His father, Ernie, was a journalist who had changed the family name from \"Smith\" to \"Roth\"; Ernie was born in Brooklyn, New York, to an immigrant family of Irish ancestry.\n\nTim grew up in Dulwich, a middle-class area in the south of London. He demonstrated his talent for picking up accents at an early age when he attended school in Brixton, where he faced persecution from classmates for his comfortable background and quickly perfected a cockney accent to blend in. He attended Camberwell Art College and studied sculpture before he dropped out and pursued acting.\n\nRoth has continued to enjoy a mix of art house and mainstream work, including everything from the lead role in Francis Ford Coppola\'s esoteric Youth Without Youth (2007) to becoming \"The Abomination\" in the special effects-heavy blockbuster The Incredible Hulk (2008). Roth took his first major American television role when he signed on to the Fox-TV series Lie to Me (2009)', 2, '1961-05-14', NULL, 'London, England, UK', '/hgaIXIW9GKnZhrweplBonG7uhhP.jpg'),
(3130, 'Jennifer Beals', 'Jennifer Beals (born December 19, 1963, height 5\' 8½\" (1,74 m)) is an American actress and a former teen model. She is known for her roles as Alexandra \"Alex\" Owens in the 1983 film Flashdance, and as Bette Porter on the Showtime drama series The L Word. She earned an NAACP Image Award and a Golden Globe Award nomination for the former. She has appeared in more than 50 films.\n\nBeals was born on the South Side of Chicago, the daughter of Jeanne (née Anderson), an elementary school teacher, and Alfred Beals, who owned grocery stores. She is multiracial; her father was African American, and her mother is Irish American. She has two brothers, Bobby and Gregory.Her father died when Beals was nine years old, and her mother married Edward Cohen in 1981. Beals has said her biracial heritage had some effect on her, as she \"always lived sort of on the outside\", with an idea \"of being the other in society\". She got her first job at age 13 at an ice cream store, using her height at the time (she is now nearly 5 ft 9 in (1.75 m)), to convince her boss she was 16.\n\nBeals was inspired to become an actress by two events: doing a high school production of Fiddler on the Roof and seeing Balm in Gilead with Joan Allen while volunteer-ushering at the Steppenwolf Theatre.\n\nBeals graduated from the progressive Francis W. Parker School. She also was chosen to attend the elite Goodman Theatre Young People\'s Drama Workshop. Beals attended Yale University, receiving a B.A. in American literature in 1987; she deferred a term so she could film Flashdance. While at Yale, Beals was a resident of Morse College.\n\nDescription above from the Wikipedia article Jennifer Beals, licensed under CC-BY-SA, full list of contributors on Wikipedia. ​', 1, '1963-12-19', NULL, 'Chicago - Illinois - USA', '/gSgjPBfke1fz55WyO8AnFWtidOq.jpg'),
(3131, 'Antonio Banderas', 'José Antonio Domínguez Bandera (born August 10, 1960), known professionally as Antonio Banderas, is a Spanish actor, producer, director, and singer. He began his acting career at age 19 with a series of films by director Pedro Almodóvar and then appeared in high-profile Hollywood films, especially in the 1990s, including Assassins, Evita, Interview with the Vampire, Philadelphia, Desperado, The Mask of Zorro, Spy Kids, the Shrek sequels and Puss in Boots.', 2, '1960-08-10', NULL, 'Málaga, Andalucía, Spain', '/uqqgAdPfi1TmG3tfKfhsf20fHE6.jpg'),
(3132, 'Lana McKissack', '', 1, '1984-06-05', NULL, NULL, '/foE5SoQgMPrHqY0ER5ZyC53OQDf.jpg'),
(3133, 'Patricia Vonne', 'Patricia Vonne is an American singer and actress. A native of San Antonio, Texas, Vonne, born Patricia Rodriguez, moved to New York City in 1990-2001 to pursue her artistic ambitions. She worked extensively in Europe and America and was featured in national/international commercials, and film work. She formed her own musical band, which performed on the New York circuit from 1998-2001. She then relocated to her native Texas where she currently tours extensively in the U.S., Mexico and Europe. She toured as a member of Tito &amp; Tarantula, the band featured in the film From Dusk Till Dawn in 2002. Her song, \"Traeme Paz\", was featured in the film Once Upon a Time in Mexico. Her song \"Mudpies and Gasoline\" is featured in the Quentin Tarantino presented film Hell Ride. She is the sister of Angela Lanza, Marcel Rodriguez and Robert Rodriguez.', 1, NULL, NULL, 'San Antonio - Texas - USA', NULL),
(3134, 'Tamlyn Tomita', '​From Wikipedia, the free encyclopedia.  \n\nTamlyn Naomi Tomita (born January 27, 1966) is a Japanese American actress, who has appeared in many Hollywood films and television series.', 1, '1966-01-27', NULL, 'Okinawa, Japan', '/bjQewogmmqPf18kKcNofCRx2Gol.jpg'),
(3135, 'Danny Verduzco', '', 0, NULL, NULL, NULL, NULL),
(3136, 'Salma Hayek', 'One of the most notable figures of Mexican descent in Hollywood today. She is most famous for her work in the 2002 film Frida, for which she was nominated for a Best Actress Academy Award. In 2001 she received Glamour magazine\'s Woman of the Year Award, and then in 2005, Time Magazine\'s \"25 Most Influental Hispanics\" award. Salma comes from a prominent Veracruz family of Spanish and Lebanese descent. She was raised Roman Catholic, and at a young age attended boarding school in the United States where she was diagnosed with dyslexia.  Salma later studied International Relations in Mexico City at the Universidad Iberomericanan. Her first name, Salma, is Arabic for \"peace\". It wasn\'t until the age of 23 that Hayek began her acting career with a role in the successful Mexican TV series, Teresa.  She instantly became a Mexican hero, and five years later starred in El Callejon de los Milagros, a film that won more awards than any other in Mexican history.  At the age of 25, Salma moved to Los Angeles and started her Hollywood career. Robert Rodriguez cast Salma in his 1995 film Desperado, which she starred in with actor Antonio Banderas. The film was a major success and Salma was even nominated for Best Supporting Actress. This kickstarted her career and over the next decade, she starred in over 25 films that include Frida (2002), Wild Wild West (1999), and Fools Rush In (1997).  Salma is married to French billionaire Francois Pinault, and together the couple has one daughter, Valentina. In her personal life, Salma is strongly involved with charitable organizations dealing with Women\'s rights advocacy.', 1, '1966-09-02', NULL, 'Coatzacoalcos, Veracruz, Mexico', '/59S2eIPlj2mjYPcnSqvoe5z5bvk.jpg'),
(3137, 'Paul Calderon', 'He was born in Puerto Rico 1959. Calderon moved to New York with his family at the age of six, where he grew up on the streets of the Lower East Side and Spanish Harlem. Following some time in college, he enlisted in the United States Army and served overseas as an infantryman.  Returning to the States, Calderon set his sights on an acting career. Starting out on the New York stage, he won an Obie Award for his performance in Blade to the Heat at the Public Theatre. His most notable Broadway role was opposite Robert De Niro in Cuba and His Teddy Bear. Calderon also appeared off-Broadway in such plays as Requiem For A Heavyweight and Divine Horsemen, and played Achilles in the New York Shakespeare Festival’s production of Troilus and Cressida in Central Park. He is a founding member of the Touchstone Theatre, the American Folk Theatre and the Labyrinth Theatre Company.\n\nCalderon was originally slated to portray the role of Jules Winnfield in Pulp Fiction; Samuel L. Jackson was subsequently given the role.\n\nCorrection Samuel Jackson told Tarantino he had messed up by not casting him in Reservoir Dogs. Tarantino agreed and told him he was writing a script and had a character that he had written specifically with Jackson in mind. Calderon had a better initial reading than Jackson and Tarantino gave serious consideration to casting him as Jules Winnfield.\n\nCalderon portrays Paul the bartender in dialogue scene between Butch Coolidge and Marsellus Wallace.\n\nCalderon also co-wrote Abel Ferrara\'s 1992 crime drama Bad Lieutenant, starring Harvey Keitel.\n\nCalderon acted in The Last Castle and the critically acclaimed independent feature Girlfight. His more than three dozen film credits also include Out of Sight, Cop Land, Four Rooms, Pulp Fiction, Bad Lieutenant, The Firm, The Addiction, Q &amp; A, Sea of Love, Clockers and King of New York. In addition, he has made numerous guest appearances on television series, including recurring roles on Dream Street, Law &amp; Order and Miami Vice.\n\nIn 2010, Calderon is set to star as The Businessman in Sanzhar Sultanov\'s crime drama - The Story.', 2, '1959-01-01', NULL, 'Puerto Rico', '/xIORhcIDmFMlaS3ZS3em1QiTkt5.jpg'),
(3138, 'Kathy Griffin', '​From Wikipedia, the free encyclopedia.  \n\nKathleen Mary \"Kathy\" Griffin (born November 4, 1960) is an American actress, model, stand-up comedian, television personality, New York Times best-selling author and an LGBT rights advocate. Griffin first gained recognition for appearances on two episodes of Seinfeld, and then for her supporting role on the NBC sitcom Suddenly Susan. She was the star of the Bravo reality show Kathy Griffin: My Life on the D-List, for which she won two Emmy Awards as executive producer. She has also worked as a voice artist and red carpet commentator, in addition to several other career pursuits. From 2008-2013 she was nominated for a Grammy Award for Best Comedy Album, winning in 2013. In her bid to win a Tony Award, she made her Broadway debut in Kathy Griffin Wants a Tony in March 2011.\n\nDescription above from the Wikipedia article Kathy Griffin, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1960-11-04', NULL, 'Chicago, Illinois, USA', '/psg895Ye46vGenRdX0EXvGOm92p.jpg'),
(3140, 'Marc Lawrence', '​From Wikipedia, the free encyclopedia\n\nMarc Lawrence (December 17, 1909 – November 28, 2005) was an American character actor who specialized in underworld types. He has also been credited as F. A. Foss, Marc Laurence and Marc C. Lawrence.\n\nIn 1930, Lawrence befriended another young actor, John Garfield. The two appeared in a number of plays before Lawrence was given a film contract with Columbia Pictures. Lawrence appeared in films beginning in 1931. Garfield followed, starting his film career in 1938. Lawrence\'s pock-marked complexion, brooding appearance and New York street-guy accent made him a natural for heavies, and he played scores of gangsters and mob bosses over the next six decades. Later, Lawrence found himself under scrutiny for his political leanings. When called before the House Un-American Activities Committee, he admitted he had once been a member of the Communist Party. He named Sterling Hayden, Lionel Stander, Anne Revere, Larry Parks, Karen Morley and Jeff Corey as Communists.[6] He was blacklisted and departed for Europe, where he continued to make films. Following the demise of the blacklist, he returned to America and resumed his position as a familiar and talented purveyor of gangland types. He played gangsters in two James Bond movies: 1971\'s Diamonds Are Forever opposite Sean Connery, and 1974\'s The Man with the Golden Gun opposite Roger Moore. He also portrayed a henchman opposite Laurence Olivier in Marathon Man (1976) and a stereotypical Miami mob boss alongside Jerry Reed and Dom DeLuise in the comedy Hot Stuff (1979).\n\nOne of his last roles was as Mr. Zeemo in the Star Trek: Deep Space Nine episode \"Badda-Bing Badda-Bang\", which aired in February 1999. Previously he played the elderly Gatherer Volnoth in the 1989 Star Trek: The Next Generation episode \"The Vengeance Factor\".\n\nDescription above from the Wikipedia article Marc Lawrence, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1910-02-17', '2005-11-27', 'New York City, New York, U.S.', '/i056pyf0SksLoPv5eUjWZ8EDLZK.jpg');
INSERT INTO `people` (`tmdb_person_id`, `name`, `biography`, `gender_id`, `date_of_birth`, `date_of_death`, `place_of_birth`, `profile_path`) VALUES
(3141, 'Marisa Tomei', 'Marisa Tomei was born on December 4, 1964, in Brooklyn, New York, to mother Patricia \"Addie\" Tomei, an English teacher and father Gary Tomei, a lawyer. Marisa also has a brother, actor Adam Tomei. As a child, Marisa\'s mother frequently corrected her speech as to eliminate her heavy Brooklyn accent. As a teen, Marisa attended Edward R. Murrow High School and graduated in the class of 1982. She was one year into her college education at Boston University when she dropped out for a co-starring role on the CBS daytime drama As the World Turns (1956). Her role on that show paved the way for her entrance into film: in 1984, she debuted with a bit part in The Flamingo Kid (1984). Three years later, Marisa became known for her role as Maggie Lawton, Lisa Bonet\'s college roommate, on the sitcom A Different World (1987).\n\nHer real breakthrough came in 1992, when she co-starred as Joe Pesci\'s hilariously foul-mouthed, scene-stealing girlfriend in My Cousin Vinny (1992), a performance that won her a Best Supporting Actress Oscar. Later that year, she turned up briefly as a snippy Mabel Normand in director Richard Attenborough\'s biopic Chaplin (1992), and was soon given her first starring role in Untamed Heart (1993). A subsequent starring role -- and attempted makeover into Audrey Hepburn -- in the romantic comedy Only You (1994) proved only moderately successful.\n\nMarisa\'s other 1994 role as Michael Keaton\'s hugely pregnant wife in The Paper (1994) was well-received, although the film as a whole was not. Fortunately for Tomei, she was able to rebound the following year with a solid performance as a troubled single mother in Nick Cassavetes\' Unhook the Stars (1996) which earned her a Screen Actors Guild nomination for Best Supporting Actress. She turned in a similarly strong work in Welcome to Sarajevo (1997), and in 1998 did some of her best work in years as the sexually liberated, unhinged cousin of Natasha Lyonne\'s Vivian Abramowitz in Tamara Jenkins\' Slums of Beverly Hills (1998). Marisa co-starred with Mel Gibson in the hugely successful romantic comedy What Women Want (2000) and during the 2002 movie award season, she proved her first Best Supporting Actress Oscar win was no fluke when she received her second nomination in the same category for the critically acclaimed dark drama, In the Bedroom (2001). She also made a guest appearance on the animated TV phenomenon The Simpsons (1989) as Sara Sloane, a movie star who falls in love with Ned Flanders. In 2006, she went on to do 4 episodes for Rescue Me (2004). She played Angie, the ex-wife of Tommy Calvin (Denis Leary)\'s brother Johnny (Dean Winters). At age 42, Marisa took a provocative role in legendary filmmaker Sidney Lumet\'s melodramatic picture Before the Devil Knows You\'re Dead (2007), in which she appeared nude in love scenes with co-stars Ethan Hawke and Philip Seymour Hoffman. Marisa then took on another provocative role as a stripper in the highly acclaimed film The Wrestler (2008), opposite Mickey Rourke. Her great performance earned her many awards from numerous film societies for Best Supporting Actress, a third Academy Award nomination, as well as nominations for a Golden Globe and a BAFTA. Many critics heralded this performance as a standout in her career.', 1, '1964-12-04', NULL, 'Brooklyn, New York, USA', '/6TpdWXdn3za2ycuClAQQL6YpXNr.jpg'),
(4077, 'Harry Shannon', '', 2, '1890-06-13', '1964-07-27', 'Saginaw, Michigan, Stati Uniti', '/479X937hYtjjjGpMGStQESXn3dj.jpg'),
(4826, 'Matti Pellonpää', 'From Wikipedia, the free encyclopedia\n\nMatti Pellonpää (28 March 1951 in Helsinki – 13 July 1995 in Vaasa) was an award-winning Finnish actor and a musician. He rose to international fame with his roles in both Aki Kaurismäki\'s and Mika Kaurismäki\'s films; particularly being a regular in Aki\'s films, appearing in 18 of them.\n\nHe started his career in 1962 as a radio actor at the Finnish state-owned broadcasting company YLE. He performed as an actor during the 70s in many amateur theatres, at the same time that he studied at the Finnish Theatre Academy, where he completed his studies in the year 1977.\n\nHe was nominated Best Actor by European Film Academy for his role as Rodolfo in La Vie de Boheme and won the Felix at the European Film Awards in 1992. He also starred in Jim Jarmusch\'s 1991 film Night on Earth.\n\nDescription above from the Wikipedia article Matti Pellonpää, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1951-03-28', '1995-07-13', 'Helsinki, Finland', '/1Qzhkkp3wFE2NMGKVyOra9931q2.jpg'),
(4828, 'Sakari Kuosmanen', 'Sakari Jyrki Kuosmanen (born 6 September 1956 in Helsinki) is a Finnish singer and actor. He has recorded several solo albums and has also done work with Sleepy Sleepers and Leningrad Cowboys. He appeared as himself on the Finnish television series Aaken ja Sakun kesäkeittiö in 1999.\n\nDescription above from the Wikipedia article Sakari Kuosmanen, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1956-09-06', NULL, 'Helsinki, Finland', '/syM87lzV2IqFno87Za1PbeAUdMW.jpg'),
(4829, 'Tomi Salmela', '', 2, '1957-02-27', NULL, 'Helsinki, Finland', NULL),
(4945, 'Joe Johnston', 'Joseph Eggleston \"Joe\" Johnston II  is an American film director and former effects artist best known for such hit movies as Honey I Shrunk the Kids, Jumanji, The Rocketeer,  Jurassic Park III, Hidalgo, The Wolfman, October Sky,  and the upcoming Captain America: The First Avenger.', 2, '1950-05-13', NULL, 'Fort Worth, Texas, USA', '/fbGZo6CG9Z9zKFh8D5wHunyu7gJ.jpg'),
(5293, 'Willem Dafoe', 'William James \"Willem\" Dafoe (born July 22, 1955) is an American actor. He is known for his distinct gravelly voice, and has received multiple accolades, including nominations for four Academy Awards and three Golden Globe Awards. He has frequently collaborated with filmmakers Paul Schrader, Abel Ferrara, Lars von Trier, Julian Schnabel, and Wes Anderson.\n\nDafoe was an early member of experimental theater company The Wooster Group, where he acted in several productions. He made his film debut in Heaven\'s Gate (1980), but was fired during production. He had his first leading role in the outlaw biker film The Loveless (1982) and then played the main antagonist in Streets of Fire (1984) and To Live and Die in L.A. (1985). He received his first Academy Award nomination for his role as Sergeant Elias Grodin in Oliver Stone\'s war film Platoon (1986). In 1988, Dafoe played Jesus in Martin Scorsese\'s The Last Temptation of Christ and starred in Mississippi Burning, both of which were controversial. Following small roles in Born on the Fourth of July (1989) and Wild at Heart (1990), he began a six-film collaboration with director Paul Schrader with the drama Light Sleeper (1992). He starred in the critically panned erotic thriller Body of Evidence (1993) and then co-starred in Clear and Present Danger (1994), The English Patient (1996), Speed 2: Cruise Control (1997), and The Boondock Saints (1999).\n\nAfter receiving his second Academy Award nomination for portraying Max Schreck in Shadow of the Vampire (2000), Dafoe played Norman Osborn in the superhero film Spider-Man (2002), the villains in Once Upon a Time in Mexico (2003) and XXX: State of the Union (2005), and Carson Clay in the film Mr. Bean\'s Holiday (2007). In 2009, he starred in the experimental film Antichrist, one of his three films with Lars von Trier. Dafoe then appeared in The Fault in Our Stars, John Wick, The Grand Budapest Hotel (all 2014), The Great Wall (2016), Murder on the Orient Express (2017), The Florida Project (2017), for which he received his third Academy Award nomination, Aquaman (2018) and The Lighthouse (2019). He has also had voice-over roles in Finding Nemo (2003), its sequel Finding Dory (2016), and Fantastic Mr. Fox (2009), voice and motion capture roles in John Carter (2012) and Death Note (2017), and vocal contributions to the video games Spider-Man (2002), Finding Nemo (2003), James Bond 007: Everything or Nothing (2004), and Beyond: Two Souls (2013).\n\nDafoe has portrayed several real-life figures, including T.S. Eliot in Tom & Viv (1994), Pier Paolo Pasolini in Pasolini (2014), Vincent van Gogh in At Eternity\'s Gate (2018), for which he received an Academy Award for Best Actor nomination, his first in that category, and Leonhard Seppala in Togo (2019). Dafoe has dual citizenship of the United States and Italy.\n\nDescription above from the Wikipedia article Willem Dafoe, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1955-07-22', NULL, 'Appleton, Wisconsin, USA', '/nbv4rIpJnw0OvowBZgwEWVriH9V.jpg'),
(5724, 'Denis Leary', 'Denis Colin Leary (born August 18, 1957) is an American actor, comedian, writer, director and film producer. Leary is known for his biting, fast paced comedic style and chain smoking. He is the star and co-creator of the television show Rescue Me, which ended its seventh and final season on September 7, 2011. Leary has starred in many motion pictures, most recently as CaptainGeorge Stacy in Marc Webb\'s 2012 film The Amazing Spider-Man and the voice of Diego in the animated Ice Age series.', 2, '1957-08-18', NULL, 'Worcester, Massachusetts, USA', '/a3sKa8kWUXEaTBYZufH8xpWRkAi.jpg'),
(5999, 'Kati Outinen', 'From Wikipedia, the free encyclopedia\n\nAnna Katriina Outinen (born August 17, 1961), is a Finnish actress who has often played leading female roles in Aki Kaurismäki\'s films.\n\nOutinen was born in Helsinki. Having studied under Jouko Turkka during his \"reign\" of drama studies in Finland, she nevertheless has never been associated with the \"turkkalaisuus\" school of acting methodology. Her breakthrough role was as a tough girl in the generational classic youth film Täältä tullaan elämä by Tapio Suominen.\n\nIn 1984, she appeared in Aikalainen.\n\nBesides a strong domestic reputation gained through a widely varied list of roles in theater and television drama, film director Aki Kaurismäki\'s films have brought Outinen international attention and even adulation, particularly in Germany and France.\n\nAt the 2002 Cannes Film Festival, Outinen won the award for Best Actress for the Kaurismäki film The Man Without a Past.\n\nDescription above from the Wikipedia article Kati Outinen, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1961-08-17', NULL, 'Helsinki, Finland', '/mi78e4O4hQBQygxVVtwXdV2xqiu.jpg'),
(6168, 'Austin Pendleton', 'An American film, television, and stage actor, a playwright, and a theater director and instructor.\n\nDescription above from the Wikipedia article Austin Pendleton, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1940-03-27', NULL, 'Warren, Ohio, U.S.', '/jXa5k21yl8Z2GkG69hJ0KS0Lq9j.jpg'),
(6310, 'David Brisbin', 'From Wikipedia, the free encyclopedia.\n\nDavid Brisbin (born June 26, 1952) is an American television actor who gained fame as Mr. Ernst on the television show Hey Dude and as a newscaster in Forrest Gump. He has made frequent guest appearances on ER.\n\nHe is married to actress Laura Innes and they have two children together: Cal and Mia.\n\nDescription above from the Wikipedia article David Brisbin, licensed under CC-BY-SA, full list of contributors on Wikipedia', 2, '1952-06-26', NULL, 'Andrews, West Texas, USA', NULL),
(6751, 'Siobhan Fallon Hogan', 'Siobhan Fallon Hogan (born May 13, 1961) is an American actress and comedian from Syracuse, New York. She began her career in television roles from the early 1980s to 1990s, including roles on Saturday Night Live and Seinfeld. In 1994, Fallon made her film debut in \'Only You\'. She has since had roles in a number of films including \'Forrest Gump\' (1994), \'Men in Black\' (1997), \'Dancer in the Dark\' (2000), \'Holes\' (2003), \'Daddy Day Care\' (2003), \'Dogville\' (2003), \'Funny Games\' (2007), \'We Need to Talk About Kevin\' (2011) and \'The House That Jack Built\' (2018).', 1, '1961-05-13', NULL, 'Syracuse, New York, USA', '/5OExagnRsUcOYLMPTSrv4x2G95R.jpg'),
(6856, 'Kurt Russell', 'An American television and film actor. His first acting roles were as a child in television series, including a lead role in the Western series The Travels of Jaimie McPheeters (1963–1964). In the 1970s, he signed a ten-year contract with the Walt Disney Company, where he became, according to Robert Osborne, the \"studio\'s top star of the \'70s\". In 1979, Russell was nominated for an Emmy Award for the made-for-television film Elvis. In 1983, he was nominated for a Golden Globe Award for Best Performance by an Actor in a Supporting Role in a Motion Picture for his performance opposite Meryl Streep in the 1984 film, Silkwood. During the 1980s, Russell was cast in several films by director John Carpenter, including anti-hero roles such as former air force hero-turned robber Snake Plissken in the futuristic action film Escape from New York, Antarctic helicopter pilot R.J. MacReady in the horror film The Thing (1982), and truck driver Jack Burton in the dark kung-fu comedy/action film Big Trouble in Little China (1986). Both Escape from New York and Big Trouble in Little China have since become cult films. In 1994, he had a starring role in the military/science fiction film Stargate. In the mid-2000s, his portrayal of U.S. Olympic hockey coach Herb Brooks in Miracle (2004) won the praise of critics. In 2006, he appeared in the disaster-thriller Poseidon, and in 2007 Quentin Tarantino\'s Death Proof segment from the film Grindhouse.\n\nDescription above from the Wikipedia article Kurt Russell, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1951-03-17', NULL, 'Springfield, Massachusetts, USA', '/6g1d98oH4miG4k0ZiZWmF3Dt0bO.jpg'),
(7664, 'Joseph Cotten', 'Joseph Cheshire Cotten (May 15, 1905 – February 6, 1994) was an American actor of stage and film. Cotten achieved prominence on Broadway, starring in the original productions of The Philadelphia Story and Sabrina Fair. He is associated with Orson Welles, leading to appearances in Citizen Kane (1941), The Magnificent Ambersons (1942), Journey into Fear (1943), for which Cotten was also credited with the screenplay, and The Third Man (1949). He was a star in his own right with films such as Shadow of a Doubt (1943), Love Letters (1945), Portrait of Jennie (1948), and The Third Man (1949).', 2, '1905-05-15', '1994-02-06', 'Petersburg, Virginia, USA', '/djfCB0jPOgmq3w7RD3BMLzWsAu8.jpg'),
(7727, 'Phil Tippett', '', 2, NULL, NULL, NULL, '/qIjrlRrM6MwNkbCYwRbPYbvq9P7.jpg'),
(7907, 'John Ratzenberger', 'John Dezso Ratzenberger is an American actor, voice actor, director, producer, writer and entrepreneur. He is one of the most successful actors of all time in terms of box-office receipts. Ratzenberger is best known for portraying Cliff Clavin on the popular comedy series Cheers, for which he earned two Primetime Emmy nominations. He is the only voice actor to appear in every Pixar Animation Studios feature film, including Hamm in the Toy Story franchise, The Underminer in The Incredibles franchise, and Mack in the Cars franchise.\n\nRatzenberger began his entertainment career while living in London in the 1970s. He had minor film and television roles throughout the late 70s and early 1980s before creating, and then landing, the role of the know-it-all mailman Cliff Clavin on Cheers, a role he portrayed throughout the show\'s eleven seasons. His first Pixar role was the voice of Hamm in Toy Story, and he has voiced Pixar characters in films and video games ever since. From 2004 to 2008 he hosted the TV documentary series Made in America.  Outside of acting, he has promoted American entrepreneurship and manufacturing, and campaigned for several Republican candidates.', 2, '1947-04-06', NULL, 'Bridgeport, Connecticut, USA', '/oRtDEOuIO1yDhTz5dORBdxXuLMO.jpg'),
(7911, 'Joe Ranft', '', 2, '1960-03-13', '2005-08-16', NULL, '/f1BoWC2JbCcfP1e5hKfGsxkHzVU.jpg'),
(8210, 'Wes Bentley', 'Wesley Cook \"Wes\" Bentley (born September 4, 1978) is an American film actor known for his roles as Ricky Fitts in American Beauty (1999) and Seneca Crane in The Hunger Games (2012). Bentley was one of four subjects in the documentary My Big Break (2009), which covered his fame after American Beauty and struggles with substance abuse. Rebuilding his career, he starred in the premier of Venus in Fur by David Ives in the off-Broadway production in 2010, whose run was extended.\n\nDescription above from the Wikipedia article Wes Bentley, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1978-09-04', NULL, 'Jonesboro, Arkansas, USA', '/oDjtxTiEuCdyrcAtlCOEWUjhsaT.jpg'),
(8211, 'Mena Suvari', 'Mena Alexandra Suvari (born February 13, 1979) is an American actress, fashion designer, and model. Shortly after beginning her career as a model, she soon transitioned into acting after appearing in guest roles on 1990\'s television shows such as Boy Meets World and High Incident. She made her film debut in the 1997 drama film Nowhere. She made the transition to major roles with her performances in American Beauty, for which she was nominated for a BAFTA Award, and American Pie, both of which earned her wider attention. Since then, she appeared in Loser (2000), with her American Pie co-star, Jason Biggs, and later played the main character in the comedy film Sugar & Spice (2001). She had appearances in the 2002 independent drama Spun, and the 2004 thriller feature Trauma. She also appeared in the HBO\'s drama series Six Feet Under in 2004, she received a nomination as a member of the Outstanding Cast at the 2005 Screen Actors Guild Awards. In 2008, she was cast in a string of films, including Day of the Dead, The Mysteries of Pittsburgh, and the film adaptation of The Garden of Eden.\n\nSuvari is a model for Lancôme cosmetics and print ads for Lancôme Paris Adaptîve, and has been featured in several fashion blogs and magazines such as Vogue. She is a long-time supporter and activist for the esteemed African relief organization, the African Medical and Research Foundation. She is also active in female empowerment issues, and is involved with charities whose cause is breast cancer, and \"End Violence Against Women\" campaign.\n\nDescription above from the Wikipedia article Mena Suvari, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1979-02-13', NULL, 'Newport, Rhode Island, USA', '/x9sNSSb6kzwbjud4YSonRvZhRKk.jpg'),
(8212, 'Peter Gallagher', 'Peter Killian Gallagher (born August 19, 1955 height 5\' 10\" (1,78 m)) is an American actor, musician and writer. Since 1980, Gallagher has played many roles in numerous Hollywood films. He starred as Sandy Cohen in the television drama series The O.C. from 2003 to 2007. He currently appears in a recurring role on the USA Network drama Covert Affairs as CIA Clandestine Services Director Arthur Campbell.', 2, '1955-08-19', NULL, 'New York City, New York, USA', '/paHKF5w1Yr0fIL1eKVMDQOmZB1n.jpg'),
(8213, 'Sam Robards', 'Sam Robards was born on December 16, 1961 in New York City, New York, USA as Sam Prideaux Robards. He is an actor and producer, known for American Beauty (1999), A.I. Artificial Intelligence (2001) and Awake (2007). He has been married to Sidsel Jensen since November 8, 1997. They have two children. He was previously married to Suzy Amis.', 2, '1961-12-16', NULL, 'New York City - New York - USA', '/bUXMGjSmgFabbvlU2V6jhLmehhx.jpg'),
(8214, 'Barry Del Sherman', 'Barry Del Sherman is an actor.', 2, '1962-11-10', NULL, 'Fontana - California - USA', '/zXLTW52g9BW9CCQ5fzxoGNLDe8P.jpg'),
(8215, 'Bruce Cohen', 'From Wikipedia, the free encyclopedia. Bruce Cohen is an American film producer. Cohen and his producing partner, Dan Jinks, run The Jinks/ Cohen Company. Cohen and Jinks produced American Beauty, winner of the 1999 Academy Award for Best Picture. Among other films that Cohen has produced are The Forgotten, Big Fish, To Wong Foo, Thanks for Everything! Julie Newmar, and most recently, Milk, his second Best Picture nomination. In 2009, Cohen wore a White Knot to the Academy Awards ceremony as a show of support for the marriage equality movement. Since May 2005 he has been a contributing blogger at The Huffington Post.\n\nCohen married his partner of five years, Gabriel Catone, on June 30, 2008, in a ceremony officiated by Mayor Antonio Villaraigosa at Los Angeles City Hall. In December 2010, Cohen and actress Anne Hathaway went to Staten Island as surprise guests to a performance of the PS 22 Chorus, to invite them to the 83rd Academy Awards in February. They also announced that the Chorus will be performing in the awards ceremony.\n\nDescription above from the Wikipedia article Bruce Cohen, licensed under CC-BY-SA,full list of contributors on Wikipedia.', 2, NULL, NULL, 'Falls Church, Virginia, USA', NULL),
(8504, 'Gregg Toland', 'From Wikipedia\n\nGregg Toland, A.S.C. (May 29, 1904 – September 28, 1948) was an American cinematographer noted for his innovative use of lighting and techniques such as deep focus, an example of which can be found in his work on Orson Welles\' Citizen Kane.\n\nToland was born in Charleston, Illinois on May 29, 1904. During the 1930s, Toland became the youngest cameraman in Hollywood but soon one of its most sought-after cinematographers. Over a seven-year span (1936–1942), he was nominated five times for the \"Best Cinematography\" Oscar, including a win in 1940 for his work on Wuthering Heights. He worked with many of the top directors of his era, including John Ford, Howard Hawks, Erich von Stroheim, King Vidor, Orson Welles, and William Wyler.\n\nToland was the subject of an \"Annals of Hollywood\" article in The New Yorker, \"The Cameraman,\" by Hilton Als (June 19, 2006, p. 46). Just before his death, he was concentrating on the \"ultimate focus\" lens, which makes both near and far objects equally distinct. He died in Los Angeles, California on September 26, 1948 of coronary thrombosis at age 44. He is interred in the Hollywood Forever Cemetery  in Hollywood, California.', 2, '1904-05-29', '1948-09-26', 'Charleston, Illinois, USA', NULL),
(8783, 'Eric Bana', 'Eric Bana is an Australian film and television actor. He began his career as a comedian in the sketch comedy series Full Frontal before gaining critical recognition in the biopic Chopper (2000). After a decade of roles in Australian TV shows and films, Bana gained Hollywood\'s attention by playing the role of American Delta Force Sergeant Norm \"Hoot\" Hooten in Black Hawk Down (2001), the lead role as Bruce Banner in the Ang Lee directed film Hulk (2003), Prince Hector in the movie Troy (2004), the lead in Steven Spielberg\'s Munich (2005), and the villain Nero in the science-fiction film Star Trek (2009).\n\nAn accomplished dramatic actor and comedian, he received Australia\'s highest film and television awards for his performances in Chopper, Full Frontal and Romulus, My Father. Bana performs predominantly in leading roles in a variety of low-budget and major studio films, ranging from romantic comedies and drama to science fiction and action thrillers.\n\nEric Bana was the younger of two children; he has a brother, Anthony. He is of Croatian ancestry on his father\'s side. Bana\'s paternal grandfather, Mate Banadinović, fled to Argentina after the Second World War, and Bana\'s paternal grandmother emigrated to Germany and then to Australia in the 1950s with her son, Ivan (Bana\'s father). His father was a logistics manager for Caterpillar, Inc., and his German-born mother, Eleanor, was a hairdresser. Bana grew up in Melbourne\'s Tullamarine, a suburban area on the western edge of the city, near the main airport. In a cover story for The Mail on Sunday, he told author Antonella Gambotto-Burke that his family had suffered from racist taunts, and that it had distressed him. \"Wog is such a terrible word,\" he said. He has stated: \"I have always been proud of my origin, which had a big influence on my upbringing. I have always been in the company of people of European origin\".\n\nShowing acting skill early in life, Bana began doing impressions of family members at the age of six or seven, first mimicking his grandfather\'s walk, voice and mannerisms. In school, he mimicked his teachers as a means to get out of trouble. As a teen, he watched the Mel Gibson film Mad Max (1979), and decided he wanted to become an actor. However, he did not seriously consider a career in the performing arts until 1991 when he was persuaded to try stand-up comedy while working as a barman at Melbourne\'s Castle Hotel. His stand-up gigs in inner-city pubs did not provide him with enough income to support himself, so he continued his work as a barman and bussing tables.', 2, '1968-08-09', NULL, 'Melbourne, Australia', '/j8tbvkg0kyCZihbwrUNRxwhqXXe.jpg'),
(9096, 'Gino Corrado', 'Gino Corrado (born Gino Corrado Liserani; 9 February 1893 - 23 December 1982) was an Italian-born American screen actor, his career spanning the years 1916 to 1954. During the early years of his career he was extensively credited as Eugene Corey.', 2, '1893-02-09', '1982-12-23', 'Florence, Tuscany, Italy', '/f4FxGEcWMoRcBbArEvYCxy7QSk7.jpg'),
(9634, 'Kent Faulcon', '', 2, NULL, NULL, NULL, '/wDojq2eq9OnvQ0Vtk1Ie4wjmR5D.jpg'),
(9640, 'Haley Joel Osment', 'Haley Joel Osment (born April 10, 1988) is an American actor. After a series of roles in television and film during the 1990s, including a small part in Forrest Gump playing the title character’s son, Osment rose to fame with his performance as Cole Sear in M. Night Shyamalan’s thriller film The Sixth Sense that earned him a nomination for Academy Award for Best Supporting Actor. He subsequently appeared in leading roles in several high-profile Hollywood films including Steven Spielberg\'s A.I. Artificial Intelligence and Mimi Leder\'s Pay it Forward. He made his Broadway debut in 2008 in a revival of American Buffalo, co-starring with John Leguizamo and Cedric the Entertainer.', 2, '1988-04-10', NULL, 'Los Angeles, California, USA', '/jft0dGgR5bJ6mR7QRYriMVBC6QH.jpg'),
(9777, 'Cuba Gooding Jr.', 'Cuba Gooding was born in Bronx, New York to Shirley, a singer with the Sweethearts, and Cuba Gooding, Sr., a lead vocalist of soul group The Main Ingredient. He has two brothers, musician Tommy Gooding and fellow actor Omar Gooding, and sister, April Gooding. His family moved to Los Angeles after Gooding Sr.\'s music group had a hit single with \"Everybody Plays the Fool\" in 1972 but abandoned his family two years later. Gooding Jr. was raised by his mother and attended four different high schools: North Hollywood High School, Tustin High School, Apple Valley High School, and John F. Kennedy High School in Granada Hills in Los Angeles. He served as class president in three of them.\n\nHis first job as a professional entertainer was as a break-dancer performing with singer Lionel Richie at the closing ceremonies of the 1984 Summer Olympics in Los Angeles. After high school, Gooding studied Japanese martial arts for three years, before turning his focus toward acting. Early on, he landed guest starring roles on shows like Hill Street Blues (1981) and MacGyver (1985).\n\nHis first major role was in the John Singleton\'s box office surprise and critical hit Boyz n the Hood (1991). He followed this success with roles in major films like A Few Good Men (1992), Lightning Jack (1994), Outbreak (1995), Men of Honor (2000), Rat Race (2001), and The Fighting Temptations (2003) in which he co-starred alongside Beyoncé Knowles.\n\nIn 1996, he was cast as an arrogant football player on the brink of a career-ending injury in Cameron Crowe\'s Jerry Maguire (1996). The film was a success and earned him an Oscar for Best Supporting Actor. His \"Show Me The Money\" line in the film became a nationwide catchphrase. In 1997, he had a notable supporting role in As Good As It Gets (1997). The next several years, his films were inconsistently successful; Boat Trip (2002), Norbit (2007), and Daddy Day Camp (2007), all of which had received extremely negative reviews and performed poorly at the box office.\n\nGooding also starred in a film titled A Murder of Crows, which he co-produced with his long time friend and business partner Derek Broes. The film was Gooding\'s first attempt at producing.  Since then, he has had series of starring roles in grittier films released direct-to-DVD such as the revenge dramas Hero Wanted and Wrong Turn at Tahoe, as well as the sci-fi action pic Hardwired and the action comedy Lies &amp; Illusions. A well-received performance as Ben Carson in Gifted Hands: The Ben Carson Story (2009) and a small supporting role in Ridley Scott\'s American Gangster (2007) both proved to be exceptions to this trend. An appearance in the World War II film, Red Tails, produced by George Lucas and with other prominent actors such as Terrence Howard, will mark his only return to the big screen since American Gangster.\n\nGooding is married to Sara Kapfer; they have two sons, Spencer and Mason.  ', 2, '1968-01-02', NULL, 'Bronx, New York, USA', '/bxL1lZyMKcexcAKNhkU4Gy73wLb.jpg'),
(10565, 'Dick Cavett', '', 2, '1936-11-19', NULL, 'Gibbon, Nebraska, USA', '/7g5J47vQY2k4GzGhlJr6KdYm04P.jpg'),
(10657, 'Shane Rimmer', 'From Wikipedia, the free encyclopedia.\n\nShane Rimmer was a Canadian actor, voice actor and screenwriter, known for providing the voice of Scott Tracy in the British television series Thunderbirds.\n\nHe has mostly performed in supporting roles, frequently in films and television series filmed in the United Kingdom, having relocated to England in the late 1950s. His appearances include roles in such widely-known films as Dr. Strangelove (1964), Rollerball (1975), The Spy Who Loved Me (1977), Gandhi (1982), Out of Africa (1985) and Crusoe (1989). More recently he has appeared in Spy Game (2001), and Batman Begins (2005). In the earlier years of his career, there were several uncredited performances, among others for films such as You Only Live Twice (1967), Diamonds Are Forever (1971), Star Wars (1977) and Superman II (1980). With the exception of recurring featured cast members he has appeared in more James Bond films than any other actor.\n\nRimmer has a long association with Gerry Anderson. Thunderbirds fans may recognize him as the voice actor behind the character Scott Tracy. He drafted the plotline for the penultimate episode, \"Ricochet\", which was later turned into a script by Tony Barwick. He also wrote scripts and provided uncredited voices for Captain Scarlet and the Mysterons, Joe 90 and The Secret Service, has made appearances in episodes of Anderson\'s live-action UFO and The Protectors, has and provided voices for Space: 1999 and has guest-starred in the episode \"Space Brain\". In later years he starred in the unscreened pilot Space Police (later made into a series with other actors and titled Space Precinct) and provided the voice for Anderson\'s stop-motion gumshoe Dick Spanner, P.I..\n\nRimmer and fellow Anderson actor Ed Bishop often joked about how often their professional paths crossed and termed themselves \"Rent-a-Yanks\". They appeared together as NASA operatives in the opening of You Only Live Twice and as USN sailors in The Bedford Incident as well as touring together in live stage shows, including \"Death of a Salesman\" in the 1990s. He also appeared in Doctor Who in 1966, and in Coronation Street as two different characters: Joe Donnelli (1968–1970), who held Stan Ogden hostage in No. 5 before committing suicide, and Malcolm Reid (1988), father of Audrey Roberts\' son Stephen.\n\nHe has made many guest appearances in British television series for ITV, including in Roald Dahl\'s Tales of the Unexpected, and ITC\'s The Persuaders!. In 1989 Rimmer was reunited with former Gerry Anderson actors Ed Bishop and Matt Zimmerman in the BBC Radio 4 adaptation of Sir Arthur Conan Doyle\'s A Study In Scarlet. Rimmer and Bishop also appeared in the BBC drama-documentary Hiroshima completed not long after Bishop\'s death in 2005. Note: His official website and travel record on the Immigration & Travel section of Ancestry give his year of birth as 1929.\n\nDescription above from the Wikipedia article Shane Rimmer, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1929-05-28', '2019-03-29', '	Toronto, Ontario, Canada', '/morFcla0R2Bv3vu3B1HgCmm0eiv.jpg'),
(10822, 'Stephen Dorff', 'Stephen Dorff (born July 29, 1973) is an American actor, best known for portraying Stuart Sutcliffe in Backbeat, Johnny Marco in Somewhere, and for his roles in Blade and Cecil B. DeMented.', 2, '1973-07-29', NULL, 'Atlanta, Georgia, USA', '/kuFyGa2HZB7hAQTUn3WKlgKAVjm.jpg'),
(11025, 'Agnes Moorehead', 'Agnes Robertson Moorehead (December 6, 1900 – April 30, 1974) was an American actress. Although she began with the Mercury Theatre, appeared in more than seventy films beginning with Citizen Kane and on dozens of television shows during a career that spanned more than thirty years, Moorehead is most widely known to modern audiences for her role as the witch Endora in the series Bewitched.\n\nWhile rarely playing leads in films, Moorehead\'s skill at character development and range earned her one Emmy Award and two Golden Globe awards in addition to four Academy Award and six Emmy Award nominations. Moorehead\'s transition to television won acclaim for drama and comedy. She could play many different types, but often portrayed haughty, arrogant characters.\n\nDescription above from the Wikipedia article Agnes Moorehead, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1900-12-06', '1974-04-30', 'Clinton, Massachusetts, USA', '/kES7mzL8b3Lp6b39pnHuR0RuFD8.jpg'),
(11026, 'Ruth Warrick', 'From Wikipedia, the free encyclopedia.\n\nDame Ruth Elizabeth Warrick (June 29, 1916 – January 15, 2005), DM, was a long-time American singer, Hollywood Golden-Age actress and political activist, best known for her role as Phoebe Tyler on All My Children, which she played regularly from 1970 until her death in 2005.\n\nShe celebrated her 80th birthday by attending a special screening of Citizen Kane to a packed, standing-room-only audience, to which she spoke afterward. (She made her film debut as Kane\'s first wife.) Over the years, she collected several books about Orson Welles and Citizen Kane, in which she would write \"Property of Ruth Warrick, Mrs. Citizen Kane\".\n\nShe served as a Licensed Unity Teacher.\n\nDescription above from the Wikipedia article Ruth Warrick, licensed under CC-BY-SA, full list of contributors on Wikipedia.​', 1, '1915-06-29', '2005-01-15', 'Saint Joseph, Missouri, U.S.', '/tcSwLMrFZDfak0kcGGXIcR0MBeO.jpg'),
(11027, 'Everett Sloane', 'Everett Sloane (October 1, 1909 – August 6, 1965) was an American stage, film and television actor, songwriter, and theatre director.\n\nDescription above from the Wikipedia article Everett Sloane , licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1909-10-01', '1965-08-06', 'Manhattan, New York City, New York, USA', '/6A5zOAAPSsMHzwDflb99l4mfwMi.jpg'),
(11028, 'George Coulouris', 'George Coulouris was a British stage, film and television actor.', 2, '1903-10-01', '1989-04-25', 'Manchester, England, UK', '/dOpxb3czupFKP4x9qh0LJfRuaZc.jpg'),
(11029, 'Dorothy Comingore', 'From Wikipedia, the free encyclopedia\n\nMary Louise Comingore, best known professionally as Dorothy Comingore (August 24, 1913 – December 30, 1971), was an American film actress. She is best known for starring as Susan Alexander Kane in Citizen Kane (1941), the critically acclaimed debut film of Orson Welles. In earlier films she was credited as Linda Winters, and she had appeared on the stage as Kay Winters. Her career ended when she was caught up in the Hollywood blacklist. She declined to answer questions when she was called before the House Un-American Activities Committee in 1952.', 1, '1913-08-24', '1971-12-30', 'Los Angeles, California, USA', '/oZCewbT89apDCvHvMHxYs9n8Llc.jpg'),
(11030, 'William Alland', '', 0, '1916-03-04', '1997-11-11', NULL, NULL),
(11031, 'Philip Van Zandt', '', 2, '1904-10-04', '1958-02-15', 'Amsterdam, Holland', '/9SdBwSFGN7g5ycAPNORMVKxqEH6.jpg'),
(11032, 'Buddy Swan', '', 0, '1929-10-24', '1993-03-21', NULL, NULL),
(11033, 'Paul Stewart', 'Paul Stewart (March 13, 1908 – February 17, 1986) was an American character actor known for his tough, guttural voice. He frequently portrayed villains and mobsters throughout his lengthy career.\n\nBorn Paul Sternberg in New York City, Stewart graduated from Columbia University and made his Broadway theatre debut in the play Two Seconds in 1931. A few years later he met Orson Welles, who invited him to join the Mercury Theatre, where he participated in the notorious 1938 radio broadcast of The War of the Worlds. He was a founding member of AFTRA.\n\nSternberg\'s many screen credits include Citizen Kane, Twelve O\'Clock High, Champion, Kiss Me Deadly, The Bad and the Beautiful, In Cold Blood, The Day of the Locust, S.O.B., and W.C. Fields and Me, in which he portrayed Florenz Ziegfeld. On television, he appeared in Playhouse 90, Alfred Hitchcock Presents, Alcoa Theatre, Dr. Kildare, Wagon Train, Gunsmoke, It Takes a Thief, Mannix, The Name of the Game, McMillan &amp; Wife, Mission Impossible,The Rockford Files, Lou Grant, and Remington Steele, among many others. He also directed some television episodes, among them \"Little Girl Lost\", from the Twilight Zone.\n\nStewart was married to big band singer/actress Peg La Centra from 1939 until his death from a heart attack in Los Angeles at age 77. He was characterized in the 1999 television movie RKO 281.', 2, '1908-03-13', '1986-02-17', 'New York City, New York, USA', '/2sYUlDzOJcjE6W3S80hYpkwcAzN.jpg'),
(11803, 'Peter Greene', 'Peter Greene (born Peter Green; October 8, 1965) is an American character actor.\n\nA native of Montclair, New Jersey, Greene did not pursue a career in acting until his mid 20s. He initially landed several roles in cinema and television in the early 1990s.\n\nGreene\'s breakthrough came in 1994-1995 with a roles in Pulp Fiction, The Mask, Clean, Shaven, and The Usual Suspects. Greene is possibly best remembered for his role in Pulp Fiction, as Zed who rapes Marsellus Wallace. The Mask saw him play the villainous Dorian Tyrell opposite Jim Carrey and Cameron Diaz. Greene\'s most accomplished role was that of schizophrenic Peter Winter in Clean, Shaven. The Usual Suspects saw him play the small but memorable character, Redfoot. Greene often plays villains such as in Under Siege 2: Dark Territory, Training Day (as a corrupt narcotics officer) and martial arts/crime film Fist of the Warrior (opposite Ho-Sung Pak, Roger Guenveur Smith and Sherilyn Fenn).\n\nHe worked with one director, Jordan Alan, twice. Once on the film Kiss and Tell, a dark comic turn for the actor and then again 4 years later in The Gentleman Bandit (aka Gentleman B). After Greene\'s arrests in 1998 for drug related crimes, Alan had to put the actor through rehab to get him through the second film and eventually, after coming upon Greene doing heroine with Mike Starr, he was forced to replace Greene\'s voice because of the vocal problems caused by drugs. Despite these problems, Mr. Alan vouched for Greene to producer Tobe Jaffe for the movie Blue Streak.\n\nHe played Martin Lawrence\'s nemesis in Blue Streak.\n\nGreene has continued to mostly work as a character actor. He appeared in the short-lived television drama The Black Donnellys. He also appeared as a policeman in Prodigy of Mobb Deep\'s video for \"A,B,C\'s\", as well as the focal character in House of Pain\'s video for \"Fed Up\".\n\nGreene recently appeared in the opening scene of the premier of the new FX series Justified.\n\nDescription above from the Wikipedia article Peter Greene, licensed under CC-BY-SA, full list of contributors on Wikipedia​', 2, '1965-10-08', NULL, 'Montclair, New Jersey, USA', '/n49XdJsMwNRdc4qT9XVAGb3fIQW.jpg'),
(12223, 'Joel McCrary', '', 2, NULL, NULL, NULL, '/2zFMn8HRSkjz1PwVrev9P3dm9if.jpg'),
(12248, 'Alec Guinness', 'Sir Alec Guinness, CH, CBE (2 April 1914 – 5 August 2000) was an English actor. He was featured in several of the Ealing Comedies, including Kind Hearts and Coronets in which he played eight different characters. He later won the Academy Award for Best Actor for his role as Colonel Nicholson in The Bridge on the River Kwai. His is known for playing Obi-Wan Kenobi in the original Star Wars trilogy. He also played Prince Feisal in Lawrence of Arabia and George Smiley in the TV adaptation of Tinker, Tailor, Soldier, Spy.', 2, '1914-04-02', '2000-08-05', 'Marylebone, London, England, UK', '/dddx1VI6l1Ge8SQEJz7rI8OSmkv.jpg'),
(12799, 'Jeremy Piven', 'Jeremy Samuel Piven (born July 26, 1965) is an American film producer and actor best known for his role as Ari Gold in the television series Entourage for which he has won three Primetime Emmy Awards as well as several other nominations for Best Supporting Actor.\n\nDescription above from the Wikipedia article Jeremy Piven, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1965-07-26', NULL, 'New York City, New York, USA', '/dPCFGmNhrF3niEJMPIbC1fiIqyI.jpg'),
(12829, 'Richard LeParmentier', '', 2, '1946-07-16', '2013-04-15', NULL, '/sxKfuif3ngW26TZOhKgyc1beJzC.jpg'),
(13204, 'Troy Christian', '', 2, NULL, NULL, NULL, NULL),
(14364, 'Erskine Sanford', 'Erskine Sanford was an American actor on the stage, in radio and motion pictures. As a member of Orson Welles\'s Mercury Theatre company he appears in several of Welles\'s films, most notably as the bumbling, perspiring newspaper editor Herbert Carter in Citizen Kane!', 2, '1885-11-19', '1969-07-07', 'Trinidad, Colorado, USA', '/3785XaExkxo0yN337yN9808wtvJ.jpg'),
(14518, 'Ray Collins', '​From Wikipedia, the free encyclopedia\n\nRay Bidwell Collins (December 10, 1889 – July 11, 1965) was an American character actor in stock and Broadway theatre, radio, films, and television. With 900 stage roles to his credit, he became one of the most successful actors in the developing field of radio drama.\n\nA friend and associate of Orson Welles for many years, Collins went to Hollywood with the Mercury Theatre company and made his feature-film debut in Citizen Kane, as Kane\'s ruthless political rival.\n\nCollins appeared in more than 75 films and had one of his best-remembered roles on television, as the irascible Lieutenant Arthur Tragg on the television series Perry Mason.', 2, '1889-12-10', '1965-07-11', 'Sacramento, California, USA', '/aafy1UvizCKmf8is7gTfAJc43wP.jpg'),
(14526, 'Daniel C. Striepeke', '', 2, NULL, NULL, NULL, NULL),
(14723, 'Vicki Lewis', '', 1, '1960-03-17', NULL, NULL, '/x0LqiqXF53vLYX4O4Chpd1EWw8u.jpg'),
(14979, 'Fortunio Bonanova', '', 2, '1895-01-13', '1969-04-02', 'Palma de Mallorca, Spain', '/39RJP5GMzaw1Bh6hBaYK6qsEDW1.jpg'),
(15152, 'James Earl Jones', 'James Earl Jones (born January 17, 1931) is a multi-award-winning American actor of theater and film, well known for his distinctive bass voice and for his portrayal of characters of substance, gravitas and leadership. He is known for providing the voice of Darth Vader in the Star Wars franchise and the tagline for CNN.  James Earl Jones was born in Arkabutla, Mississippi, the son of Ruth (née Connolly) and Robert Earl Jones. At the age of five, he moved to Jackson, Michigan, to be raised by his maternal grandparents, but the adoption was traumatic and he developed a stutter so severe he refused to speak aloud. When he moved to Brethren, Michigan in later years a teacher at the Brethren schools started to help him with his stutter. He remained functionally mute for eight years until he reached high school. He credits his high school teacher, Donald Crouch, who discovered he had a gift for writing poetry, with helping him out of his silence.  Jones attended the University of Michigan where he was a pre-med major. While there, he joined the Reserve Officer Training Corps, and excelled. During the course of his studies, Jones discovered he was not cut out to be a doctor. Instead he focused himself on drama, with the thought of doing something he enjoyed, before, he assumed, he would have to go off to fight in the Korean War. After four years of college, Jones left without his degree. In 1953 he found a part-time stage crew job at the Ramsdell Theatre in Manistee, Michigan, which marked the beginning of his acting career. During the 1955–1957 seasons he was an actor and stage manager. He performed his first portrayal of Shakespeare’s Othello in this theater in 1955. After his discharge from the Military, Jones moved to New York, where he attended the American Theatre Wing to further his training and worked as a janitor to earn a living. His first film role was as a young and trim Lt. Lothar Zogg, the B-52 bombardier in Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb in 1964. His first big role came with his portrayal of boxer Jack Jefferson in the film version of the Broadway play The Great White Hope, which was based on the life of boxer Jack Johnson. For his role, Jones was nominated Best Actor by the Academy of Motion Picture Arts and Sciences, making him the second African-American male performer (following Sidney Poitier) to receive a nomination. In 1969, Jones participated in making test films for a proposed children\'s television series; these shorts, combined with animated segments were the beginnings of the Sesame Street format. The next year, in the early 1970s, James appeared with Diahann Carroll in the film called Claudine.  While he has appeared in many roles, he is well known as the voice of Darth Vader in the original Star Wars trilogy. Darth Vader was portrayed in costume by David Prowse in the original trilogy, with Jones dubbing Vader\'s dialogue in postproduction due to Prowse\'s strong West Country accent being unsuitable for the role. At his own request, he was originally uncredited for the release of the first two films (he would later be credited for the two in the 1997 re-release).  His other voice roles include Mufasa in the 1994 film Disney animated blockbuster The Lion King, and its direct-to-video sequel, The Lion King II: Simba\'s Pride. He also has done the CNN tagline, \"This is CNN\", as well as \"This is CNN International\", and the Bell Atlantic tagline, \"Bell Atlantic: The heart of communication\". When Bell Atlantic became Verizon, Jones used the tagline greeting of \"Welcome to Verizon\" or \"Verizon 411\" right before a phone call would go through. The opening for NBC\'s coverage of the 2000 and 2004 Summer Olympics; \"the Big PI in the Sky\" (God) in the computer game Under a Killing Moon; a Claymation film about The Creation; and several guest spots on The Simpsons.  In addition to his film and voice over work, Jones is an accomplished stage actor as well; he has won Tony awards in 1969 for The Great White Hope and in 1987 for Fences. Othello, King Lear, Oberon in A Midsummer Night\'s Dream, Abhorson in Measure for Measure, and Claudius in Hamlet are Shakespearean roles he has played. He received Kennedy Center Honors in 2002.  Jones has been married to actress Cecilia Hart since 1982. They have one child, Flynn Earl Jones. He was previously married to American actress/singer Julienne Marie (born March 21, 1933, Toledo, Ohio); they had no children. Jones is a registered Republican.', 2, '1931-01-17', NULL, 'Arkabutla, Mississippi, USA', '/oqMPIsXrl9SZkRfIKN08eFROmH6.jpg'),
(16767, 'Aki Kaurismäki', 'Aki Kaurismäki is a Finnish film writer, director, actor and producer. Together with his older brother, filmmaker Mika Kaurismäki, he founded the production and distribution company Villealfa. He\'s a graduate in Media Studies from the University of Tampere, Finland.', 2, '1957-04-04', NULL, 'Orimattila, Finland', '/kiJErWEOv4Ew7aHOGKg4ljsmppZ.jpg'),
(17190, 'Erik Per Sullivan', 'From Wikipedia, the free encyclopedia.\n\nErik Per Sullivan (born July 12, 1991) is an American actor best known for his role as Dewey, the younger brother to middle child Malcolm, on the FOX series, Malcolm in the Middle which was on air for 7 years.\n\nDescription above from the Wikipedia article Erik Per Sullivan, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1991-07-12', NULL, 'Worcester, Massachusetts, USA', '/xNGQBXkat5ZjnZ9vSg0mUbcv9Bc.jpg'),
(17356, 'Garrick Hagon', 'From Wikipedia, the free encyclopedia\n\nGarrick Hagon (born September 27, 1939) is an English film, stage and television actor, who was raised in Toronto, Canada.\n\nDescription above from the Wikipedia article Garrick Hagon, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1939-09-27', NULL, 'London, England', '/lDtVxw5eMfmexYgL6OZJTfSCRCN.jpg'),
(17401, 'Stephen Root', 'Stephen Root (born November 17, 1951) is an American actor. He is principally known for his comedic work, but has won acclaim for his occasional dramatic roles.\n\nDescription above from the Wikipedia article Stephen Root, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1951-11-17', NULL, 'Sarasota, Florida, USA', '/3odRHGTElNONSifyvjDohYWyAl3.jpg'),
(19545, 'Jack Angel', 'Jack Angel was born on October 24, 1930 in Modesto, California, USA as Jack T. Angel. He is known for his work on A.I. Artificial Intelligence (2001), Toy Story (1995), and Treasure Planet (2002). He has been married to Arlene Thornton since 1984. They have three children. He was previously married to Barbara Champion.', 2, '1930-10-24', NULL, 'Modesto, California', '/jPOuOHzYV7VYC4Ozy3u4nvnDZxO.jpg');
INSERT INTO `people` (`tmdb_person_id`, `name`, `biography`, `gender_id`, `date_of_birth`, `date_of_death`, `place_of_birth`, `profile_path`) VALUES
(21129, 'Marla Sucharetza', 'Marla Sucharetza is an American stage and screen actress. She holds an BA in Music, Theater & Dance from the Ohio State University, Columbus, Ohio.', 1, '1965-05-20', NULL, 'New York City, New York, USA', '/aGhbVmBBR24Qbx3jq9f3NLMgeIy.jpg'),
(22621, 'Angela Alvarado', '', 1, NULL, NULL, 'New York City - New York - USA', NULL),
(23967, 'Mary Ellen Trainor', 'Mary Ellen Trainor was an actress well-known for roles in a variety of 80s movies including Romancing the Stone, The Goonies, Lethal Weapon (and its sequels), The Monster Squad, Action Jackson, Die Hard, Scrooged, Ghostbusters II, and Back to the Future 2, among other things. One of her most iconic roles was that of the greedy wife in the famous killer Santa episode of Tales From the Crypt \"And All Through the House\".', 1, '1950-07-08', '2015-05-20', 'Chicago - Illinois - USA', '/Y926jxSOXikBiqQIptho1VzU9o.jpg'),
(24278, 'Bill Weston', '', 2, '1941-05-29', '2012-03-25', NULL, NULL),
(24342, 'David Prowse', 'From Wikipedia, the free encyclopedia\n\nDavid Prowse, MBE (born 1 July 1935) is an English former bodybuilder, weightlifter and actor, most widely known for playing the role of Darth Vader in physical form. In Britain, he is also remembered as having played the Green Cross Code man. Prowse is a native of Bristol, where he attended Bristol Grammar School.\n\nDescription above from the Wikipedia article David Prowse, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1935-07-01', NULL, 'Bristol, England, UK', '/xTocYiKHlRYN8tfh8vyQFsRXC0K.jpg'),
(24343, 'Peter Mayhew', 'Peter Mayhew (19 May 1944-30 April 2019) was a British-American actor, best known for playing Chewbacca in the Star Wars films.\n\nMayhew was born on 19 May 1944 in Barnes, Surrey, where he was also raised. His height was a product not of gigantism — \"I don\'t have the big head\" — but of an overactive pituitary gland secondary to a genetic disease called Marfan Syndrome. The overactive pituitary gland was treated successfully in his mid-teens. His peak height was 7 feet 3 inches (2.21 m)', 2, '1944-05-19', '2019-04-30', 'Barnes, London, England, UK', '/rKIBv08O63pyC6PixjyhrjNB8Uh.jpg'),
(27752, 'Bruce Spence', '​From Wikipedia, the free encyclopedia.\n\nBruce Spence  (born 17 September 1945 in Auckland, New Zealand) is an actor, having spent most of his career performing in Australia. Bruce attended Henderson High School in West Auckland. Spence is most known for his roles as the Gyro Captain in Mad Max 2 and as Jedediah the pilot in Mad Max Beyond Thunderdome, and as \"Zedd\" (Zeddicus Zu\'l Zorander) in Legend of the Seeker. He also performed the voice of Chum in Finding Nemo, the Mouth of Sauron in The Lord of the Rings: The Return of the King, the Trainman in The Matrix Revolutions, and Tion Medon in Star Wars: Episode III - Revenge of the Sith.\n\nDescription above from the Wikipedia article Bruce Spence, licensed under CC-BY-SA, full list of contributors on Wikipedia', 2, '1945-09-17', NULL, ' Auckland, North Island, New Zealand', '/kuaIudFTIBahGAdCamThG13jPp7.jpg'),
(29934, 'Brett Rice', '', 2, NULL, NULL, NULL, '/4OTUfCVDOsCFQoQwiNE8deDFxKW.jpg'),
(33032, 'Phil Brown', 'Philip Brown was an American actor. Brown was born in Cambridge, Massachusetts. After majoring in dramatics at Stanford University where he was a Brother of Beta Theta Pi Fraternity, Brown played some of his earliest stage roles as part of New York\'s Group Theater. When it folded, he and other Group Theatre veterans headed to Hollywood, where Brown worked in motion pictures and helped found the fabled Actors\' Laboratory. In 1946, he played Ernest Hemingway\'s famous protagonist Nick Adams in Robert Siodmak\'s version of The Killers, alongside William Conrad and Charles McGraw as the titular \"killers\". His association with the Lab came back to haunt him later in the decade, when its members fell under the scrutiny of the House Un-American Activities Committee. Although he was not a communist, Brown was blacklisted in 1952, and was eventually compelled to relocate with his family to England between 1953 and 1993. Overseas he was able to resume acting on stage, TV and films; he also directed for the stage and TV. He was best known for his role as Luke Skywalker\'s uncle, Owen Lars, in Star Wars Episode IV: A New Hope (1977). He returned to the United States in the 1990s and in later years made the rounds of autograph shows. Phil Brown died of pneumonia on February 9, 2006 at the age of 89.', 2, '1916-04-30', '2006-02-09', 'Cambridge, Massachusetts', '/vVU92p28YEvwpMSxIdzblqRE2sh.jpg'),
(33743, 'Gus Schilling', 'August \"Gus\" Schilling (June 20, 1908 - June 16, 1957) was an American actor.', 2, '1908-06-20', '1957-06-16', 'New York City, New York, USA', '/gAdDSMelnQsrfTYDmAmMquRe7KY.jpg'),
(36221, 'Sam Anderson', 'Sam Anderson is an actor.', 2, '1945-05-13', NULL, 'Wahpeton - North Dakota - USA', '/AnSyGuhjALUwUzMfQFhYMSJp4ra.jpg'),
(37336, 'Kimberly Blair', '', 0, NULL, NULL, NULL, NULL),
(37821, 'Michael Conner Humphreys', 'Michael Conner Humphreys was born in 1985 in Independence, Mississippi, USA. He is an actor, known for Forrest Gump (1994), Pathfinders: In the Company of Strangers (2011) and Little Forrest (2009).', 2, '1985-03-01', NULL, 'Independence - Mississippi - USA', NULL),
(37822, 'Peter Dobson', '', 2, '1964-07-16', NULL, 'Red Bank, New Jersey, USA', '/hvBUOf3hLnjUGbZuSwZWG5m76ur.jpg'),
(37823, 'Sonny Shroyer', 'Sonny Shroyer was born in Valdosta, Georgia, a small city on the Georgia-Florida border. Shroyer, whose given name is Otis Burt Shroyer Jr., grew up steeped in the traditions of the deep South. He worked in the tobacco warehouses pushing tobacco buggies and helped his father in their fruit stand-ice cream parlor business. His prowess in high school football landed him a football scholarship at Florida State University (he later ended up playing football in the movie The Longest Yard (1974) with another FSU football player, Burt Reynolds). However, his football career was cut short by an injury, and Shroyer finished his education at the University of Georgia, where he earned his degree in business.', 2, '1935-08-28', NULL, 'Valdosta, Georgia, USA', '/4t9cuvb2ERjBSEwQZi2gdHMoS3g.jpg'),
(37824, 'Jed Gillin', '', 0, NULL, NULL, NULL, NULL),
(37825, 'Afemo Omilami', 'Afemo Omilami is an American actor.', 2, '1950-12-13', NULL, 'Petersburg, Virginia, USA', '/usW1GHq20ZEX3rpei1HpeXfSpiP.jpg'),
(37827, 'John William Galt', '', 2, '1940-04-04', NULL, 'Jackson, Mississippi, USA', NULL),
(37828, 'Nora Dunfee', '', 1, NULL, NULL, NULL, '/x6Mv6OcxemBbEUg9SGcQTAZZ5WP.jpg'),
(37829, 'Michael Mattison', '', 2, NULL, NULL, NULL, NULL),
(37830, 'Kitty K. Green', '', 1, NULL, NULL, NULL, NULL),
(37831, 'Marlena Smalls', '', 1, NULL, NULL, NULL, '/hAd99U0YoeXdpiN2zCosZT8XBtf.jpg'),
(37832, 'Kevin Mangan', '', 0, NULL, NULL, NULL, NULL),
(42570, 'Don Henderson', 'Born Donald Francis Henderson in Leystonstone, 1931, Don Henderson was an English actor of stage, television and screen. He was best known for playing both \"tough guy\" roles and authority figures, and is remembered for his portrayal of detective George Bulman between 1976 and 1987 in a trilogy of popular Granada Television police drama series; The XYY Man, Strangers, and Bulman. Following the end of Bulman, Henderson starred as the priest Frank Kane in the BBC drama series The Paradise Club, penned by Bulman creator Murray Smith.  Henderson starred in several cult and sci fi serials and films, most notably in the first Star Wars movie in which he played General Tagge, and Doctor Who and Red Dwarf. Prior to acting, Henderson was a dental technician in the army and a detective sergeant in the Essex constabulary, but he resigned when he found he had sympathy for the criminals he was obliged to arrest. He was married twice, firstly to  Hilary who died in 1977, and then to the actress Shirley Stelfox, whom he met filming The XYY Man. The pair set up home in Stratford-Upon-Avon and appeared together professionally many times until his death from throat cancer in 1997.', 2, '1932-11-10', '1997-06-22', 'Leytonstone, London, England, UK', '/AsD4GsSOsWFO5sR8UQ5ra7Hiv9I.jpg'),
(42715, 'Amber Smith', 'When Anheuser-Busch chose Amber Smith as the spokesperson for its new Michelob Ultra Amber lite beer, it was on a mission. Through posters, life-size standees and Point-of-purchase promotional materials, Amber\'s image was plastered across the nation. However, it was the 20-city \"Meet Amber\" tour that delivered on the campaign title! A gifted high school student with a 155 IQ, Amber was discovered at an international modeling convention. The 15-year-old won and soon flew to Paris, where she worked hard and often and established a reputation for being passionate and expressive both on film and in print. Her \"exotic\" good looks drew the attention of top photographers such as the famous \n\nHelmut Newton, but it was her chameleon-like quality that got her on the covers of such prestigious magazines as \"Vogue\", \"Elle\", \"Esquire\", \"Maxim\" and \"Playboy\". Amber walked the runway for Chanel and represented Loreal Cosmetics and Wonderbra in their national advertising campaigns. She then achieved the ultimate accolade for a fashion model: appearing in the coveted role of \"Sports Illustrated\" magazine\'s swimwear model. She has produced four award-winning calendars, two nationally released posters and a modeling documentary DVD, \"Amber Smith Raw\" (available in stores). Amber has already completed two movie scripts and has started on a how-to book that will contain her own stories, detailed experiences and opinions on the modeling and entertainment world. After ripping through the modeling world, she added acting to her resume. She has worked with such acclaimed directors as \n\nCurtis Hanson, Abel Ferrara, Paul Mazursky andBarbra Streisand and landed parts in two Academy Award-winning movies, L.A. Confidential (1997) and American Beauty (1999), as well as a host of others. Her television credits include Dame un respiro (1997) and Friends (1994) (as \"Amber Smith, Supermodel\"). In 2005 E! Entertainment chose Amber for a reality show pilot, titled \"The Amber Smith Project,\" which follows Amber\'s efforts to open up a modeling agency in Miami Beach. She also filmed yet another pilot, \"The Anchorwoman,\" in which she will take over the life of a broadcast journalist. \"The Anchorwoman\" is in development. She launched the 2006 Michelob Ultra Amber Lite beer \"Meet Amber\" campaign, which was created entirely around her. All promotional materials feature her image, name and signature. The \"Meet Amber\" national tour was launched the summer of 2006 through the end of the year.', 1, '1971-03-02', NULL, 'Tampa - Florida - USA', '/guVekkWq1acOjxVUgdEyIGPiFVU.jpg'),
(42961, 'Jacqueline Lovell', 'Jacqueline Lovell (born 9 December 1974) is an American actress born and raised in Southern California. Most of her roles have been in B-films and erotic movies.  From a very young age, she had the immense innate talent and enthusiasm for performance. She expressed this through school musicals and church plays from grade school through high school. In much of her free time, she was writing skits and performing them for her family. She attended many schools during her formative years, which instilled drive and independence in her. At eighteen, she went to Santa Monica College to pursue accounting and later landed a full time job as an accountant.', 1, '1974-12-09', NULL, 'Southern California, California, USA', '/vIXpalWXdJZBsnS3zkjQZMjnV1L.jpg'),
(46921, 'Michael Jace', '​From Wikipedia, the free encyclopedia.  \n\nMichael Jace (born July 13, 1965) is an American actor. He starred in State of Play with Russell Crowe. He is best known for his role as the bisexual Los Angeles Police Officer Julien Lowe in the FX drama The Shield. He can be see in Marshall Cook\'s next movie, Division III: Football\'s Finest. He also has starred in the movies The Replacements; playing a prison inmate turned football player, Forrest Gump; playing a member of the Black Panthers, The Fan; playing an arrogant ticket scalper, as well as an array of TV appearances including the 1995 HBO TV movie Tyson (as boxer Mitch Green), Law &amp; Order, and the 1999 Fox TV movie Michael Jordan: An American Hero (as Jordan). Description above from the Wikipedia article Michael Jace, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1965-07-13', NULL, 'Paterson - New Jersey - USA', '/dTHdnj0qfBx6sXr9cT4Xxu0AcIG.jpg'),
(47401, 'Drewe Henley', '', 2, NULL, '2016-02-14', 'Malvern, Worcestershire, England, UK', '/qPwONYRA8YRC7z2i1ZIJZlm1PNs.jpg'),
(47698, 'Denis Lawson', '​From Wikipedia, the free encyclopedia\n\nDenis Stamper Lawson (born 27 September 1947) is a Scottish actor and director. He is perhaps best known for his roles as John Jarndyce in the BBC\'s adaptation of Bleak House and as Gordon Urquhart in the film Local Hero.\n\nDescription above from the Wikipedia article Denis Lawson, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1947-09-27', NULL, 'Perthshire, Scotland, UK', '/31CpvrSXT5UQv2LjW6T1fBTLrN5.jpg'),
(52422, 'Michael DeLorenzo', 'An American actor, director and musician. He is best known for his portrayal of NYPD Detective Eddie Torres on the Fox Thursday night mid-1990s television series New York Undercover.\n\nDescription above from the Wikipedia article Michael DeLorenzo, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1959-10-31', NULL, 'The Bronx, New York, USA', '/dAYG7AcOYG4ZNEvC8isxBxe5Vjx.jpg'),
(53508, 'Esko Nikkari', 'From Wikipedia, the free encyclopedia.\n\nEsko Nikkari (23 November 1938 Lapua, Finland – 17 December 2006 in Seinäjoki, Finland) was a prolific Finnish actor who made more than 70 appearances on film and television. He debuted in 1974 in the movie Karvat.\n\nNikkari was a workhorse of the Kaurismäki brothers, with whom he first worked on Rikos ja rangaistus in 1983. His last role with Aki Kaurismäki was in Man without a Past in 2002. He starred in the 1994 film Aapo opposite actors such as Taisto Reimaluoto, Ulla Koivuranta and Kai Lehtinen. More recently, he has appeared in a number of Timo Koivusalo films such as Kaksipäisen kotkan varjossa (2005), which is the last full-length movie he appeared in.\n\nDescription above from the Wikipedia article Esko Nikkari, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1938-11-23', '2006-12-17', 'Lapua, Finland', '/mNiyD3BOzWba4CB0VTbIqA4EAVm.jpg'),
(53512, 'Marja Packalén', '', 1, '1948-11-02', NULL, 'Helsinki, Finland', NULL),
(53587, 'Peter Diamond', '', 2, '1929-08-10', '2004-03-27', 'Durham, England, UK', '/nVb4nFvWloTdzopD42aNV5osYKU.jpg'),
(54768, 'Turo Pajala', '', 2, '1955-11-16', '2007-02-28', 'Joutseno, Finland', NULL),
(54769, 'Susanna Haavisto', 'From Wikipedia, the free encyclopedia\n\nSusanna Haavisto (born 20 October 1957, Helsinki) is a Finnish actress and singer.\n\nShe has taken part in several movies and TV programs. She was UNICEF National Ambassador in 1980.\n\nDescription above from the Wikipedia article Susanna Haavisto, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1957-10-20', NULL, 'Helsinki, Finland', '/lhjoqlBFCvshchMAd2lQLWV7z7I.jpg'),
(54770, 'Eetu Hilkamo', '', 2, '1981-01-19', NULL, NULL, NULL),
(55964, 'Christine Harnos', 'Canadian actress and co-founder of the circus outreach organization Circus Remedy', 1, '1968-11-16', NULL, 'Toronto, Ontario,  Canada', '/k3Y82zOyU2Tb5U2KEfz9FW1b17s.jpg'),
(56273, 'Esko Salminen', '', 2, '1940-10-12', NULL, 'Helsinki, Finland', '/74y98xEaOSBC5xp1vpcm9VrFGLW.jpg'),
(58475, 'Angus MacInnes', '​From Wikipedia, the free encyclopedia\n\nAngus MacInnes (born 27 October 1947) is a Canadian actor. He is most famous for his role as Gold Leader in Star Wars Episode IV: A New Hope, and as former hockey great Jean \"Rosey\" LaRose in the comedy Strange Brew. He also appeared in Witness, as a corrupt policeman, and he is currently starring in BBC Scotland soap River City as Sonny.\n\nDescription above from the Wikipedia article Angus MacInnes, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1947-10-27', NULL, 'Windsor, Ontario, Canada', '/dOguFZS0jlFREigfMpcS8aitMBj.jpg'),
(64189, 'Ara Celi', '​From Wikipedia, the free encyclopedia\n\nAra Celi (born May 31, 1974) is an American actress active in American film and television. She had a starring role in the minor 1997 dance movie Looking for Lola, but she is probably best known for her role as Ampata Gutierrez aka \"Inca Mummy Girl\" from season two of Buffy the Vampire Slayer.\n\nDescription above from the Wikipedia article Ara Celi, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1974-05-31', NULL, 'El Paso, Texas, U.S.', NULL),
(68842, 'John Cho', 'John Cho is a Korean American actor best known as playing Harold in the Harold and Kumar film series, as well as playing helmsman Hikaru Sulu in 2009\'s Star Trek.', 2, '1972-06-16', NULL, 'Seoul, South Korea', '/4Lar4uy8gk78cEocq6ERPRFWt3e.jpg'),
(69249, 'Eddie Byrne', '', 2, '1911-01-31', '1981-08-21', 'Birmingham, England, UK', '/mWivEyJoTjfhOZ1m4EQJGn9lCZh.jpg'),
(69552, 'Sakke Järvenpää', '', 2, NULL, NULL, NULL, NULL),
(70261, 'Nat King Cole', 'From Wikipedia, the free encyclopedia\n\nNathaniel Adams Coles (March 17, 1919 – February 15, 1965), known professionally as Nat King Cole, was an American jazz pianist and vocalist. He recorded over one hundred songs that became hits on the pop charts. His trio was the model for small jazz ensembles that followed. Cole also acted in films and on television and performed on Broadway. He was the first African American man to host an American television series.', 2, '1919-03-17', '1965-02-15', 'Montgomery, Alabama, USA', '/cHZ22XzT0H9CJQjFBXU4cyK1Gjb.jpg'),
(76742, 'Marissa Jaret Winokur', '', 1, '1973-02-02', NULL, NULL, '/9a8Phgwhrjw4e2Fng1ItNDL7QS0.jpg'),
(79489, 'Leslie Schofield', '', 2, '1938-12-12', NULL, 'Oldham, Lancashire, England, UK', '/zl0NIWhvXcladZDPiJ9pWYi5vkD.jpg'),
(81692, 'Stephen Bridgewater', '', 2, '1953-08-24', NULL, 'Hutchinson, Kansas, USA', NULL),
(84493, 'Mickie McGowan', '', 1, NULL, NULL, NULL, '/4K1HF10EvDjdaIoDAnWqFZjnmvk.jpg'),
(84901, 'Bryan Hanna', '', 2, '1962-11-10', NULL, 'Los Angeles, California, USA ', NULL),
(86434, 'Joe Alaskey', 'From Wikipedia, the free encyclopedia.\n\nJoseph Francis Alaskey III (April 17, 1952 – February 3, 2016) was an American stand-up comedian, actor, voice artist, and impressionist.\n\nDescription above from the Wikipedia article Joe Alaskey, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 2, '1952-04-17', '2016-02-03', 'Troy, New York, U.S.', '/bYC9pHuC8ownvMlEgWoMEwItsUu.jpg'),
(92343, 'Matt Rebenkoff', '', 0, NULL, NULL, NULL, NULL),
(92658, 'Byron Minns', '', 2, NULL, NULL, NULL, '/9El2mo2CDgtAjF64TmEWTqY2pNS.jpg'),
(95140, 'John Voldstad', '', 0, NULL, NULL, NULL, '/35w34difjEgy3ZBdzUD1lDYUEuj.jpg'),
(98873, 'Greg Brown', '', 0, NULL, NULL, NULL, NULL),
(101687, 'Alison Faulk', 'Alison grew up in South Florida with musician parents. She found her love of dance at an early age and it hasn’t let up. She moved to Los Angeles to study on a Joe Tremaine Scholarship and learn about as many dance styles as she could. This lead to a successful dance career in film, television, and with artists such as Janet Jackson, Britney Spears, Missy Elliot and Miley Cyrus. She is a proud member of the all female hip-hop crew The Beat Freaks, as well as the Groovaloos. Some of her choreography credits include P!NK, Madonna, Jennifer Lopez and Ricky Martin. She has choreographed episodes of Mindy Project, Lip Sync Battle, and The Sing Off. She loves film and to date has worked on 10 features. Along with her partners Teresa and Luke, she choreographed both Magic Mike films and collaborated with Channing Tatum on the creation of Magic Mike Live.', 1, '1977-01-08', NULL, 'Pembroke Pines, Florida, USA', '/yePoQDGZFQ0GMCgOd9qbqioJRAT.jpg'),
(102710, 'Michael Wiseman', '', 2, '1967-04-12', NULL, 'Northern California, USA', '/hNPX5FGhJVDZIbsMtnoujqGh8Qa.jpg'),
(104149, 'Maria De Aragon', '', 1, NULL, NULL, NULL, '/zspzXQA64WEzOQSykpzOw8SKSOD.jpg'),
(105021, 'Georgia Backus', '', 1, '1900-10-13', '1983-09-07', NULL, '/xtyMmOZJ8NznV99MbBvYtAzs0Fj.jpg'),
(105988, 'Galyn Görg', '', 1, '1964-07-15', NULL, 'Los Angeles, California, USA', '/au8FhiUX7KOLcVjchpuCIh0LAcQ.jpg'),
(106172, 'Mato Valtonen', '', 2, '1955-02-21', NULL, 'Loimaa, Finland', '/s1W99Md1jDEvtNAmMtFqjILyxIt.jpg'),
(110319, 'George Roubicek', '', 2, '1935-05-25', NULL, 'Vienna, Austria', '/rst8SIBPenI8lmvwIwK0GcJ4d3x.jpg'),
(110757, 'Jorma Markkula', '', 2, '1945-10-02', NULL, 'Ypäjä, Finland', '/oQduzpvqQhArEoa1kM8IOqySBmm.jpg'),
(114326, 'Mike Jolly', '', 2, NULL, NULL, NULL, '/vkam2sRjy7yfQj847rn8Nk8tOMb.jpg'),
(121667, 'Everlast', '', 0, NULL, NULL, NULL, NULL),
(122984, 'Bert Moorhouse', 'Bert Moorhouse was born on November 20, 1894 in Chicago, Illinois, USA as Herbert Green Moorhouse. He was an actor, known for Rough Ridin\' Red (1928), Hey Rube! (1928) and The Woman I Love (1929). He was married to Mary. He died on January 26, 1954 in Hollywood, California, USA.', 2, '1894-11-20', '1954-01-26', 'Chicago, Illinois, USA', '/c8E2e4rlsdI75CthWxOdGXWbwu9.jpg'),
(129725, 'Al Harrington', '', 2, '1935-12-12', NULL, NULL, '/FepXr5LVYheBPiKUtka0ScSRIy.jpg'),
(131625, 'Shelagh Fraser', 'From Wikipedia, the free encyclopedia\n\nShelagh Fraser (25 November 1920 – 29 August 2000) was a British actress. She was best-known for her role as Luke Skywalker\'s ill-fated aunt, Beru Lars in Star Wars (though Fraser\'s voice was dubbed in some prints of the film). She appeared in more than 50 films and TV shows during her career, including Z-Cars and Softly, Softly, A Family at War and Heartbeat on television, and such films as The Witches, Till Death Us Do Part, Doomwatch, and Hope and Glory. She was married and divorced from Anthony Squire. She was the sister of ballerina/actress Moyra Fraser.\n\nDescription above from the Wikipedia article Shelagh Fraser, licensed under CC-BY-SA, full list of contributors on Wikipedia.', 1, '1920-11-25', '2000-08-29', 'Surrey, England', '/2QucvNmG3mOvSflbXRkY5renpQT.jpg'),
(132538, 'Jack Purvis', 'Jack Purvis was a British film actor. Purvis was a dwarf, and thus was mainly cast in roles requiring actors of short stature. Purvis appeared as a different alien creature in each of the three films of the original Star Wars trilogy, and also appeared in three of director Terry Gilliam\'s early fantasy films: Time Bandits, Brazil, and The Adventures of Baron Munchausen. Several years before his death, Purvis became quadriplegic after breaking his neck in a car accident. He died in November 1997 at the age of 60.', 2, '1937-07-13', '1997-11-21', 'London - England - UK', '/mElieLKynpuzRkt8kwovTdL6Mh.jpg'),
(148122, 'Geoffrey Blake', '', 2, '1962-08-20', NULL, 'Baltimore - Maryland - USA', '/uKdiO6QagiT0mZ7tf9Xrl8OZUKy.jpg'),
(148389, 'Mari Rantasila', '', 1, '1963-01-07', NULL, 'Pori, Finland', NULL),
(151819, 'Jeremy Sinden', 'Jeremy Sinden was an English actor who specialised in playing eccentric military men and overgrown schoolboys.', 2, '1950-06-14', '1996-05-29', 'London, England, U.K.', '/4XJOeDKTlkAQH18A3t3W2UY9BYV.jpg'),
(152796, 'Lisa Cloud', '', 1, NULL, NULL, NULL, NULL),
(154124, 'Eugene Williams', '', 2, '1959-03-21', '2002-12-22', 'Youngstown, Ohio, USA', NULL),
(154697, 'Kirk Ward', '', 2, NULL, NULL, NULL, NULL),
(159108, 'Larry Ward', '', 2, '1924-10-03', '1985-02-16', 'Columbus, Ohio, USA', NULL),
(160947, 'Morgan Upton', '', 0, '1930-08-11', '1991-12-22', NULL, '/n8fCBnBSFoPSGxOT4FN2kn5wmtz.jpg'),
(161301, 'Jerry Walter', '', 2, NULL, NULL, NULL, NULL),
(162432, 'Jack Klaff', '', 2, '1951-08-06', NULL, 'Johannesburg, South Africa', '/tD8WY2RRmhBQdNY9gGHFgcI4yBA.jpg'),
(163441, 'Michael McFall', '', 2, NULL, NULL, NULL, '/sAGke3vMNW1nIxEzNIlelTcrr6J.jpg'),
(166258, 'Malcolm Tierney', '', 2, '1938-02-25', NULL, NULL, '/nDjDgg9dTISkUGOWnMQ1Ng2E4FO.jpg'),
(166961, 'Sue Casey', '', 1, '1926-04-08', NULL, 'Los Angeles, California, USA ', NULL),
(169643, 'Timothy McNeil', '', 2, '1958-01-01', NULL, 'Houston, Texas, USA ', NULL),
(170051, 'Michael Kemmerling', '', 2, NULL, NULL, NULL, NULL),
(173277, 'Robb Skyler', '', 2, NULL, NULL, NULL, '/uP3yrywgEDB2zz0ZSS94vSWszOz.jpg'),
(176329, 'Charles Boswell', '', 2, NULL, NULL, NULL, '/8k5ybaKZjuSy89RSpI0Mi3oIf8H.jpg'),
(177623, 'Matthew Kimbrough', '', 2, '1952-01-01', NULL, NULL, '/7e5670Oi06CxylJhxRzMHO1gKOO.jpg'),
(184980, 'Burnell Tucker', 'Burnell Tucker is an actor.', 0, NULL, NULL, NULL, '/kSMCUUbt6pplhEKSR3uX8rJDXOy.jpg'),
(186229, 'Barry Copping', '', 0, NULL, NULL, NULL, NULL),
(187398, 'Peter Sumner', '', 2, '1942-01-29', '2016-11-22', 'Waverley, Sydney, New South Wales, Australia', '/6jxSgwF82SrGtZPn0gbLhH9zeTR.jpg'),
(190453, 'Al Lampert', '', 0, NULL, NULL, NULL, '/hqyJHDjR3gH2CdhCe0qHzDthz5y.jpg'),
(196855, 'Bob Penny', '', 2, NULL, NULL, NULL, '/28JAyf5kFHLSxI8Ny6HXMyU84nO.jpg'),
(198219, 'Mike Lally', '', 2, '1900-06-01', '1985-02-15', 'Manhattan, New York City, New York, USA', NULL),
(199356, 'Paul Blake', '', 2, NULL, NULL, NULL, '/s4vguxTwtwWOl69UMY3yfUWU4eS.jpg'),
(201344, 'Joe Kaye', '', 0, NULL, NULL, NULL, NULL),
(202276, 'Graham Ashley', '', 2, '1927-04-26', '1979-10-30', 'Northampton, England, UK', NULL),
(202402, 'Harry Fielder', '', 2, '1940-04-26', NULL, 'Islington, London, England, UK', '/jsZ0clQ7wzDgJGQnWGHeE8rBGG4.jpg'),
(204997, 'Hanna Hall', '', 1, '1984-07-09', NULL, 'Denver, Colorado, USA', '/tp01iBjHwvkv5e5Zfal9foXcfno.jpg'),
(216087, 'Alex McCrindle', 'McCrindle began his acting career in 1937 starring in minor roles in UK Television. \n\nFrom 1946 to 1951 he played the role of Jock Anderson in Dick Barton – Special Agent. In 1951 he starred in his first film in the USA, The House in the Square. From there his acting career took off. \n\nHe then did five more films: I Believe in You (1952), The Kidnappers (1953), Trouble in the Glen (1954), Geordie (1955) and Depth Charge (1960). From 1962 to 1974 he went to television acting. In 1976 he was cast as General Dodonna in the first Star Wars film. \n\nHe went back to minor roles on TV, including the role of the eccentric veterinarian Ewan Ross on All Creatures Great and Small.', 2, '1911-08-03', '1990-04-20', ' Glasgow, Scotland, UK', '/LTLiQPMnKESxGVHhZ7n2qPAuMi.jpg'),
(222320, 'Pekka Laiho', '', 2, '1943-05-13', NULL, 'Helsinki, Finland', '/iYTw4uW0XgBSrhYTw7QssZgyEhQ.jpg'),
(227857, 'Anthony Forrest', '', 2, '1951-07-25', NULL, 'Birmingham, England, UK', '/jSP7ulxXOCbJy5J3Brz0x1gHw4n.jpg'),
(252527, 'Rusty Goffe', '', 0, NULL, NULL, NULL, '/m23rntDJk9ZfPLM8yI89UsCUydw.jpg'),
(301657, 'Colin Higgins', 'Colin Higgins was a British actor famous for many appearances on British television. In 1977 Higgins was cast as Wedge Antilles in Star Wars and appears in the role for one scene only. The reason for this is that Higgins was fired after a day of filming because he was having difficulty recalling his lines. He was replaced by Dennis Lawson, who went on to have great success in the role, whilst Higgins\' performance went uncredited as \'Rebel Pilot\'. For many years he was known by fans as \'Fake Wedge\' until a retcon finally gave his character a unique name and backstory, that of Colonel Takbright. He died in December, 2012.', 2, NULL, '2012-01-01', NULL, '/sF69BpL26VOAnYeLbr9RDvpAnW8.jpg'),
(390158, 'Tom Sylla', '', 0, NULL, NULL, NULL, NULL),
(406976, 'Vanessa Roth', '', 1, NULL, NULL, NULL, NULL),
(567126, 'William Shipman', '', 0, NULL, NULL, NULL, NULL),
(568656, 'Reshma Gajjar', '', 1, NULL, NULL, NULL, '/zG9Pv5G5HEWYdegSmAx7SLBNvHn.jpg'),
(590519, 'Sam Ash', 'Sam Ash was born on August 28, 1884 in Campbell County,Kentucky, USA. He was an actor, known for Unmasked (1929), Kiss and Make-Up (1934) and The Heat\'s On (1943). He died on October 20, 1951 in Hollywood, California, USA.', 2, '1884-08-28', '1951-10-20', 'Campbell County, Kentucky, USA', '/9yWsQsSXQTTMcQIzpGjjyMDdT86.jpg'),
(939834, 'Carmen Laroux', '', 1, '1909-09-04', '1942-08-24', NULL, '/h5FBS2qTnbZjqHGB7ZCT87FI5L0.jpg'),
(940329, 'Herbert Corthell', 'From Wikipedia, the free encyclopedia\n\nHerbert Corthell (born Joseph Bertram Corthell, January 20, 1878 – January 23, 1947) was an American stage and film actor. He was born in Boston, Massachusetts, and died in Hollywood, California.', 2, '1878-01-20', '1947-01-23', 'Boston, Massachusetts, USA', NULL),
(945285, 'Don Ackerman', '', 2, NULL, NULL, NULL, NULL),
(951881, 'George Kelly', '', 2, NULL, NULL, NULL, NULL),
(964699, 'Alan Harris', '', 2, '1938-05-28', '2020-01-31', 'Enfield, Middlesex, London, England, UK', '/nc83B1SJ7xVJjx8Op7HolOM70uc.jpg'),
(975108, 'Mark Matheisen', '', 2, NULL, NULL, NULL, NULL),
(975503, 'Bob Terry', '', 0, NULL, NULL, NULL, '/wKcB1JbqJdpc6IsQZv7dymF0x7G.jpg'),
(981048, 'Nicholas Bird', '', 2, NULL, NULL, NULL, '/grsKC7Yp8Sfx8fwJnEM59GG4ogX.jpg'),
(981049, 'LuLu Ebeling', '', 1, NULL, NULL, NULL, NULL),
(1012562, 'Anthony Lang', '', 0, NULL, NULL, NULL, NULL),
(1019727, 'Christopher Jones', 'Christopher Jones is an American actor and dancer. He is best known for playing Wade in the feature film You Got Served.', 2, '1982-02-04', NULL, 'Myrtle Beach, South Carolina, USA', '/2EuDwtnOIJgLlBZWwpWYia0rxz3.jpg'),
(1034494, 'Tarja Keinänen', '', 1, '1950-06-29', NULL, 'Oulu, Finland', NULL),
(1034935, 'Jack Gargan', '', 2, NULL, NULL, NULL, NULL),
(1077264, 'Relioues Webb', '', 0, NULL, NULL, NULL, NULL),
(1086499, 'Kylli Köngäs', '', 1, '1962-11-15', NULL, 'Tervola, Finland', NULL),
(1086500, 'Jukka-Pekka Palo', '', 2, '1954-08-07', NULL, 'Helsinki, Finland', NULL),
(1088274, 'Matt Wallace', '', 0, NULL, NULL, NULL, NULL),
(1089167, 'Steve DeRelian', '', 2, NULL, NULL, NULL, '/9oJhzdLEgOz6phE8AQN7s9miy2M.jpg'),
(1099216, 'Gene Coogan', '', 2, '1909-08-30', '1972-01-26', 'Essex, New Jersey, USA', '/gOIW8SdqJNzzjUca5DiYpziVdRM.jpg'),
(1142371, 'Maurice Costello', 'From Wikipedia\n\nMaurice George Costello (February 22, 1877 – October 29, 1950)[1] was an American prominent vaudeville actor of the late 1890s and early 1900s, who later played a principal role in early American films, as both a leading man, supporting player and a director.\n\nCostello was born in Pittsburgh, Pennsylvania to Irish immigrants Ellen and Thomas Costello. He appeared in his first motion picture in 1905, in which he had the honour of appearing in the first serious film to feature the character of Sherlock Holmes in the movie Adventures of Sherlock Holmes, in which Costello played the title role. He continued to work for Vitagraph, being a member of the first motion picture stock company ever formed, playing opposite Florence Turner. Among some of his best known pictures are A Tale of Two Cities, The Man Who Couldn\'t Beat God and For the Honor of the Family. After an absence of some years he returned to the screen. He was married to actress Mae Costello (née Altschuk). His descendants include two daughters, actresses Dolores Costello and Helene Costello, a grandson John Drew Barrymore, and a great granddaughter Drew Barrymore. He was one of the world\'s first leading men in early American cinema, but like a lot of other silent screen stars, he found the transition to \"talkies\" extremely difficult, and his leading man status was over. However, Costello was a trouper, and continued to appear in movies, often in small roles and bit parts, right up until his death in 1950.', 2, '1877-02-22', '1950-10-29', 'Pittsburgh, Pennsylvania, USA', NULL),
(1147860, 'John McCormack', '', 2, '1884-06-14', '1945-06-16', 'Athlone, County Westmeath, Ireland', '/cv5xQdV3EQhMrAQYI2xEyu5fzLK.jpg'),
(1148750, 'Linda Jones', '', 0, NULL, NULL, NULL, NULL),
(1150593, 'Brendan Shanahan', '', 0, NULL, NULL, NULL, '/4r0ql7oTxme7SXBvTnRxg5F28OH.jpg'),
(1170356, 'Jack Egan', '', 2, '1904-11-03', '1982-11-06', 'Paterson, New Jersey, USA', '/8UR9nR9mZS3amBbwmsqnr24iGfl.jpg'),
(1177496, 'Erkki Pajala', '', 2, '1929-04-16', '1992-10-28', 'Jyväskylä, Finland', NULL),
(1178140, 'Tim Condren', '', 2, NULL, NULL, NULL, '/lBOWNSOnfUsAmTJtrs3KB3jau7D.jpg'),
(1183443, 'Marcus Powell', '', 2, '1909-11-23', NULL, 'Middlesex - England - UK', NULL),
(1190780, 'Tiffany Hillkurtz', '', 1, NULL, NULL, NULL, '/uBnQdF0nH1dARtO6BBvMgD8W7nw.jpg'),
(1195602, 'Steve Gawley', '', 0, NULL, NULL, NULL, '/vsEmIwvba0hoOAFHCoIiTOWztK5.jpg'),
(1198371, 'Sonny Bupp', '', 0, NULL, NULL, NULL, NULL),
(1199823, 'Buddy Messinger', '', 2, '1907-10-26', '1965-10-25', 'San Francisco, California, USA', NULL),
(1207842, 'Veikko Uusimäki', '', 2, '1921-01-26', '2008-05-25', 'Kurikka, Finland', NULL),
(1207858, 'Kauko Laalo', '', 2, NULL, NULL, NULL, NULL),
(1211731, 'Jordan Ranft', '', 2, '1991-12-24', NULL, NULL, NULL),
(1215432, 'Margo Moorer', '', 1, NULL, NULL, NULL, '/9BqVk8t7Mw9RiY4FILgNfnwm2eD.jpg'),
(1216947, 'David Ankrum', '', 2, '1947-05-02', NULL, 'Santa Clara County, California, USA', '/fgGuorb8qmzboUvRHx9mPo0svMx.jpg'),
(1219143, 'Chelsea Hertford', '', 1, NULL, NULL, NULL, NULL),
(1226696, 'Will Zahrn', '', 0, NULL, NULL, NULL, '/5JDnuufySepQ1fig7Hga4xL4nio.jpg'),
(1234546, 'Sally Corner', '', 1, '1891-08-02', '1959-03-05', 'Milwaukee, Wisconsin, USA', NULL),
(1235787, 'Steven Griffith', '', 2, NULL, NULL, NULL, '/u2bzayCrQ8ssJY7MqZZpPAOyNjh.jpg'),
(1271059, 'Lightning Bear', '', 2, NULL, NULL, NULL, '/2QleSOdmvlByiYU8fiOPkFVDnPt.jpg'),
(1271060, 'Jon Berg', '', 2, NULL, NULL, NULL, '/rKC37tdy8qtHlNnrhpILCnrbw9s.jpg'),
(1271061, 'Doug Beswick', '', 2, NULL, NULL, NULL, '/q8AM528d8ZQ04S5tAGnLChshzTh.jpg'),
(1271062, 'Janice Burchette', '', 0, NULL, NULL, NULL, NULL),
(1271063, 'Ted Burnett', '', 2, NULL, NULL, NULL, '/yN7MneL4IBMIKH62mKflgbnEZ1f.jpg'),
(1271064, 'John Chapman', '', 2, NULL, NULL, NULL, NULL),
(1271065, 'Gilda Cohen', '', 2, NULL, NULL, NULL, '/wt70iSgbIalBAwj1ZSvQXrRbuhM.jpg'),
(1271066, 'Alfie Curtis', '', 2, NULL, NULL, NULL, '/omAYPXQAaBz2KhiaZXdh4CW3UTY.jpg'),
(1271067, 'Robert Davies', '', 0, NULL, NULL, NULL, NULL),
(1271068, 'Robert A. Denham', '', 0, NULL, NULL, NULL, NULL),
(1271069, 'Frazer Diamond', '', 0, NULL, NULL, NULL, NULL),
(1271070, 'Warwick Diamond', '', 0, NULL, NULL, NULL, '/vtHO4gPwVk9lnCQJZkUyripkY4E.jpg'),
(1271071, 'Sadie Eden', '', 0, NULL, NULL, NULL, NULL),
(1271072, 'Kim Falkinburg', '', 0, NULL, NULL, NULL, NULL),
(1271073, 'Ted Gagliano', '', 0, NULL, NULL, NULL, '/zBV7BQ9XZUHR5bkxI2vm9Gq9mxa.jpg'),
(1271074, 'Salo Gardner', '', 2, NULL, NULL, NULL, '/bISshTOC6mOua9nhFvDflJIxBTX.jpg'),
(1271075, 'Barry Gnome', '', 0, NULL, NULL, NULL, '/nPm3WlZPtv6OntRjXE6sdac7uP6.jpg'),
(1271076, 'Isaac Grand', '', 0, NULL, NULL, NULL, NULL),
(1271078, 'Reg Harding', '', 0, NULL, NULL, NULL, NULL),
(1271079, 'Frank Henson', '', 0, NULL, NULL, NULL, '/u6CHwEOz9wqIJgXAQSOdDBD5cfr.jpg'),
(1271080, 'Christine Hewett', '', 0, NULL, NULL, NULL, '/hNlP7wdCLMMVIDpd6k6Crwz69kn.jpg'),
(1271081, 'Arthur Howell', '', 0, NULL, NULL, NULL, NULL),
(1271082, 'Tommy Ilsley', '', 0, NULL, NULL, NULL, NULL),
(1271083, 'Annette Jones', '', 0, NULL, NULL, NULL, '/jt9835zfkyp3iCOgnkBhs1vkTlN.jpg'),
(1271085, 'Colin Michael Kitchens', '', 0, NULL, NULL, NULL, '/8Z7P5PE6HHKR5ekEWLdIFbuBZkb.jpg'),
(1271086, 'Melissa Kurtz', '', 0, NULL, NULL, NULL, '/yws4q3PESz6qrRkVDtB64PiTFUU.jpg'),
(1271091, 'Laine Liska', '', 0, NULL, NULL, NULL, '/1dILPbjwdIzucy6ZJJT0W6Mxxf2.jpg'),
(1271092, 'Derek Lyons', '', 2, '1958-09-25', NULL, 'London, England, UK', '/3rz4mRzDsS3PgdnOaeDH3VmmFVL.jpg'),
(1271095, 'Mahjoub', '', 0, NULL, NULL, NULL, NULL),
(1271096, 'Alf Mangan', '', 0, NULL, NULL, NULL, '/ktHP0x0MxA3YS2yVpiOrDqhcfVU.jpg'),
(1271102, 'Grant McCune', '', 0, NULL, NULL, NULL, '/mBuWl1l82lNFOQ0hjex98NIUP9P.jpg'),
(1271104, 'Geoffrey Moon', '', 0, NULL, NULL, NULL, NULL),
(1271106, 'Mandy Morton', '', 0, NULL, NULL, NULL, NULL),
(1271107, 'Lorne Peterson', '', 0, NULL, NULL, NULL, '/yfzcXwOXBlB52tuf8CDWFkGKk85.jpg'),
(1271116, 'Pam Rose', '', 0, NULL, NULL, NULL, NULL),
(1271121, 'Erica Simmons', '', 0, NULL, NULL, NULL, NULL),
(1271122, 'Angela Staines', '', 0, NULL, NULL, NULL, NULL),
(1271123, 'George Stock', '', 0, NULL, NULL, NULL, NULL),
(1271124, 'Roy Straite', '', 0, NULL, NULL, NULL, NULL),
(1271125, 'Peter Sturgeon', '', 0, NULL, NULL, NULL, NULL),
(1271126, 'John Sylla', '', 0, NULL, NULL, NULL, NULL),
(1271127, 'Hal Wamsley', '', 0, NULL, NULL, NULL, NULL),
(1271128, 'Diana Sadley Way', '', 0, NULL, NULL, NULL, NULL),
(1271131, 'Fred Wood', 'Fred Wood (born 26 October 1922, Rotherhithe, London), died January 2003, was an English actor.\n\nWood was best known for roles in Star Wars (1977), Elephant Man (1980) and From Russia with Love (1963). Wood has appeared in a large number of American films, due to filming taking place partly or entirely in Britain. As a British-based actor and supporting artist, he worked extensively in British films since the late 1940s until 2001 and television since the 1950s.\n\nHe appeared in a wide range of television shows including Dangerman, Gideon\'s Way, The Professionals, The Baron and Gone to Seed (1992).\n\nFrom Wikipedia, the free encyclopedia', 2, '1922-10-26', '2003-01-01', 'Rotherhithe, London, England, UK', '/jcQIbcwcLYTS7JAVMg1n1f36Hsv.jpg'),
(1273540, 'Aaron Michael Lacey', '', 2, '1969-05-26', NULL, 'Washington, District of Columbia, USA', '/nOtWMHMQCwcap3N3WVTnQ52MAFl.jpg'),
(1283209, 'Terrance Ray', '', 0, NULL, NULL, NULL, NULL),
(1291801, 'William Alston', '', 0, NULL, NULL, NULL, NULL),
(1294421, 'Neka Haapanen', '', 2, NULL, NULL, NULL, NULL),
(1295853, 'Harry A. Bailey', '', 0, NULL, NULL, NULL, NULL),
(1313819, 'Isabel Rose', '', 1, NULL, NULL, NULL, '/gj2r32FdQlpUXhZmpXB1XUIEHUZ.jpg'),
(1327149, 'Hallie D\'Amore', '', 0, NULL, NULL, NULL, NULL),
(1331758, 'Carl Deloro', '', 0, NULL, NULL, NULL, NULL),
(1346510, 'Don Fischer', '', 2, NULL, NULL, NULL, '/eI9AMMri9T0jDeT2BOpceCdmS3u.jpg'),
(1369283, 'Demetrius Alexis', '', 0, NULL, NULL, NULL, NULL),
(1372790, 'Erica Beck', '', 0, NULL, NULL, NULL, '/k4R1E1aXQ2hwjFUCu9Wnz0PU1H8.jpg'),
(1392671, 'Zach Hanner', 'Zach Hanner was born in Mt. Airy, North Carolina, in June of 1969 and spent his formative years growing up in nearby Pilot Mountain. After attending the North Carolina Shakespeare Festival in High Point (which featured a young Terrance Mann as Oberon in \"A Midsummer Night\'s Dream\"), he knew that the stage would be a lifelong passion. At the age of 10, he landed the lead role in the Christmas opera \"Amahl and the Night Visitors\" and, soon after, portrayed the role of Dill in \"To Kill A Mockingbird,\" both shows staged at the Andy Griffith Playhouse in Mt. Airy, Griffith\'s hometown.  Hanner also developed a love for music, taking piano lessons, playing drums in the school band and studying voice for many years, eventually earning a spot in the esteemed choral ensemble at the North Carolina Governor\'s School in 1985. Having eschewed the stage for the basketball court throughout high school, he rediscovered his love for performing while attending the University of North Carolina in Chapel Hill. He threw himself in to theater headlong, studying with amazing professors Paul Ferguson and Randall Hill in UNC\'s Performance Studies department, eventually receiving his Bachelor\'s degree.', 0, '1969-06-17', NULL, 'Mt. Airy, North Carolina, USA', NULL),
(1397945, 'Brenda Wehle', '', 1, NULL, NULL, NULL, NULL),
(1401994, 'Michael Burgess', '', 2, '1964-08-02', NULL, 'Myrtle Beach, South Carolina, USA', '/m6C4IgWPAd8kK1khGiKL2Njs0c4.jpg'),
(1404180, 'Danny Borzage', '', 2, '1896-12-24', '1975-06-17', 'Salt Lake City, Utah, USA', '/6A7s2hiuZla6fOX7cS4ijt9YpE1.jpg'),
(1405338, 'Tiffany Salerno', '', 1, NULL, NULL, NULL, NULL),
(1409948, 'Richard D\'Alessandro', '', 2, '1960-05-11', NULL, 'Massapequa, Long Island, New York, USA', '/xwBPaOF3RAvvEhnKo2xnS8hgw1K.jpg'),
(1419570, 'Robert Haines', '', 2, '1894-09-16', '1961-04-18', NULL, NULL),
(1420567, 'Ludwig Lowry', '', 0, NULL, NULL, NULL, NULL),
(1422325, 'Art Dupuis', '', 2, NULL, NULL, NULL, NULL),
(1423323, 'Walter Lawrence', '', 0, NULL, NULL, NULL, NULL),
(1441804, 'Dennis Anderson', '', 0, NULL, NULL, NULL, NULL),
(1446990, 'Daniel J. Gillooly', '', 0, NULL, NULL, NULL, NULL),
(1448568, 'Erin Cathryn Strubbe', '', 0, NULL, NULL, NULL, NULL),
(1465241, 'Lazarus Jackson', '', 2, NULL, NULL, NULL, '/mKhmw4ntka53pJDUrupNg05iSF1.jpg'),
(1468172, 'Tom Coleman', '', 2, NULL, NULL, NULL, NULL),
(1490615, 'Ron Tarr', 'Ronald Lawrence Morisco-Tarr, known as Ron Tarr and \'Big\' Ron Tarr, was a British actor and supporting artiste famed for his hirsute physical stature. Born in Willesden in Middlesex, England, Tarr got his first acting role in the 1973 Carry On film  Carry On Girls where he played a bearded audience member. This was followed by appearances in many television series such as Doctor Who, Blake’s 7, Space 1999, Are You Being Served?, The Gentle Touch, The Comic Strip Presents: 5 Go Mad in Dorset and Dramarama. He also notched up a number of film appearances including A View To A Kill, Eat the Rich (he also cameos in Motorhead’s music video soundtrack of the film) and Willow. However, it is his role as Big Ron in the BBC soap opera Eastenders that Tarr is best remembered.  He played the friendly ducking and diving market trader Big Ron from the show’s inception in 1985 to just before his untimely death from cancer at the age of 60 in October 1997. Although he was only a supporting actor and therefore his character had very few central storylines, he was often seen interacting with the main characters in the show who could always rely on his physically intimidating presence whenever trouble was brewing. After his death, he appeared in pre-recorded episodes of the soap. To explain the absence of his character, in early 1998 Big Ron was written out of the series in a storyline concerning him winning the lottery and moving to Spain.', 2, '1936-11-14', '1997-10-20', 'Willesden, Middlesex, England, UK', '/iMSzEgb5VCREfDQjtxo9cI0wYt5.jpg'),
(1503019, 'Krista Goodsitt', '', 0, NULL, NULL, NULL, NULL),
(1503020, 'Lily Houtkin', '', 1, NULL, NULL, NULL, NULL),
(1503021, 'Carolina Lancaster', '', 1, NULL, NULL, NULL, NULL),
(1503022, 'Mona Leah', '', 1, NULL, NULL, NULL, NULL),
(1503023, 'Chekesha Van Putten', '', 1, NULL, NULL, NULL, NULL),
(1503024, 'Emily Zachary', '', 1, NULL, NULL, NULL, NULL),
(1503025, 'Stephanie Rizzo', '', 1, NULL, NULL, NULL, NULL),
(1503026, 'Heather Joy Sher', '', 1, '1977-04-16', NULL, 'Marblehead, Massachusetts, USA', NULL),
(1503027, 'Elaine Corral Kendall', '', 1, NULL, NULL, NULL, NULL),
(1503028, 'David C. Fisher', '', 2, NULL, NULL, NULL, NULL),
(1503029, 'Tom Miller', '', 2, NULL, NULL, NULL, NULL),
(1503030, 'Nancy Anderson', '', 1, '1978-07-11', NULL, 'Fort Worth, Texas, USA', NULL),
(1506412, 'John Northpole', '', 0, NULL, NULL, NULL, '/7EoxU72h0m9sdO2Kt7VfrTGBENn.jpg'),
(1543340, 'Victor Romito', '', 2, '1908-03-11', '1980-05-13', 'Italy', NULL),
(1550460, 'Walter Bacon', '', 0, NULL, NULL, NULL, NULL),
(1596347, 'Rudy Germane', '', 0, NULL, NULL, NULL, NULL),
(1618488, 'Kevin Davis', '', 1, NULL, NULL, NULL, '/xF9jOiDo3evmbV8PLMie44nuVnA.jpg'),
(1658382, 'Hal Fort Atkinson', 'Hal Fort Atkinson III, born in Laurel, Mississippi passed away  January 6, 2014 at  Providence Tarzana Medical Center after a short  illness. Hal acted in The Mighty Ducks, The West  Wing,  American Beauty (the Oscar winning movie), Seinfeld, and  Creature from the SunnySide up Trailer Park.', 2, '1945-05-07', '2014-01-06', 'Laurel - Mississippi - USA', NULL),
(1729623, 'Michael Leader', '', 2, '1938-09-12', '2016-08-22', 'Hackney, London, England, UK', '/cFehQFHIymmckgvfsEhMXxQ6ni9.jpg'),
(1731500, 'J.J. Clark', '', 0, NULL, NULL, NULL, '/9Q5D4ttlAjNVhC9HrMDicUyi13w.jpg'),
(1748207, 'Joe Washington', '', 0, NULL, NULL, NULL, NULL),
(1761924, 'Safka Pekkonen', '', 2, '1954-05-14', NULL, 'Nilsiä, Finland', NULL),
(1806640, 'Jeffrey Winner', '', 2, NULL, NULL, NULL, NULL),
(2207912, 'Emily Carey', '', 0, NULL, NULL, NULL, NULL),
(2207913, 'Bonnie Ann Burgess', '', 1, NULL, NULL, NULL, '/yZ3WPRgZoFpCDFdmVgpOhUepIyi.jpg'),
(2307211, 'Svante Korkiakoski', '', 2, '1939-03-27', NULL, 'Kauhava, Finland', NULL),
(2428975, 'Bob Harks', '', 2, '1927-09-20', '2010-12-08', NULL, NULL),
(2493350, 'Matti Jaaranen', '', 2, '1951-09-22', NULL, NULL, NULL),
(2509142, 'Hannu Viholainen', '', 2, '1951-03-27', '2018-03-13', 'Mikkeli, Finland', NULL),
(2509144, 'Eino Kuusela', '', 2, NULL, NULL, NULL, NULL),
(2509145, 'Jyrki Olsonen', '', 2, NULL, NULL, NULL, NULL),
(2509146, 'Mikko Remes', '', 2, NULL, NULL, NULL, NULL),
(2509147, 'Reijo Marin', '', 2, NULL, NULL, NULL, NULL),
(2509149, 'Heikki Salomaa', '', 2, '1959-08-17', '2003-07-01', 'Helsinki, Finland', NULL),
(2509151, 'Hannu Kivisalo', '', 2, NULL, NULL, NULL, NULL),
(2509152, 'Pekka Wilen', '', 2, NULL, NULL, NULL, NULL),
(2646226, 'Frances Alfred Basil Tomlin', '', 0, NULL, NULL, NULL, '/A2RwNzsfXVigHopIJimg1mqlgg4.jpg'),
(2651471, 'Antti Ortamo', '', 2, NULL, NULL, NULL, NULL),
(2651474, 'Ulla Kuosmanen', '', 1, NULL, NULL, NULL, NULL),
(2651478, 'Pentti Koski', '', 2, NULL, NULL, NULL, NULL),
(2651481, 'Ari Korhonen', '', 2, NULL, NULL, NULL, NULL),
(2651483, 'Teuvo Rissanen', '', 2, NULL, NULL, NULL, NULL),
(2651486, 'Erkki Rissanen', '', 2, NULL, NULL, NULL, NULL),
(2651487, 'Sirkka Silin', '', 1, NULL, NULL, NULL, NULL),
(2651488, 'Marina Martinoff', '', 1, NULL, NULL, NULL, NULL),
(2651489, 'Jussi Tiitinen', '', 2, NULL, NULL, NULL, NULL),
(2651491, 'Riikka Kuosmanen', '', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id van de rating',
  `id_movie` int(11) UNSIGNED NOT NULL COMMENT 'id van de movie die de rating krijgt',
  `id_user` int(11) UNSIGNED DEFAULT NULL COMMENT 'id van de user mag leeg zijn als de user verwijderd word willen we de rating houden voor het gemiddelde te berekenen',
  `rating` int(1) UNSIGNED NOT NULL COMMENT 'een rating tussen 1 en 5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `token`
--

CREATE TABLE `token` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id van de token',
  `value` varchar(255) NOT NULL COMMENT 'de token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id van de user',
  `name` varchar(255) NOT NULL COMMENT 'naam van de user',
  `pass_hash` varchar(255) NOT NULL COMMENT 'een ge-hashed password'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_token`
--

CREATE TABLE `user_token` (
  `id_user` int(11) UNSIGNED NOT NULL COMMENT 'id van de user',
  `id_token` int(11) UNSIGNED NOT NULL COMMENT 'id van de token'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `genders`
--
ALTER TABLE `genders`
  ADD KEY `id` (`id`);

--
-- Indexen voor tabel `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`tmdb_genre_id`);

--
-- Indexen voor tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`tmdb_id`);

--
-- Indexen voor tabel `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Indexen voor tabel `movie_person`
--
ALTER TABLE `movie_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `id_person` (`id_person`);

--
-- Indexen voor tabel `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`tmdb_person_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- Indexen voor tabel `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexen voor tabel `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user_token`
--
ALTER TABLE `user_token`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_token` (`id_token`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `movie_person`
--
ALTER TABLE `movie_person`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id van de relatie tussen de movie en de persoon', AUTO_INCREMENT=7051;

--
-- AUTO_INCREMENT voor een tabel `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id van de rating';

--
-- AUTO_INCREMENT voor een tabel `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id van de token';

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id van de user';

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`tmdb_genre_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_genre_ibfk_3` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`tmdb_id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `movie_person`
--
ALTER TABLE `movie_person`
  ADD CONSTRAINT `movie_person_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`tmdb_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_person_ibfk_2` FOREIGN KEY (`id_person`) REFERENCES `people` (`tmdb_person_id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`tmdb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `user_token_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_token_ibfk_2` FOREIGN KEY (`id_token`) REFERENCES `token` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
