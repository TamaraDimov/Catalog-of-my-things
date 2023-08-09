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