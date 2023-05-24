CREATE TABLE IF NOT EXISTS Жанры (
	жанры_id SERIAL PRIMARY KEY,
	название VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Исполнители (
	исполнители_id SERIAL PRIMARY KEY,
	имя_или_псевдоним VARCHAR(160)
);

CREATE TABLE IF NOT EXISTS ЖанрыИсполнители (
	исполнители_id INTEGER REFERENCES Исполнители,
	жанры_id INTEGER REFERENCES Жанры,
  PRIMARY KEY(исполнители_id, жанры_id)
);

CREATE TABLE IF NOT EXISTS Альбомы (
	альбомы_id SERIAL PRIMARY KEY,
	название VARCHAR(160) UNIQUE NOT NULL,
  год_выпуска INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS АльбомыИсполнители (
	исполнители_id INTEGER REFERENCES Исполнители,
	альбомы_id INTEGER REFERENCES Альбомы,
  PRIMARY KEY(исполнители_id, альбомы_id)
);

CREATE TABLE IF NOT EXISTS Треки (
	трек_id SERIAL PRIMARY KEY,
	название VARCHAR(160) NOT NULL,
  альбомы_id INTEGER REFERENCES Альбомы
);

CREATE TABLE IF NOT EXISTS Сборники (
	сборник_id SERIAL PRIMARY KEY,
	название VARCHAR(160) UNIQUE NOT NULL,
  год_выпуска INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ТрекиСборники (
	трек_id INTEGER REFERENCES Треки,
	сборник_id INTEGER REFERENCES Сборники,
  PRIMARY KEY(трек_id, сборник_id)
);
