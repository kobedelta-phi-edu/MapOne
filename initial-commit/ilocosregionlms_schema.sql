-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 02, 2023 at 08:40 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ilocosregionlms_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `postal_code` int(4) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`postal_code`, `language`) VALUES
(2922, 'Ilocano'),
(2922, 'Tagalog'),
(2916, 'Ilocano'),
(2916, 'Tagalog'),
(2904, 'Ilocano'),
(2904, 'Tagalog'),
(2920, 'Ilocano'),
(2920, 'Tagalog'),
(2906, 'Ilocano'),
(2906, 'Tagalog'),
(2918, 'Ilocano'),
(2918, 'Tagalog'),
(2911, 'Ilocano'),
(2911, 'Tagalog'),
(2903, 'Ilocano'),
(2903, 'Tagalog'),
(2913, 'Ilocano'),
(2913, 'Tagalog'),
(2921, 'Ilocano'),
(2921, 'Tagalog'),
(2900, 'Ilocano'),
(2900, 'Tagalog'),
(2907, 'Ilocano'),
(2907, 'Tagalog'),
(2909, 'Ilocano'),
(2909, 'Tagalog'),
(2919, 'Ilocano'),
(2919, 'Tagalog'),
(2902, 'Ilocano'),
(2902, 'Tagalog'),
(2917, 'Ilocano'),
(2917, 'Tagalog'),
(2912, 'Ilocano'),
(2912, 'Tagalog'),
(2905, 'Ilocano'),
(2905, 'Tagalog'),
(2901, 'Ilocano'),
(2901, 'Tagalog'),
(2914, 'Ilocano'),
(2914, 'Tagalog'),
(2910, 'Ilocano'),
(2910, 'Tagalog'),
(2915, 'Ilocano'),
(2915, 'Tagalog'),
(2908, 'Ilocano'),
(2908, 'Tagalog'),
(2716, 'Kankanaey'),
(2716, 'Ilocano'),
(2716, 'Tagalog'),
(2708, 'Ilocano'),
(2708, 'Tagalog'),
(2727, 'Ilocano'),
(2727, 'Tagalog'),
(2724, 'Ilocano'),
(2724, 'Tagalog'),
(2732, 'Ilocano'),
(2732, 'Tagalog'),
(2718, 'Kankanaey'),
(2718, 'Ilocano'),
(2718, 'Tagalog'),
(2709, 'Ilocano'),
(2709, 'Tagalog'),
(2710, 'Ilocano'),
(2710, 'Tagalog'),
(2720, 'Ilocano'),
(2720, 'Tagalog'),
(2723, 'Ilocano'),
(2723, 'Tagalog'),
(2730, 'Ilocano'),
(2730, 'Tagalog'),
(2725, 'Ilocano'),
(2725, 'Tagalog'),
(2704, 'Ilocano'),
(2704, 'Tagalog'),
(2721, 'Kankanaey'),
(2721, 'Ilocano'),
(2721, 'Tagalog'),
(2711, 'Ilocano'),
(2711, 'Tagalog'),
(2722, 'Ilocano'),
(2722, 'Tagalog'),
(2706, 'Ilocano'),
(2706, 'Tagalog'),
(2728, 'Ilocano'),
(2728, 'Tagalog'),
(2731, 'Ilocano'),
(2731, 'Tagalog'),
(2726, 'Ilocano'),
(2726, 'Tagalog'),
(2703, 'Ilocano'),
(2703, 'Tagalog'),
(2701, 'Ilocano'),
(2701, 'Tagalog'),
(2713, 'Ilocano'),
(2713, 'Tagalog'),
(2712, 'Ilocano'),
(2712, 'Tagalog'),
(2705, 'Ilocano'),
(2705, 'Tagalog'),
(2707, 'Ilocano'),
(2707, 'Tagalog'),
(2729, 'Ilocano'),
(2729, 'Tagalog'),
(2719, 'Ilocano'),
(2719, 'Tagalog'),
(2733, 'Ilocano'),
(2733, 'Tagalog'),
(2717, 'Kankanaey'),
(2717, 'Ilocano'),
(2717, 'Tagalog'),
(2715, 'Ilocano'),
(2715, 'Tagalog'),
(2714, 'Ilocano'),
(2714, 'Tagalog'),
(2504, 'Ilocano'),
(2504, 'Pangasinan'),
(2504, 'Tagalog'),
(2503, 'Ilocano'),
(2503, 'Pangasinan'),
(2503, 'Tagalog'),
(2515, 'Ilocano'),
(2515, 'Tagalog'),
(2512, 'Ilocano'),
(2512, 'Tagalog'),
(2517, 'Ilocano'),
(2517, 'Tagalog'),
(2519, 'Ilocano'),
(2519, 'Tagalog'),
(2501, 'Ilocano'),
(2501, 'Tagalog'),
(2510, 'Ilocano'),
(2510, 'Tagalog'),
(2502, 'Ilocano'),
(2502, 'Pangasinan'),
(2502, 'Tagalog'),
(2518, 'Ilocano'),
(2518, 'Tagalog'),
(2511, 'Ilocano'),
(2511, 'Tagalog'),
(2508, 'Ilocano'),
(2508, 'Pangasinan'),
(2508, 'Tagalog'),
(2506, 'Ilocano'),
(2506, 'Pangasinan'),
(2506, 'Tagalog'),
(2500, 'Ilocano'),
(2500, 'Tagalog'),
(2513, 'Ilocano'),
(2513, 'Tagalog'),
(2514, 'Ilocano'),
(2514, 'Tagalog'),
(2505, 'Ilocano'),
(2505, 'Pangasinan'),
(2505, 'Tagalog'),
(2516, 'Kankanaey'),
(2516, 'Ilocano'),
(2516, 'Tagalog'),
(2520, 'Kankanaey'),
(2520, 'Ilocano'),
(2520, 'Tagalog'),
(2509, 'Ilocano'),
(2509, 'Pangasinan'),
(2509, 'Tagalog'),
(2408, 'Pangasinan'),
(2408, 'Ilocano'),
(2408, 'Tagalog'),
(2415, 'Pangasinan'),
(2415, 'Ilocano'),
(2415, 'Tagalog'),
(2425, 'Pangasinan'),
(2425, 'Ilocano'),
(2425, 'Tagalog'),
(2405, 'Bolinao'),
(2405, 'Pangasinan'),
(2405, 'Ilocano'),
(2405, 'Tagalog'),
(2439, 'Pangasinan'),
(2439, 'Ilocano'),
(2439, 'Tagalog'),
(2442, 'Pangasinan'),
(2442, 'Ilocano'),
(2442, 'Tagalog'),
(2407, 'Pangasinan'),
(2407, 'Ilocano'),
(2407, 'Sambal'),
(2407, 'Tagalog'),
(2422, 'Pangasinan'),
(2422, 'Ilocano'),
(2422, 'Tagalog'),
(2424, 'Pangasinan'),
(2424, 'Ilocano'),
(2424, 'Tagalog'),
(2423, 'Pangasinan'),
(2423, 'Ilocano'),
(2423, 'Tagalog'),
(2436, 'Pangasinan'),
(2436, 'Ilocano'),
(2436, 'Tagalog'),
(2417, 'Pangasinan'),
(2417, 'Ilocano'),
(2417, 'Tagalog'),
(2406, 'Bolinao'),
(2406, 'Pangasinan'),
(2406, 'Ilocano'),
(2406, 'Tagalog'),
(2406, 'Sambal'),
(2416, 'Pangasinan'),
(2416, 'Ilocano'),
(2416, 'Tagalog'),
(2410, 'Pangasinan'),
(2410, 'Ilocano'),
(2410, 'Sambal'),
(2410, 'Tagalog'),
(2418, 'Pangasinan'),
(2418, 'Ilocano'),
(2418, 'Sambal'),
(2418, 'Tagalog'),
(2411, 'Pangasinan'),
(2411, 'Tagalog'),
(2411, 'Ilocano'),
(2411, 'Sambal'),
(2412, 'Pangasinan'),
(2412, 'Sambal'),
(2412, 'Ilocano'),
(2412, 'Tagalog'),
(2402, 'Pangasinan'),
(2402, 'Ilocano'),
(2402, 'Tagalog'),
(2437, 'Pangasinan'),
(2437, 'Ilocano'),
(2437, 'Tagalog'),
(2401, 'Pangasinan'),
(2401, 'Ilocano'),
(2401, 'Tagalog'),
(2409, 'Pangasinan'),
(2409, 'Ilocano'),
(2409, 'Sambal'),
(2409, 'Tagalog'),
(2421, 'Pangasinan'),
(2421, 'Ilocano'),
(2421, 'Tagalog'),
(2430, 'Pangasinan'),
(2430, 'Ilocano'),
(2430, 'Tagalog'),
(2432, 'Pangasinan'),
(2432, 'Ilocano'),
(2432, 'Tagalog'),
(2413, 'Pangasinan'),
(2413, 'Ilocano'),
(2413, 'Tagalog'),
(2429, 'Pangasinan'),
(2429, 'Ilocano'),
(2429, 'Tagalog'),
(2446, 'Pangasinan'),
(2446, 'Ilocano'),
(2446, 'Tagalog'),
(2435, 'Pangasinan'),
(2435, 'Ilocano'),
(2435, 'Tagalog'),
(2441, 'Pangasinan'),
(2441, 'Ilocano'),
(2441, 'Tagalog'),
(2433, 'Pangasinan'),
(2433, 'Ilocano'),
(2433, 'Tagalog'),
(2431, 'Pangasinan'),
(2431, 'Ilocano'),
(2431, 'Tagalog'),
(2438, 'Pangasinan'),
(2438, 'Ilocano'),
(2438, 'Tagalog'),
(2447, 'Pangasinan'),
(2447, 'Ilocano'),
(2447, 'Kallahan'),
(2447, 'Tagalog'),
(2444, 'Pangasinan'),
(2444, 'Ilocano'),
(2444, 'Tagalog'),
(2419, 'Pangasinan'),
(2419, 'Ilocano'),
(2419, 'Tagalog'),
(2440, 'Pangasinan'),
(2440, 'Ilocano'),
(2440, 'Tagalog'),
(2426, 'Pangasinan'),
(2426, 'Ilocano'),
(2426, 'Tagalog'),
(2434, 'Pangasinan'),
(2434, 'Ilocano'),
(2434, 'Tagalog'),
(2403, 'Pangasinan'),
(2403, 'Ilocano'),
(2403, 'Tagalog'),
(2445, 'Pangasinan'),
(2445, 'Ilocano'),
(2445, 'Tagalog'),
(2443, 'Pangasinan'),
(2443, 'Ilocano'),
(2443, 'Tagalog'),
(2414, 'Pangasinan'),
(2414, 'Ilocano'),
(2414, 'Tagalog'),
(2427, 'Pangasinan'),
(2427, 'Ilocano'),
(2427, 'Tagalog'),
(2400, 'Pangasinan'),
(2400, 'Ilocano'),
(2400, 'Tagalog'),
(2404, 'Pangasinan'),
(2404, 'Ilocano'),
(2404, 'Tagalog'),
(2420, 'Pangasinan'),
(2420, 'Ilocano'),
(2420, 'Tagalog'),
(2428, 'Pangasinan'),
(2428, 'Ilocano'),
(2428, 'Tagalog'),
(2700, 'Ilocano'),
(2700, 'Tagalog'),
(2702, 'Ilocano'),
(2702, 'Tagalog');

