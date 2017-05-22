-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2017 at 01:50 AM
-- Server version: 5.6.31-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Organika`
--

-- --------------------------------------------------------

--
-- Table structure for table `aliran_dana`
--

CREATE TABLE IF NOT EXISTS `aliran_dana` (
  `id_aliran` int(11) NOT NULL,
  `tipe` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` tinytext NOT NULL,
  `kegiatan_id_kegiatan` int(11) NOT NULL,
  `kegiatan_organisasi_id_organisasi` int(11) NOT NULL,
  `kegiatan_Divisi_id_divisi` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE IF NOT EXISTS `divisi` (
  `id_divisi` int(11) NOT NULL,
  `nama_divisi` varchar(45) NOT NULL,
  `organisasi_id_organisasi` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`, `organisasi_id_organisasi`) VALUES
(1, 'Human Resource', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dokumentasi`
--

CREATE TABLE IF NOT EXISTS `dokumentasi` (
  `id_dokumentasi` int(11) NOT NULL,
  `nama_file` varchar(45) NOT NULL,
  `kegiatan_id_kegiatan` int(11) NOT NULL,
  `kegiatan_organisasi_id_organisasi` int(11) NOT NULL,
  `kegiatan_Divisi_id_divisi` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keanggotaan`
--

CREATE TABLE IF NOT EXISTS `keanggotaan` (
  `Divisi_id_divisi` int(11) NOT NULL,
  `Divisi_organisasi_id_organisasi` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keanggotaan`
--

INSERT INTO `keanggotaan` (`Divisi_id_divisi`, `Divisi_organisasi_id_organisasi`, `pengguna_id_pengguna`, `level`) VALUES
(1, 1, 1, 0),
(1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE IF NOT EXISTS `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `nama_kegiatan` varchar(45) NOT NULL,
  `organisasi_id_organisasi` int(11) NOT NULL,
  `Divisi_id_divisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `idkomentar` int(11) NOT NULL,
  `isi` mediumtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ruang_diskusi_id_post` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`idkomentar`, `isi`, `timestamp`, `ruang_diskusi_id_post`, `pengguna_id_pengguna`) VALUES
(1, 'ayok bro ', '2017-04-30 19:04:26', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `non_rapat`
--

CREATE TABLE IF NOT EXISTS `non_rapat` (
  `evaluasi` longtext NOT NULL,
  `kegiatan_id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organisasi`
--

CREATE TABLE IF NOT EXISTS `organisasi` (
  `id_organisasi` int(11) NOT NULL,
  `nama_organisasi` varchar(45) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organisasi`
--

INSERT INTO `organisasi` (`id_organisasi`, `nama_organisasi`, `pengguna_id_pengguna`) VALUES
(1, 'HimaGanteng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tanggal lahir` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `tanggal lahir`, `email`, `password`) VALUES
(1, 'Iqbal Abiyoga', '1997-06-10', 'abiyoga.iqbal@gmail.com', '12345'),
(2, 'Alifka Aditya Putra', '1996-08-10', 'alifka@gmail.com', 'mantap');

-- --------------------------------------------------------

--
-- Table structure for table `rapat`
--

CREATE TABLE IF NOT EXISTS `rapat` (
  `notulensi` mediumtext NOT NULL,
  `kegiatan_id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `respon`
--

CREATE TABLE IF NOT EXISTS `respon` (
  `id_respon` int(11) NOT NULL,
  `respon` tinyint(1) NOT NULL,
  `ruang_diskusi_id_post` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respon`
--

INSERT INTO `respon` (`id_respon`, `respon`, `ruang_diskusi_id_post`, `pengguna_id_pengguna`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ruang_diskusi`
--

CREATE TABLE IF NOT EXISTS `ruang_diskusi` (
  `id_post` int(11) NOT NULL,
  `subjek` varchar(45) NOT NULL,
  `isi` mediumtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Divisi_id_divisi` int(11) NOT NULL,
  `Divisi_organisasi_id_organisasi` int(11) NOT NULL,
  `pengguna_id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang_diskusi`
--

INSERT INTO `ruang_diskusi` (`id_post`, `subjek`, `isi`, `timestamp`, `Divisi_id_divisi`, `Divisi_organisasi_id_organisasi`, `pengguna_id_pengguna`) VALUES
(1, 'Ayo Kita ke Pantai!', 'Aku ingin ke pantai bersama sama nih. Ikutan yuk ', '2017-05-01 01:53:38', 1, 1, 1),
(2, 'Mari Kita Bermain', 'Mau Main ke mana minggu ini ?', '2017-05-01 01:53:45', 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aliran_dana`
--
ALTER TABLE `aliran_dana`
  ADD PRIMARY KEY (`id_aliran`,`kegiatan_id_kegiatan`,`kegiatan_organisasi_id_organisasi`,`kegiatan_Divisi_id_divisi`,`pengguna_id_pengguna`),
  ADD KEY `fk_aliran_dana_kegiatan1_idx` (`kegiatan_id_kegiatan`,`kegiatan_organisasi_id_organisasi`,`kegiatan_Divisi_id_divisi`),
  ADD KEY `fk_aliran_dana_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`,`organisasi_id_organisasi`),
  ADD KEY `fk_Divisi_organisasi1_idx` (`organisasi_id_organisasi`);

--
-- Indexes for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD PRIMARY KEY (`id_dokumentasi`,`kegiatan_id_kegiatan`,`kegiatan_organisasi_id_organisasi`,`kegiatan_Divisi_id_divisi`,`pengguna_id_pengguna`),
  ADD KEY `fk_dokumentasi_kegiatan1_idx` (`kegiatan_id_kegiatan`,`kegiatan_organisasi_id_organisasi`,`kegiatan_Divisi_id_divisi`),
  ADD KEY `fk_dokumentasi_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD PRIMARY KEY (`Divisi_id_divisi`,`Divisi_organisasi_id_organisasi`,`pengguna_id_pengguna`,`level`),
  ADD KEY `fk_keanggotaan_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`,`organisasi_id_organisasi`,`Divisi_id_divisi`),
  ADD KEY `fk_kegiatan_organisasi1_idx` (`organisasi_id_organisasi`),
  ADD KEY `fk_kegiatan_Divisi1_idx` (`Divisi_id_divisi`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`idkomentar`,`ruang_diskusi_id_post`,`pengguna_id_pengguna`),
  ADD KEY `fk_komentar_ruang_diskusi1_idx` (`ruang_diskusi_id_post`),
  ADD KEY `fk_komentar_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `non_rapat`
--
ALTER TABLE `non_rapat`
  ADD PRIMARY KEY (`kegiatan_id_kegiatan`),
  ADD KEY `fk_non_rapat_kegiatan1_idx` (`kegiatan_id_kegiatan`);

--
-- Indexes for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`id_organisasi`,`pengguna_id_pengguna`),
  ADD KEY `fk_organisasi_pengguna_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `rapat`
--
ALTER TABLE `rapat`
  ADD PRIMARY KEY (`kegiatan_id_kegiatan`),
  ADD KEY `fk_rapat_kegiatan1_idx` (`kegiatan_id_kegiatan`);

--
-- Indexes for table `respon`
--
ALTER TABLE `respon`
  ADD PRIMARY KEY (`id_respon`,`ruang_diskusi_id_post`,`pengguna_id_pengguna`),
  ADD KEY `fk_respon_ruang_diskusi1_idx` (`ruang_diskusi_id_post`),
  ADD KEY `fk_respon_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- Indexes for table `ruang_diskusi`
--
ALTER TABLE `ruang_diskusi`
  ADD PRIMARY KEY (`id_post`,`Divisi_id_divisi`,`Divisi_organisasi_id_organisasi`,`pengguna_id_pengguna`),
  ADD KEY `fk_ruang_diskusi_Divisi1_idx` (`Divisi_id_divisi`,`Divisi_organisasi_id_organisasi`),
  ADD KEY `fk_ruang_diskusi_pengguna1_idx` (`pengguna_id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aliran_dana`
--
ALTER TABLE `aliran_dana`
  MODIFY `id_aliran` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  MODIFY `id_dokumentasi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `id_organisasi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `respon`
--
ALTER TABLE `respon`
  MODIFY `id_respon` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ruang_diskusi`
--
ALTER TABLE `ruang_diskusi`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aliran_dana`
--
ALTER TABLE `aliran_dana`
  ADD CONSTRAINT `fk_aliran_dana_kegiatan1` FOREIGN KEY (`kegiatan_id_kegiatan`, `kegiatan_organisasi_id_organisasi`, `kegiatan_Divisi_id_divisi`) REFERENCES `kegiatan` (`id_kegiatan`, `organisasi_id_organisasi`, `Divisi_id_divisi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aliran_dana_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `divisi`
--
ALTER TABLE `divisi`
  ADD CONSTRAINT `fk_Divisi_organisasi1` FOREIGN KEY (`organisasi_id_organisasi`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD CONSTRAINT `fk_dokumentasi_kegiatan1` FOREIGN KEY (`kegiatan_id_kegiatan`, `kegiatan_organisasi_id_organisasi`, `kegiatan_Divisi_id_divisi`) REFERENCES `kegiatan` (`id_kegiatan`, `organisasi_id_organisasi`, `Divisi_id_divisi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dokumentasi_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD CONSTRAINT `fk_keanggotaan_Divisi1` FOREIGN KEY (`Divisi_id_divisi`, `Divisi_organisasi_id_organisasi`) REFERENCES `divisi` (`id_divisi`, `organisasi_id_organisasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_keanggotaan_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `fk_kegiatan_Divisi1` FOREIGN KEY (`Divisi_id_divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kegiatan_organisasi1` FOREIGN KEY (`organisasi_id_organisasi`) REFERENCES `organisasi` (`id_organisasi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `fk_komentar_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_komentar_ruang_diskusi1` FOREIGN KEY (`ruang_diskusi_id_post`) REFERENCES `ruang_diskusi` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `non_rapat`
--
ALTER TABLE `non_rapat`
  ADD CONSTRAINT `fk_non_rapat_kegiatan1` FOREIGN KEY (`kegiatan_id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD CONSTRAINT `fk_organisasi_pengguna` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rapat`
--
ALTER TABLE `rapat`
  ADD CONSTRAINT `fk_rapat_kegiatan1` FOREIGN KEY (`kegiatan_id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `respon`
--
ALTER TABLE `respon`
  ADD CONSTRAINT `fk_respon_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respon_ruang_diskusi1` FOREIGN KEY (`ruang_diskusi_id_post`) REFERENCES `ruang_diskusi` (`id_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ruang_diskusi`
--
ALTER TABLE `ruang_diskusi`
  ADD CONSTRAINT `fk_ruang_diskusi_Divisi1` FOREIGN KEY (`Divisi_id_divisi`, `Divisi_organisasi_id_organisasi`) REFERENCES `divisi` (`id_divisi`, `organisasi_id_organisasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruang_diskusi_pengguna1` FOREIGN KEY (`pengguna_id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
