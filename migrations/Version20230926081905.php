<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230926081905 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE categorie (id INT AUTO_INCREMENT NOT NULL, categorie VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE module (id INT AUTO_INCREMENT NOT NULL, categorie_id INT NOT NULL, module VARCHAR(50) NOT NULL, INDEX IDX_C242628BCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE programme (id INT AUTO_INCREMENT NOT NULL, session_id INT NOT NULL, module_id INT NOT NULL, nb_jour INT NOT NULL, INDEX IDX_3DDCB9FF613FECDF (session_id), INDEX IDX_3DDCB9FFAFC2B591 (module_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE referent (id INT AUTO_INCREMENT NOT NULL, nom_referent VARCHAR(50) NOT NULL, prenom_referent VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE session (id INT AUTO_INCREMENT NOT NULL, referent_id INT NOT NULL, session VARCHAR(50) NOT NULL, nb_place INT NOT NULL, date_debut DATETIME NOT NULL, date_fin DATETIME NOT NULL, INDEX IDX_D044D5D435E47E35 (referent_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE session_stagiaire (session_id INT NOT NULL, stagiaire_id INT NOT NULL, INDEX IDX_C80B23B613FECDF (session_id), INDEX IDX_C80B23BBBA93DD6 (stagiaire_id), PRIMARY KEY(session_id, stagiaire_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE stagiaire (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) NOT NULL, prenom VARCHAR(50) NOT NULL, ville VARCHAR(50) NOT NULL, date_naissance DATETIME NOT NULL, telephone VARCHAR(50) NOT NULL, courriel VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE module ADD CONSTRAINT FK_C242628BCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('ALTER TABLE programme ADD CONSTRAINT FK_3DDCB9FF613FECDF FOREIGN KEY (session_id) REFERENCES session (id)');
        $this->addSql('ALTER TABLE programme ADD CONSTRAINT FK_3DDCB9FFAFC2B591 FOREIGN KEY (module_id) REFERENCES module (id)');
        $this->addSql('ALTER TABLE session ADD CONSTRAINT FK_D044D5D435E47E35 FOREIGN KEY (referent_id) REFERENCES referent (id)');
        $this->addSql('ALTER TABLE session_stagiaire ADD CONSTRAINT FK_C80B23B613FECDF FOREIGN KEY (session_id) REFERENCES session (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE session_stagiaire ADD CONSTRAINT FK_C80B23BBBA93DD6 FOREIGN KEY (stagiaire_id) REFERENCES stagiaire (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE module DROP FOREIGN KEY FK_C242628BCF5E72D');
        $this->addSql('ALTER TABLE programme DROP FOREIGN KEY FK_3DDCB9FF613FECDF');
        $this->addSql('ALTER TABLE programme DROP FOREIGN KEY FK_3DDCB9FFAFC2B591');
        $this->addSql('ALTER TABLE session DROP FOREIGN KEY FK_D044D5D435E47E35');
        $this->addSql('ALTER TABLE session_stagiaire DROP FOREIGN KEY FK_C80B23B613FECDF');
        $this->addSql('ALTER TABLE session_stagiaire DROP FOREIGN KEY FK_C80B23BBBA93DD6');
        $this->addSql('DROP TABLE categorie');
        $this->addSql('DROP TABLE module');
        $this->addSql('DROP TABLE programme');
        $this->addSql('DROP TABLE referent');
        $this->addSql('DROP TABLE session');
        $this->addSql('DROP TABLE session_stagiaire');
        $this->addSql('DROP TABLE stagiaire');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