-- --------------------------------------------------------

--
-- Table structure for table `municipality`
--

CREATE TABLE `municipality` (
  `municipality` varchar(18) DEFAULT NULL,
  `postal_code` int(4) DEFAULT NULL,
  `province` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `municipality`
--

INSERT INTO `municipality` (`municipality`, `postal_code`, `province`) VALUES
('Adams', 2922, 'Ilocos Norte'),
('Bacarra', 2916, 'Ilocos Norte'),
('Badoc', 2904, 'Ilocos Norte'),
('Bangui', 2920, 'Ilocos Norte'),
('Batac', 2906, 'Ilocos Norte'),
('Burgos', 2918, 'Ilocos Norte'),
('Carasi', 2911, 'Ilocos Norte'),
('Currimao', 2903, 'Ilocos Norte'),
('Dingras', 2913, 'Ilocos Norte'),
('Dumalneg', 2921, 'Ilocos Norte'),
('Espiritu', 2908, 'Ilocos Norte'),
('Laoag City', 2900, 'Ilocos Norte'),
('Marcos', 2907, 'Ilocos Norte'),
('Nueva Era', 2909, 'Ilocos Norte'),
('Pagudpud', 2919, 'Ilocos Norte'),
('Paoay', 2902, 'Ilocos Norte'),
('Pasuquin', 2917, 'Ilocos Norte'),
('Piddig', 2912, 'Ilocos Norte'),
('Pinili', 2905, 'Ilocos Norte'),
('San Nicolas', 2901, 'Ilocos Norte'),
('Sarrat', 2914, 'Ilocos Norte'),
('Solsona', 2910, 'Ilocos Norte'),
('Vintar', 2915, 'Ilocos Norte'),
('Alilem', 2716, 'Ilocos Sur'),
('Binayoyo', 2708, 'Ilocos Sur'),
('Bantay', 2727, 'Ilocos Sur'),
('Burgos', 2724, 'Ilocos Sur'),
('Cabugao', 2732, 'Ilocos Sur'),
('Candon', 2710, 'Ilocos Sur'),
('Caoayan', 2702, 'Ilocos Sur'),
('Cervantes', 2718, 'Ilocos Sur'),
('Galimuyod', 2709, 'Ilocos Sur'),
('Gregorio del Pilar', 2720, 'Ilocos Sur'),
('Lidilda', 2723, 'Ilocos Sur'),
('Magsingal', 2730, 'Ilocos Sur'),
('Nagbukel', 2725, 'Ilocos Sur'),
('Narvacan', 2704, 'Ilocos Sur'),
('Quirino', 2721, 'Ilocos Sur'),
('Salsedo', 2711, 'Ilocos Sur'),
('San Emilio', 2722, 'Ilocos Sur'),
('San Esteban', 2706, 'Ilocos Sur'),
('San Ildefonso', 2728, 'Ilocos Sur'),
('San Juan', 2731, 'Ilocos Sur'),
('San Vicente', 2726, 'Ilocos Sur'),
('Santa', 2703, 'Ilocos Sur'),
('Santa Catalina', 2701, 'Ilocos Sur'),
('Santa Cruz', 2713, 'Ilocos Sur'),
('Santa Lucia', 2712, 'Ilocos Sur'),
('Santa Maria', 2705, 'Ilocos Sur'),
('Santiago', 2707, 'Ilocos Sur'),
('Santo Domingo', 2729, 'Ilocos Sur'),
('Sicay', 2719, 'Ilocos Sur'),
('Sinait', 2733, 'Ilocos Sur'),
('Sugpon', 2717, 'Ilocos Sur'),
('Suyo', 2715, 'Ilocos Sur'),
('Tagudin', 2714, 'Ilocos Sur'),
('Vigan', 2700, 'Ilocos Sur'),
('Agoo', 2504, 'La Union'),
('Aringay', 2503, 'La Union'),
('Bacnotan', 2515, 'La Union'),
('Bagulin', 2512, 'La Union'),
('Balaoan', 2517, 'La Union'),
('Bangar', 2519, 'La Union'),
('Bauang', 2501, 'La Union'),
('Burgos', 2510, 'La Union'),
('Caba', 2502, 'La Union'),
('Damortis', 2507, 'La Union'),
('Luna', 2518, 'La Union'),
('Naguillan', 2511, 'La Union'),
('Pugo', 2508, 'La Union'),
('Rosario', 2506, 'La Union'),
('San Fernando', 2500, 'La Union'),
('San Gabriel', 2513, 'La Union'),
('San Juan', 2514, 'La Union'),
('Santol', 2516, 'La Union'),
('Santo Tomas', 2505, 'La Union'),
('Sudepen', 2520, 'La Union'),
('Tubao', 2509, 'La Union'),
('Agno', 2408, 'Pangasinan'),
('Aguilar', 2415, 'Pangasinan'),
('Alaminos', 2404, 'Pangasinan'),
('Alcala', 2425, 'Pangasinan'),
('Anda', 2405, 'Pangasinan'),
('Asingan', 2439, 'Pangasinan'),
('Balungao', 2442, 'Pangasinan'),
('Bani', 2407, 'Pangasinan'),
('Basista', 2422, 'Pangasinan'),
('Bautista', 2424, 'Pangasinan'),
('Bayambang', 2423, 'Pangasinan'),
('Binalonan', 2436, 'Pangasinan'),
('Binmaley', 2417, 'Pangasinan'),
('Bolinao', 2406, 'Pangasinan'),
('Bugallon', 2416, 'Pangasinan'),
('Burgos', 2410, 'Pangasinan'),
('Calasiao', 2418, 'Pangasinan'),
('Dagupan City', 2400, 'Pangasinan'),
('Dasol', 2411, 'Pangasinan'),
('Infanta', 2412, 'Pangasinan'),
('Labrador', 2402, 'Pangasinan'),
('Laoac', 2437, 'Pangasinan'),
('Lingayen', 2401, 'Pangasinan'),
('Mabini', 2409, 'Pangasinan'),
('Malasiqui', 2421, 'Pangasinan'),
('Manaoag', 2430, 'Pangasinan'),
('Mangaldan', 2432, 'Pangasinan'),
('Mangatarem', 2413, 'Pangasinan'),
('Mapandan', 2429, 'Pangasinan'),
('Natividad', 2446, 'Pangasinan'),
('Pozorrubio', 2435, 'Pangasinan'),
('Rosales', 2441, 'Pangasinan'),
('San Carlos City', 2420, 'Pangasinan'),
('San Fabian', 2433, 'Pangasinan'),
('San Jacinto', 2431, 'Pangasinan'),
('San Manuel', 2438, 'Pangasinan'),
('San Nicolas', 2447, 'Pangasinan'),
('San Quintin', 2444, 'Pangasinan'),
('Santa Barbara', 2419, 'Pangasinan'),
('Santa Maria', 2440, 'Pangasinan'),
('Santo Tomas', 2426, 'Pangasinan'),
('Sison', 2434, 'Pangasinan'),
('Sual', 2403, 'Pangasinan'),
('Tayug', 2445, 'Pangasinan'),
('Umingan', 2443, 'Pangasinan'),
('Urbiztondo', 2414, 'Pangasinan'),
('Urdaneta', 2428, 'Pangasinan'),
('Villasis', 2427, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `phrases`
--

CREATE TABLE `phrases` (
  `language` varchar(10) DEFAULT NULL,
  `eng_phrase` varchar(45) DEFAULT NULL,
  `trans_phrase` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phrases`
--

INSERT INTO `phrases` (`language`, `eng_phrase`, `trans_phrase`) VALUES
('Ilocano', 'I’m leaving/Going now.', 'Mapanakon'),
('Ilocano', 'I’ll be back.', 'Agsubli ak'),
('Ilocano', 'I’m almost there.', 'Asidegakon'),
('Ilocano', 'Please, pull over!', 'Para/Ditoyen Manong!'),
('Ilocano', 'Please pass my fare.', 'Pakiyawat man atoy pletek!'),
('Ilocano', 'Hello!', 'Kablaaw'),
('Ilocano', 'Goodmorning', 'Naimbag nga bigat!'),
('Ilocano', 'Goodafternoon', 'Naimbag nga malem!'),
('Ilocano', 'Goodevening', 'Naimbag nga rabi-i!'),
('Ilocano', 'How are you', 'Kumusta ka?'),
('Ilocano', 'Thank you very much', 'Agyamanak unay! '),
('Tagalog', 'Goodmorning', 'Magandang Umaga'),
('Tagalog', 'Goodafternoon', 'Magandang Tanghali'),
('Tagalog', 'Goodevening', 'Magandang Gabi'),
('Tagalog', 'How are you?', 'Kamusta ka'),
('Tagalog', 'Take Care', 'Ingat'),
('Tagalog', 'Goodbye', 'Paalam'),
('Tagalog', 'How much?', 'Magkano?'),
('Tagalog', 'Left', 'Kaliwa'),
('Tagalog', 'Right', 'Kanan'),
('Tagalog', 'Is this the way to [Makati] location?', 'Papunta ba to sa [Makati]'),
('Kankanaey', 'Good Day to you', 'Gawis ay agew mo'),
('Kankanaey', 'Goodmorning', 'Gawis ay agsapa'),
('Kankanaey', 'Goodafternoon', 'Gawis ay masdem'),
('Kankanaey', 'Goodevening', 'Gawis ay labi'),
('Kankanaey', 'Where did you come from?', 'Nalpuam'),
('Kankanaey', 'Where are you going?', 'Umayam? '),
('Kankanaey', 'Let\'s go', 'Entako'),
('Pangasinan', 'What are you doing there?', 'Antoy gagawaen mo ditan?'),
('Pangasinan', 'Good morning/afternoon/evening to all of you.', 'Masantos ya kabwasan/kaagwan/labi ed sikayon amin.'),
('Pangasinan', 'Are you hungry?', 'Narasan kala?'),
('Pangasinan', 'You\'re so beautiful', 'Magangana ka. '),
('Pangasinan', 'Where are you going?', 'Kanto ka unla?'),
('Pangasinan', 'The weather is hot today', 'Ampetang so panaon natan.'),
('Pangasinan', 'The weather today is cold', 'Maliket ak no sika so ibak.'),
('Pangasinan', 'Cook something to eat', 'Manluto ka lay nasira'),
('Pangasinan', 'I love you', 'Inararo ta ka.'),
('Pangasinan', 'Where are you?', 'Kanto ka la?'),
('Pangasinan', 'I\'m here', 'Wadya ak'),
('Sambal', 'How are you?', 'Kamusta cay na'),
('Sambal', 'What is your name?', 'Anyay ngalan'),
('Sambal', 'Where are you from?', 'Ayti ca taga?'),
('Sambal', 'Where are you?', 'Ayti ca?'),
('Sambal', 'Goodafternoon', 'Maabig a yabi'),
('Sambal', 'I love you', 'Anlabyon cata'),
('Sambal', 'Let\'s party', 'Miligaliga tamo'),
('Sambal', 'I am leaving now', 'Umali acoy na'),
('Sambal', 'Thankyou very much', 'Laco a salamat'),
('Sambal', 'You\'re welcome', 'Humin anya man'),
('Bolinao', '', ''),
('Sambal', '', ''),
('Kallahan', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
