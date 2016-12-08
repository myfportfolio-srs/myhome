CREATE DATABASE IF NOT EXISTS `homeautomate`;
USE `homeautomate`;
--
--
--
-- Table structure for table `tblclientgroup`
--
CREATE TABLE IF NOT EXISTS `tblclientgroup` (
  `groupId` int(11) NOT NULL,
  `groupOwner` varchar(25) NOT NULL,
  `groupStatus` enum('active','deactive','pending') NOT NULL DEFAULT 'pending',
  `groupUpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);
--
-- Table structure for table `clients`
--
CREATE TABLE IF NOT EXISTS `tblclients` (
  `clientId` int(11) NOT NULL,
  `clientGroup` int(11) NOT NULL,
  `clientName` varchar(25) NOT NULL,
  `clientMobile` varchar(14) NOT NULL,
  `clientEmail` varchar(30) NOT NULL,
  `clientPassword` varchar(10) NOT NULL,
  `clientStatus` enum('active','deactive','pending') DEFAULT 'pending',
  `clientUpdatedOn` datetime DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table `tbldevices`
--
CREATE TABLE IF NOT EXISTS `tbldevices` (
  `deviceId` int(11) NOT NULL,
  `deviceClientGroup` int(11) NOT NULL,
  `deviceName` varchar(15) NOT NULL,
  `deviceRoom` int(11) NOT NULL,
  `deviceState` tinyint(4) NOT NULL DEFAULT '0',
  `deviceUpdatedBy` int(11) NOT NULL,
  `deviceUpdatedFrom` enum('mobile','browser','manual') NOT NULL,
  `deviceUpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deviceStatus` enum('active','deactive','pending') NOT NULL DEFAULT 'pending'
);
--
--
--
-- Indexes for tables
--
--
-- Indexes for table `tblclientgroup`
--
ALTER TABLE `tblclientgroup`
  ADD PRIMARY KEY (`groupId`);
ALTER TABLE `tblclientgroup`
	ADD INDEX(`groupId`);
--
-- Indexes for table `clients`
--
ALTER TABLE `tblclients`
  ADD PRIMARY KEY (`clientId`);
ALTER TABLE `tblclients`
  ADD INDEX(`clientId`);
  --
-- Indexes for table `tbldevices`
--
ALTER TABLE `tbldevices`
  ADD PRIMARY KEY (`deviceId`);
ALTER TABLE `tbldevices`
  ADD INDEX(`deviceId`);
--
--
--
-- AUTO_INCREMENT for tables
--
--
-- AUTO_INCREMENT for table `tblclientgroup`
--
ALTER TABLE `tblclientgroup`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `tblclients`
  MODIFY `clientId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbldevices`
--
ALTER TABLE `tbldevices`
  MODIFY `deviceId` int(11) NOT NULL AUTO_INCREMENT;
--
--
--
-- Foreign Keys for tables
--
--
-- Foreign Keys for table `tblclients`
--
ALTER TABLE `tblclients`
ADD CONSTRAINT fk_clientGroup_groupid
FOREIGN KEY (`clientGroup`)
REFERENCES `tblclientgroup`(`groupId`);
--
-- Foreign Keys for table `tbldevices`
--
ALTER TABLE `tbldevices`
ADD CONSTRAINT fk_deviceClientGroup_clientID
FOREIGN KEY (`deviceClientGroup`)
REFERENCES `tblclientgroup`(`groupId`);

ALTER TABLE `tbldevices`
ADD CONSTRAINT fk_deviceUpdatedBy_clientID
FOREIGN KEY (`deviceUpdatedBy`)
REFERENCES `tblclients`(`clientId`);
--
--
