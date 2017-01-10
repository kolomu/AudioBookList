SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `myaudiobooklist`
--

-- --------------------------------------------------------

--
-- structure of table `audiobook`
--

CREATE TABLE `audiobook` (
  `id` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `author` varchar(70) NOT NULL,
  `title` varchar(70) NOT NULL,
  `image` varchar(80) DEFAULT NULL,
  `publisher` varchar(70) DEFAULT NULL,
  `published` date NOT NULL,
  `description` varchar(70) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `langid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `chatentry`
--

CREATE TABLE `chatentry` (
  `id` int(11) NOT NULL,
  `ts` date NOT NULL,
  `senderid` int(11) NOT NULL,
  `recipientid` int(11) NOT NULL,
  `message` varchar(2000) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `friends`
--

CREATE TABLE `friends` (
  `personid` int(11) NOT NULL,
  `friendid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `picture` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- structure of table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `audiobookid` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


--
-- indices of table `audiobook`
--
ALTER TABLE `audiobook`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryid_2` (`categoryid`),
  ADD UNIQUE KEY `langid` (`langid`),
  ADD KEY `personid` (`personid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- indices of table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- indices of table `chatentry`
--
ALTER TABLE `chatentry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `senderid` (`senderid`),
  ADD UNIQUE KEY `recipientid` (`recipientid`);

--
-- indices of table `friends`
--
ALTER TABLE `friends`
  ADD KEY `personid` (`personid`),
  ADD KEY `friendid` (`friendid`);

--
-- indices of table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- indices of table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- indices of table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `audiobookid` (`audiobookid`),
  ADD KEY `personid` (`personid`);