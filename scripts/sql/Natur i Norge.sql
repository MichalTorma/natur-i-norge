CREATE TABLE `MajorTypeGroup` (
  `majorTypeGroupID` TEXT PRIMARY KEY
);

CREATE TABLE `Languages` (
  `languageID` INT PRIMARY KEY,
  `name` TEXT
);

CREATE TABLE `MajorTypeGroupInfo` (
  `majorTypeGroupID` TEXT,
  `languageID` INT,
  `name` TEXT,
  `description` TEXT
);

CREATE TABLE `MajorType` (
  `majorTypeID` INT PRIMARY KEY,
  `majorTypeGroupID` TEXT
);

CREATE TABLE `MajorTypeInfo` (
  `majorTypeID` INT,
  `languageID` INT,
  `name` TEXT,
  `description` TEXT
);

CREATE TABLE `MinorType` (
  `minorTypeID` INT PRIMARY KEY,
  `majorTypeID` INT
);

CREATE TABLE `MinorTypeInfo` (
  `minorTypeID` INT,
  `languageID` INT,
  `name` TEXT
);

CREATE TABLE `LEC` (
  `LECID` TEXT PRIMARY KEY,
  `StructuringProcessID` TEXT,
  `patternOfVariationID` TEXT,
  `spatialScale` INT
);

CREATE TABLE `MajorTypeLEC` (
  `LECID` TEXT,
  `majorTypeID` TEXT
);

CREATE TABLE `MinorTypeLEC` (
  `LECID` TEXT,
  `minorTypeID` TEXT
);

CREATE TABLE `ElementarySegment` (
  `elementarySegmentID` INT PRIMARY KEY,
  `standardSegmentID` INT,
  `LECID` TEXT,
  `value` TEXT,
  `order` INT
);

CREATE TABLE `ElementarySegmentValue` (
  `ElementarySegmentValueID` INT PRIMARY KEY,
  `elementarySegmentID` INT,
  `key` TEXT,
  `value` INT
);

CREATE TABLE `StructuringProcess` (
  `structuringProcessID` TEXT PRIMARY KEY
);

CREATE TABLE `StructuringProcessInfo` (
  `structuringProcessID` TEXT,
  `languageID` INT,
  `name` TEXT,
  `description` TEXT
);

CREATE TABLE `LECInfo` (
  `LECID` TEXT,
  `languageID` INT,
  `name` TEXT,
  `description` TEXT
);

CREATE TABLE `PatternOfVariation` (
  `patternOfVariationID` TEXT PRIMARY KEY
);

CREATE TABLE `PatternOfVariationInfo` (
  `patternOfVariationID` TEXT,
  `languageID` INT,
  `name` TEXT
);

CREATE TABLE `GAD` (
  `GADID` INT PRIMARY KEY,
  `artsKode` TEXT,
  `norskNavn` TEXT,
  `latinName` TEXT
);

CREATE TABLE `GADElementarySegment` (
  `GADID` INT,
  `elementarySegmentID` INT,
  `elementarySegmentValueID` INT,
  `LECID` INT
);

CREATE TABLE `StandardSegment` (
  `standardSegmentID` INT PRIMARY KEY,
  `minorTypeID` INT
);

ALTER TABLE `MajorTypeGroupInfo` ADD FOREIGN KEY (`majorTypeGroupID`) REFERENCES `MajorTypeGroup` (`majorTypeGroupID`);

ALTER TABLE `MajorTypeGroupInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `MajorTypeInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `MajorTypeInfo` ADD FOREIGN KEY (`majorTypeID`) REFERENCES `MajorType` (`majorTypeID`);

ALTER TABLE `MinorTypeInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `MinorTypeInfo` ADD FOREIGN KEY (`minorTypeID`) REFERENCES `MinorType` (`minorTypeID`);

ALTER TABLE `MinorType` ADD FOREIGN KEY (`majorTypeID`) REFERENCES `MajorType` (`majorTypeID`);

ALTER TABLE `MajorType` ADD FOREIGN KEY (`majorTypeGroupID`) REFERENCES `MajorTypeGroup` (`majorTypeGroupID`);

ALTER TABLE `StructuringProcessInfo` ADD FOREIGN KEY (`structuringProcessID`) REFERENCES `StructuringProcess` (`structuringProcessID`);

ALTER TABLE `StructuringProcessInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `LEC` ADD FOREIGN KEY (`LECID`) REFERENCES `LECInfo` (`LECID`);

ALTER TABLE `LECInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `PatternOfVariationInfo` ADD FOREIGN KEY (`patternOfVariationID`) REFERENCES `PatternOfVariation` (`patternOfVariationID`);

ALTER TABLE `LEC` ADD FOREIGN KEY (`patternOfVariationID`) REFERENCES `PatternOfVariation` (`patternOfVariationID`);

ALTER TABLE `ElementarySegment` ADD FOREIGN KEY (`LECID`) REFERENCES `LEC` (`LECID`);

ALTER TABLE `MajorTypeLEC` ADD FOREIGN KEY (`LECID`) REFERENCES `LEC` (`LECID`);

ALTER TABLE `MajorTypeLEC` ADD FOREIGN KEY (`majorTypeID`) REFERENCES `MajorType` (`majorTypeID`);

ALTER TABLE `MinorTypeLEC` ADD FOREIGN KEY (`LECID`) REFERENCES `LEC` (`LECID`);

ALTER TABLE `MinorTypeLEC` ADD FOREIGN KEY (`minorTypeID`) REFERENCES `MinorType` (`minorTypeID`);

ALTER TABLE `PatternOfVariationInfo` ADD FOREIGN KEY (`languageID`) REFERENCES `Languages` (`languageID`);

ALTER TABLE `LEC` ADD FOREIGN KEY (`StructuringProcessID`) REFERENCES `StructuringProcess` (`structuringProcessID`);

ALTER TABLE `ElementarySegment` ADD FOREIGN KEY (`elementarySegmentID`) REFERENCES `StandardSegment` (`standardSegmentID`);

ALTER TABLE `MinorType` ADD FOREIGN KEY (`minorTypeID`) REFERENCES `StandardSegment` (`minorTypeID`);

ALTER TABLE `ElementarySegmentValue` ADD FOREIGN KEY (`elementarySegmentID`) REFERENCES `ElementarySegment` (`elementarySegmentID`);

ALTER TABLE `GADElementarySegment` ADD FOREIGN KEY (`GADID`) REFERENCES `GAD` (`GADID`);

ALTER TABLE `GADElementarySegment` ADD FOREIGN KEY (`elementarySegmentID`) REFERENCES `ElementarySegment` (`elementarySegmentID`);

ALTER TABLE `GADElementarySegment` ADD FOREIGN KEY (`elementarySegmentValueID`) REFERENCES `ElementarySegmentValue` (`ElementarySegmentValueID`);

ALTER TABLE `GADElementarySegment` ADD FOREIGN KEY (`LECID`) REFERENCES `LEC` (`LECID`);

CREATE INDEX `PK,FK` ON `MajorTypeGroupInfo` (`majorTypeGroupID`, `languageID`);

CREATE INDEX `FK` ON `MajorType` (`majorTypeGroupID`);

CREATE INDEX `PK,FK` ON `MajorTypeInfo` (`majorTypeID`, `languageID`);

CREATE INDEX `FK` ON `MinorType` (`majorTypeID`);

CREATE INDEX `PK,FK` ON `MinorTypeInfo` (`minorTypeID`, `languageID`);
