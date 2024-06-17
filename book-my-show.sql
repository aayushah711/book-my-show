CREATE DATABASE bookmyshow;
USE bookmyshow;

CREATE TABLE Cities
(
    city_id INT NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100),
    state   VARCHAR(1000),
    PRIMARY KEY (city_id)
);
INSERT INTO Cities (name, state)
VALUES ('Mumbai', 'Maharashtra'),
       ('New Delhi', 'Delhi'),
       ('Kolkata', 'West Bengal');

CREATE TABLE Theaters
(
    theater_id    INT NOT NULL AUTO_INCREMENT,
    city_id       INT,
    name          VARCHAR(100),
    address       varchar(1000),
    PRIMARY KEY (theater_id),
    FOREIGN KEY (city_id) REFERENCES Cities (city_id)
);
INSERT INTO Theaters (city_id, name, address)
VALUES (1, 'G7 Multiplex', 'Bandra (W)'),
       (1, 'Nishant Cinema', 'Grant Road'),
       (2, 'Cinepolis', 'Airia Mall, Sohna Road, Gurgaon');

CREATE TABLE Screens
(
    screen_id  INT NOT NULL AUTO_INCREMENT,
    theater_id INT,
    PRIMARY KEY (screen_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters (theater_id)
);
INSERT INTO Screens (theater_id)
VALUES (1),
       (1),
       (1),
       (1),
       (1),
       (1),
       (2),
       (3),
       (3),
       (3),
       (3),
       (3),
       (3),
       (3);

CREATE TABLE Seats
(
    seat_id      INT NOT NULL AUTO_INCREMENT,
    seat_name    VARCHAR(3),
    screen_id    INT,
    is_available BOOLEAN,
    PRIMARY KEY (seat_id),
    FOREIGN KEY (screen_id) REFERENCES Screens (screen_id)
);
INSERT INTO Seats (seat_name, screen_id, is_available)
VALUES ('A1', 1, true),
       ('B1', 1, true),
       ('C1', 1, true),
       ('D1', 1, true),
       ('A2', 1, false),
       ('B2', 1, true),
       ('C2', 1, true),
       ('D2', 1, true),
       ('A3', 1, true),
       ('B3', 1, true),
       ('C3', 1, true),
       ('D3', 1, true),
       ('A1', 2, true),
       ('B1', 2, true),
       ('C1', 2, true),
       ('D1', 2, true),
       ('A2', 2, true),
       ('B2', 2, true),
       ('C2', 2, true),
       ('D2', 2, true),
       ('A3', 2, true),
       ('B3', 2, true),
       ('C3', 2, true),
       ('D3', 2, true),
       ('A1', 3, true),
       ('B1', 3, true),
       ('C1', 3, true),
       ('D1', 3, true),
       ('A2', 3, true),
       ('B2', 3, true),
       ('C2', 3, true),
       ('D2', 3, true),
       ('A3', 3, true),
       ('B3', 3, true),
       ('C3', 3, true),
       ('D3', 3, true);

CREATE TABLE Users
(
    user_id INT NOT NULL AUTO_INCREMENT,
    name    varchar(100),
    PRIMARY KEY (user_id)
);
INSERT INTO Users (name)
VALUES ('Alpha'),
       ('Beta'),
       ('Gamma'),
       ('Delta');

CREATE TABLE Movies
(
    movie_id INT NOT NULL AUTO_INCREMENT,
    name     varchar(1000),
    PRIMARY KEY (movie_id)
);
INSERT INTO Movies (name)
VALUES ('Sholay'),
       ('Maidaan'),
       ('Lagaan'),
       ('Dangal');

CREATE TABLE Shows
(
    show_id   INT NOT NULL AUTO_INCREMENT,
    screen_id INT,
    movie_id  INT,
    show_date date,
    show_time time,
    PRIMARY KEY (show_id),
    FOREIGN KEY (screen_id) REFERENCES Screens (screen_id),
    FOREIGN KEY (movie_id) REFERENCES Movies (movie_id)
);
INSERT INTO Shows (screen_id, movie_id, show_date, show_time)
VALUES (1, 1, '2023-04-25', '12:00:00'),
       (1, 2, '2023-04-25', '15:00:00'),
       (1, 3, '2023-04-25', '18:00:00'),
       (1, 4, '2023-04-25', '21:00:00'),
       (2, 2, '2023-04-25', '12:00:00'),
       (2, 3, '2023-04-25', '15:00:00'),
       (2, 4, '2023-04-25', '18:00:00'),
       (2, 1, '2023-04-25', '21:00:00'),
       (3, 3, '2023-04-25', '12:00:00'),
       (3, 4, '2023-04-25', '15:00:00'),
       (3, 1, '2023-04-25', '18:00:00'),
       (3, 2, '2023-04-25', '21:00:00');

CREATE TABLE Bookings
(
    booking_id INT NOT NULL AUTO_INCREMENT,
    seat_id    INT,
    show_id    INT,
    user_id    INT,
    PRIMARY KEY (booking_id),
    FOREIGN KEY (seat_id) REFERENCES Seats (seat_id),
    FOREIGN KEY (show_id) REFERENCES Shows (show_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
INSERT INTO Bookings (seat_id, show_id, user_id)
VALUES (11, 1, 3);

SELECT M.name AS MovieName,
    S.show_time AS ShowTime
FROM Shows AS S
JOIN
    Screens AS SC ON S.screen_id = SC.screen_id
JOIN
    Theaters AS T ON SC.theater_id = T.theater_id
JOIN
    Movies AS M ON S.movie_id = M.movie_id
WHERE
    S.show_date = '2023-04-25' AND
    T.name = 'G7 Multiplex'
ORDER BY
    S.show_time;

