-- PostgreSQL dump for Database: project_db

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS hibernate_sequence;
CREATE TABLE hibernate_sequence (
                                    next_not_cached_value BIGINT NOT NULL,
                                    minimum_value BIGINT NOT NULL,
                                    maximum_value BIGINT NOT NULL,
                                    start_value BIGINT NOT NULL,
                                    increment BIGINT NOT NULL,
                                    cache_size BIGINT NOT NULL,
                                    cycle_option BOOLEAN NOT NULL,
                                    cycle_count BIGINT NOT NULL
);

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO hibernate_sequence VALUES (4001,1,9223372036854775806,1,1,1000,FALSE,0);

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
                      id SERIAL PRIMARY KEY,
                      restaurant_id BIGINT NOT NULL,
                      active BOOLEAN DEFAULT NULL
);

--
-- Dumping data for table `menu`
--

INSERT INTO menu VALUES (1,1,TRUE), (2,2,TRUE);

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS menu_item;
CREATE TABLE menu_item (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(255) DEFAULT NULL,
                           description VARCHAR(100) DEFAULT NULL,
                           type_name VARCHAR(100) DEFAULT NULL,
                           group_name VARCHAR(100) DEFAULT NULL,
                           price NUMERIC(10,2) DEFAULT NULL,
                           menu_id BIGINT DEFAULT NULL
);

--
-- Dumping data for table `menu_item`
--

INSERT INTO menu_item VALUES
                          (1,'Amritsari Dal','Green gram and bengal gram with spices','VEG','MAIN_COURSE',190.00,1),
                          (2,'Samosa Masala','Deep fried savory pastry with dressing of chickpeas salad','VEG','STARTER',210.00,1),
                          (3,'Phirni','Creamy dessert of ground rice','VEG','DESSERT',120.00,1),
                          (4,'Nizami Chicken Biryani','Freshly cooked kacchi dum ki biryani','NON_VEG','MAIN_COURSE',319.00,2),
                          (5,'Mutton Seekh Kebab','Minced goat meat mixed with spices and cooked on griddle','NON_VEG','STARTER',365.00,2),
                          (6,'Kurbaani Ka Meetha','Sweet dessert made from dried apricots and sugar enriched with saffron strands and rose water','VEG','DESSERT',160.00,2);

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS "order";
CREATE TABLE "order" (
                         id SERIAL PRIMARY KEY,
                         restaurant_id BIGINT NOT NULL,
                         total NUMERIC(10,2) DEFAULT NULL
);

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item (
                            id SERIAL PRIMARY KEY,
                            order_id BIGINT NOT NULL,
                            menu_item_id BIGINT NOT NULL,
                            price NUMERIC(10,2) DEFAULT NULL
);

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS restaurant;
CREATE TABLE restaurant (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(250) NOT NULL,
                            location VARCHAR(250) DEFAULT NULL,
                            type_name VARCHAR(100) DEFAULT NULL
);

--
-- Dumping data for table `restaurant`
--

INSERT INTO restaurant VALUES
                           (1,'Imli','Bangalore','VEG'),
                           (2,'Paradise','Hyderabad','NON_VEG'),
                           (1027,'Kritunga','Hyderabad','NON_VEG');
