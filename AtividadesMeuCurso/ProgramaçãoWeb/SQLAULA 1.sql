
CREATE DATABASE IF NOT EXISTS testeaula /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;




USE testeaula;



CREATE TABLE usuarios (
  Id int(11) NOT NULL AUTO_INCREMENT,
  usuario varchar(50) COLLATE latin1_general_ci NOT NULL,
  senha varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (Id)
) ;





INSERT INTO usuarios (usuario, senha) VALUES
('joao', 'senha123'),
('maria', 'segredo456'),
('carlos', 'minhasenha789');

DROP TABLE IF EXISTS usuarios;
