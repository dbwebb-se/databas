--
-- dangerous area, ask mos
--
CREATE DATABASE IF NOT EXISTS skolan;
GRANT ALL ON skolan.* TO user@localhost IDENTIFIED BY 'pass';
GRANT FILE ON *.* TO TO user@localhost IDENTIFIED BY 'pass';

CREATE DATABASE IF NOT EXISTS dbwebb;
GRANT ALL ON dbwebb.* TO user@localhost IDENTIFIED BY 'pass';
