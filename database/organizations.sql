-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2017 at 06:59 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 5.6.29-1+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organizations`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_access_tokens`
--

CREATE TABLE `oauth2_access_tokens` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth2_access_tokens`
--

INSERT INTO `oauth2_access_tokens` (`id`, `client_id`, `user_id`, `token`, `expires_at`, `scope`) VALUES
(1, 1, 1, 'YzNmNjE2NTgzMDFjNjExMzMzZDM2NzQyYzYyZDQ2Y2RhNjVhNzA2MTA0NzVlOTYxY2ViMTMyMDUzNWUxOGYxOA', 1483539896, NULL),
(2, 1, 1, 'N2JjMjVlYjIzNTZmMmZiODQwYTQzNzE5NDZmM2NhNDlkMTQ4Mjc1OThlZmZlNmNiOWNlZDg3OGE2NzVlOWJjMQ', 1483543538, NULL),
(3, 1, 1, 'MGYwZDczMDEzNTgwZDYyMmViOGE0NTZmODg4YmI4NzFiM2FkMWIwNWQ1Mzk1NTQ2ZTIxMWFiMGYwNzViZGNjYg', 1483547306, NULL),
(4, 1, 1, 'MGNlOTUzOTdiNjhmY2Q5ZjQwZTY3YTdkMzQyMjYyN2M3MWU5ZWMyYWIwZGM3YjY1MjZiOWI1NTk4ZWM4MTYyMw', 1483551233, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_auth_codes`
--

CREATE TABLE `oauth2_auth_codes` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_clients`
--

CREATE TABLE `oauth2_clients` (
  `id` int(11) NOT NULL,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth2_clients`
--

INSERT INTO `oauth2_clients` (`id`, `random_id`, `redirect_uris`, `secret`, `allowed_grant_types`) VALUES
(1, '3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4', 'a:0:{}', '4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k', 'a:1:{i:0;s:8:"password";}');

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_refresh_tokens`
--

CREATE TABLE `oauth2_refresh_tokens` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth2_refresh_tokens`
--

INSERT INTO `oauth2_refresh_tokens` (`id`, `client_id`, `user_id`, `token`, `expires_at`, `scope`) VALUES
(1, 1, 1, 'MjZlNWY0ZTNhYzcxMTEzODJkOTQ2ZDEzYWQ0N2Y1MjFmZWZlZmFkZDg2NzFlMDE4YzQyODZhNWEwNWZmMDE3OQ', 1484745896, NULL),
(2, 1, 1, 'ZDc3MTRlMzk4YjZlOTJmYTc4NzgwYjRjZTM4ZWU2OWVlNTkyZmU4NDVhMTQ1NzcyMmIzZWY4ODljZDcyODkyZA', 1484749538, NULL),
(3, 1, 1, 'OTk3NTRiOGMwMzdkZDc2ZGU1OTZkYThiMTA5ZWIwYzUzZTRiMzQ0Zjk1ZTFjYjIyZTVmN2MxNTM5YzFiMjBhZg', 1484753306, NULL),
(4, 1, 1, 'OGIxZTM3MzQ5Y2E1MmNkYTQ5MzEwM2U3YTNmMTFlODA5YThkY2QzNGUxMjJlM2UyY2JiZWIxNWM0ZTcwYmFkNQ', 1484757233, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `organization_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `account_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`organization_id`, `name`, `account_created_date`) VALUES
(1000001, 'Sleighdogs', '2017-01-04 14:46:17'),
(1000002, 'Example', '2017-01-04 16:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'api', 'api', 'api@organizations.com', 'api@organizations.com', 1, '8sdituk22zgg44o0488g8ssgckk00c8', '$2y$13$8sdituk22zgg44o0488g8eYH6lI8oI291IvKYZI.jCxvHNDgjoFBy', '2017-01-04 15:24:30', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth2_access_tokens`
--
ALTER TABLE `oauth2_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D247A21B5F37A13B` (`token`),
  ADD KEY `IDX_D247A21B19EB6921` (`client_id`),
  ADD KEY `IDX_D247A21BA76ED395` (`user_id`);

--
-- Indexes for table `oauth2_auth_codes`
--
ALTER TABLE `oauth2_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A018A10D5F37A13B` (`token`),
  ADD KEY `IDX_A018A10D19EB6921` (`client_id`),
  ADD KEY `IDX_A018A10DA76ED395` (`user_id`);

--
-- Indexes for table `oauth2_clients`
--
ALTER TABLE `oauth2_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth2_refresh_tokens`
--
ALTER TABLE `oauth2_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D394478C5F37A13B` (`token`),
  ADD KEY `IDX_D394478C19EB6921` (`client_id`),
  ADD KEY `IDX_D394478CA76ED395` (`user_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`organization_id`),
  ADD UNIQUE KEY `uq_organization_name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oauth2_access_tokens`
--
ALTER TABLE `oauth2_access_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oauth2_auth_codes`
--
ALTER TABLE `oauth2_auth_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth2_clients`
--
ALTER TABLE `oauth2_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oauth2_refresh_tokens`
--
ALTER TABLE `oauth2_refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000004;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth2_access_tokens`
--
ALTER TABLE `oauth2_access_tokens`
  ADD CONSTRAINT `FK_D247A21B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  ADD CONSTRAINT `FK_D247A21BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `oauth2_auth_codes`
--
ALTER TABLE `oauth2_auth_codes`
  ADD CONSTRAINT `FK_A018A10D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  ADD CONSTRAINT `FK_A018A10DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `oauth2_refresh_tokens`
--
ALTER TABLE `oauth2_refresh_tokens`
  ADD CONSTRAINT `FK_D394478C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  ADD CONSTRAINT `FK_D394478CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
