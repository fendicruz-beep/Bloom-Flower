--
-- Database: flower_shop
--

CREATE DATABASE IF NOT EXISTS flower_shop;
USE flower_shop;

-- --------------------------------------------------------
-- CATEGORY TABLE
-- --------------------------------------------------------

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `category` (`id`,`name`,`description`) VALUES
(1,'Roses','Romantic and classic flowers'),
(2,'Tulips','Colorful spring tulips'),
(3,'Orchids','Elegant tropical orchids'),
(4,'Sunflowers','Bright yellow sunflowers'),
(5,'Lilies','Fragrant lily flowers'),
(6,'Daisies','Simple cheerful daisies'),
(7,'Carnations','Popular long-lasting carnations'),
(8,'Peonies','Soft and full peony flowers'),
(9,'Lavender','Aromatic purple lavender'),
(10,'Marigolds','Golden marigold flowers'),
(11,'Jasmine','Sweet smelling jasmine flowers'),
(12,'Chrysanthemums','Autumn blooming flowers'),
(13,'Gerberas','Bright colorful gerbera daisies'),
(14,'Hydrangeas','Large hydrangea blossoms'),
(15,'Lotus','Sacred lotus flowers'),
(16,'Daffodils','Yellow spring daffodils'),
(17,'Gardenias','Fragrant white gardenias'),
(18,'Camellias','Beautiful camellia blooms'),
(19,'Begonias','Decorative begonia flowers'),
(20,'Magnolias','Elegant magnolia flowers'),
(21,'Poppies','Bright red poppies'),
(22,'Zinnias','Vibrant summer zinnias'),
(23,'Anemones','Delicate anemone flowers'),
(24,'Ranunculus','Layered ranunculus blooms');

-- --------------------------------------------------------
-- IMAGE TABLE
-- --------------------------------------------------------

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(254) NOT NULL,
  `alt` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `image` (`id`,`file`,`alt`) VALUES
(1,'Roses.jpg','Red Rose'),
(2,'tulip.jpg','Pink Tulip'),
(3,'Orchid.webp','Purple Orchid'),
(4,'sunflower.jpg','Sunflower'),
(5,'lily.jpg','White Lily'),
(6,'daisy.jpg','Daisy'),
(7,'carnation.jpg','Carnation'),
(8,'peony.jpg','Peony'),
(9,'Lavender.webp','Lavender'),
(10,'Marigold.webp','Marigold'),
(11,'jasmine.jpg','Jasmine'),
(12,'chrysanthemum.jpg','Chrysanthemum'),
(13,'gerbera.jpg','Gerbera'),
(14,'hydrangea.jpg','Hydrangea'),
(15,'lotus.jpg','Lotus'),
(16,'Daffodils.webp','Daffodil'),
(17,'gardenia.jpg','Gardenia'),
(18,'camellia.jpg','Camellia'),
(19,'Begonias.webp','Begonia'),
(20,'magnolia.jpg','Magnolia'),
(21,'poppy.jpg','Poppy'),
(22,'zinnia.jpg','Zinnia'),
(23,'Anemones.webp','Anemone'),
(24,'ranunculus.jpg','Ranunculus');

-- --------------------------------------------------------
-- FLOWER TABLE
-- --------------------------------------------------------

CREATE TABLE `flower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `flower`
(`id`,`name`,`description`,`price`,`category_id`,`image_id`,`available`) VALUES
(1,'Red Rose','Classic romantic red rose',150.00,1,1,1),
(2,'Pink Tulip','Beautiful pink tulip flower',120.00,2,2,1),
(3,'Purple Orchid','Elegant tropical orchid',250.00,3,3,1),
(4,'Sunflower','Bright sunflower bloom',100.00,4,4,1),
(5,'White Lily','Fragrant white lily flower',180.00,5,5,1),
(6,'Daisy','Simple white daisy',90.00,6,6,1),
(7,'Carnation','Red carnation flower',110.00,7,7,1),
(8,'Peony','Soft pink peony bloom',200.00,8,8,1),
(9,'Lavender','Aromatic lavender flower',130.00,9,9,1),
(10,'Marigold','Golden marigold flower',95.00,10,10,1),
(11,'Jasmine','Sweet smelling jasmine',140.00,11,11,1),
(12,'Chrysanthemum','Autumn chrysanthemum',125.00,12,12,1),
(13,'Gerbera','Colorful gerbera daisy',150.00,13,13,1),
(14,'Hydrangea','Large hydrangea blossom',220.00,14,14,1),
(15,'Lotus','Sacred lotus flower',210.00,15,15,1),
(16,'Daffodil','Yellow daffodil bloom',115.00,16,16,1),
(17,'Gardenia','Fragrant gardenia flower',190.00,17,17,1),
(18,'Camellia','Elegant camellia flower',170.00,18,18,1),
(19,'Begonia','Decorative begonia bloom',135.00,19,19,1),
(20,'Magnolia','Large magnolia flower',230.00,20,20,1),
(21,'Poppy','Bright red poppy flower',145.00,21,21,1),
(22,'Zinnia','Colorful zinnia bloom',120.00,22,22,1),
(23,'Anemone','Delicate anemone flower',160.00,23,23,1),
(24,'Ranunculus','Layered ranunculus flower',175.00,24,24,1);

-- --------------------------------------------------------
-- FLORIST TABLE
-- --------------------------------------------------------

CREATE TABLE `florist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `florist`
(`id`,`name`,`email`,`password`) VALUES
(1,'Admin Florist','admin@flowershop.com','admin123'),
(2,'Maria Santos','maria@flowershop.com','maria123'),
(3,'Juan Cruz','juan@flowershop.com','juan123');

-- --------------------------------------------------------
-- FOREIGN KEYS
-- --------------------------------------------------------

ALTER TABLE `flower`
ADD CONSTRAINT `flower_category`
FOREIGN KEY (`category_id`) REFERENCES `category`(`id`)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `flower`
ADD CONSTRAINT `flower_image`
FOREIGN KEY (`image_id`) REFERENCES `image`(`id`)
ON DELETE SET NULL ON UPDATE CASCADE;