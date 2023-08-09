CREATE TABLE items (
  id INT PRIMARY KEY,
  genre_id INT,
  label_id INT,
  author_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
);

CREATE TABLE games (
  id INT PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(225),
  last_name VARCHAR(225)
);

CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);


CREATE TABLE books (
  id              INT PRIMARY KEY,
  publish_date    TIMESTAMP NOT NULL DEFAULT DATE,
  archived        BOOLEAN NOT NULL DEFAULT FALSE,
  publisher       VARCHAR(50) NOT NULL,
  cover_state     VARCHAR(20) NOT NULL,
  label_id        INT,
FOREIGN KEY(label_id) REFERENCES labels(id)
);


CREATE TABLE label_books (
  id INT PRIMARY KEY,
  label_id INT NOT NULL,
  book_id INT NOT NULL,
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_book FOREIGN KEY(book_id) REFERENCES books(id)
);