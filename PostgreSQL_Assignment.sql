CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(25) NOT NULL
);

CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    "location" VARCHAR(50) NOT NULL,
    notes VARCHAR(100)
);

INSERT INTO rangers ("name", region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings(species_id, ranger_id, "location", sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);



-- Problem 1:
INSERT INTO rangers ("name", region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT count(*) as "unique_species_count" 
from (
    SELECT count(species_id) as "unique_species_count" 
    from sightings
    GROUP BY species_id
);

-- Problem 3
SELECT sighting_id, species_id, ranger_id, "location", sighting_time, notes  from sightings
WHERE "location" LIKE '%Pass%';

-- Problem 4
SELECT "name", "total_sightings" from rangers
natural JOIN (SELECT ranger_id, count(ranger_id) as "total_sightings" from sightings
GROUP BY ranger_id);

-- Problem 5
SELECT common_name from species
WHERE species.species_id not in (
    SELECT species_id from sightings
);

-- Problem  6
SELECT common_name, sighting_time, "name" from species
natural join (
    SELECT * from rangers
    natural join (
        SELECT * from sightings
        ORDER BY sightings.sighting_time DESC
        LIMIT 2
    )
);

-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE extract(year from discovery_date) < 1800;

-- Problem 8
SELECT sighting_id,
CASE 
    WHEN extract(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN extract(HOUR FROM sighting_time) >= 12 AND extract(HOUR FROM sighting_time) <= 17 THEN 'Afternoon'
    WHEN extract(HOUR FROM sighting_time) >= 12 THEN 'Evening'
END AS time_of_day
from sightings;

-- Problem 9
DELETE from rangers
WHERE rangers.ranger_id not in (
    SELECT ranger_id from sightings
);
