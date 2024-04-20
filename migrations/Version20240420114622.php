<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240420114622 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE event (id INT AUTO_INCREMENT NOT NULL, creator_id INT NOT NULL, event_type_id INT NOT NULL, name VARCHAR(255) NOT NULL, description VARCHAR(255) NOT NULL, date DATE NOT NULL, INDEX IDX_3BAE0AA761220EA6 (creator_id), INDEX IDX_3BAE0AA7401B253C (event_type_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE event_user (event_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_92589AE271F7E88B (event_id), INDEX IDX_92589AE2A76ED395 (user_id), PRIMARY KEY(event_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE event_type (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, weight INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE faculty (id INT AUTO_INCREMENT NOT NULL, university_id INT NOT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_17966043309D1878 (university_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE kafedra (id INT AUTO_INCREMENT NOT NULL, faculty_id INT NOT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_A59DB704680CAB68 (faculty_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE publish_type (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE student_publish (id INT AUTO_INCREMENT NOT NULL, student_id INT NOT NULL, type_id INT NOT NULL, html LONGTEXT NOT NULL, INDEX IDX_55A279B9CB944F1A (student_id), INDEX IDX_55A279B9C54C8C93 (type_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE teach_group (id INT AUTO_INCREMENT NOT NULL, kafedra_id INT NOT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_E9AD666E4472BACF (kafedra_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE university (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, address VARCHAR(1024) NOT NULL, city VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, photo VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_IDENTIFIER_USERNAME (username), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_student_publish (user_id INT NOT NULL, student_publish_id INT NOT NULL, INDEX IDX_477E1536A76ED395 (user_id), INDEX IDX_477E15366AEB0081 (student_publish_id), PRIMARY KEY(user_id, student_publish_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE event ADD CONSTRAINT FK_3BAE0AA761220EA6 FOREIGN KEY (creator_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE event ADD CONSTRAINT FK_3BAE0AA7401B253C FOREIGN KEY (event_type_id) REFERENCES event_type (id)');
        $this->addSql('ALTER TABLE event_user ADD CONSTRAINT FK_92589AE271F7E88B FOREIGN KEY (event_id) REFERENCES event (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE event_user ADD CONSTRAINT FK_92589AE2A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE faculty ADD CONSTRAINT FK_17966043309D1878 FOREIGN KEY (university_id) REFERENCES university (id)');
        $this->addSql('ALTER TABLE kafedra ADD CONSTRAINT FK_A59DB704680CAB68 FOREIGN KEY (faculty_id) REFERENCES faculty (id)');
        $this->addSql('ALTER TABLE student_publish ADD CONSTRAINT FK_55A279B9CB944F1A FOREIGN KEY (student_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE student_publish ADD CONSTRAINT FK_55A279B9C54C8C93 FOREIGN KEY (type_id) REFERENCES publish_type (id)');
        $this->addSql('ALTER TABLE teach_group ADD CONSTRAINT FK_E9AD666E4472BACF FOREIGN KEY (kafedra_id) REFERENCES kafedra (id)');
        $this->addSql('ALTER TABLE user_student_publish ADD CONSTRAINT FK_477E1536A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_student_publish ADD CONSTRAINT FK_477E15366AEB0081 FOREIGN KEY (student_publish_id) REFERENCES student_publish (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE event DROP FOREIGN KEY FK_3BAE0AA761220EA6');
        $this->addSql('ALTER TABLE event DROP FOREIGN KEY FK_3BAE0AA7401B253C');
        $this->addSql('ALTER TABLE event_user DROP FOREIGN KEY FK_92589AE271F7E88B');
        $this->addSql('ALTER TABLE event_user DROP FOREIGN KEY FK_92589AE2A76ED395');
        $this->addSql('ALTER TABLE faculty DROP FOREIGN KEY FK_17966043309D1878');
        $this->addSql('ALTER TABLE kafedra DROP FOREIGN KEY FK_A59DB704680CAB68');
        $this->addSql('ALTER TABLE student_publish DROP FOREIGN KEY FK_55A279B9CB944F1A');
        $this->addSql('ALTER TABLE student_publish DROP FOREIGN KEY FK_55A279B9C54C8C93');
        $this->addSql('ALTER TABLE teach_group DROP FOREIGN KEY FK_E9AD666E4472BACF');
        $this->addSql('ALTER TABLE user_student_publish DROP FOREIGN KEY FK_477E1536A76ED395');
        $this->addSql('ALTER TABLE user_student_publish DROP FOREIGN KEY FK_477E15366AEB0081');
        $this->addSql('DROP TABLE event');
        $this->addSql('DROP TABLE event_user');
        $this->addSql('DROP TABLE event_type');
        $this->addSql('DROP TABLE faculty');
        $this->addSql('DROP TABLE kafedra');
        $this->addSql('DROP TABLE publish_type');
        $this->addSql('DROP TABLE student_publish');
        $this->addSql('DROP TABLE teach_group');
        $this->addSql('DROP TABLE university');
        $this->addSql('DROP TABLE `user`');
        $this->addSql('DROP TABLE user_student_publish');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
