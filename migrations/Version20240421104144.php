<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240421104144 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user_event_like (event_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_14CFCAF471F7E88B (event_id), INDEX IDX_14CFCAF4A76ED395 (user_id), PRIMARY KEY(event_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE user_event_like ADD CONSTRAINT FK_14CFCAF471F7E88B FOREIGN KEY (event_id) REFERENCES event (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE user_event_like ADD CONSTRAINT FK_14CFCAF4A76ED395 FOREIGN KEY (user_id) REFERENCES `user` (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user_event_like DROP FOREIGN KEY FK_14CFCAF471F7E88B');
        $this->addSql('ALTER TABLE user_event_like DROP FOREIGN KEY FK_14CFCAF4A76ED395');
        $this->addSql('DROP TABLE user_event_like');
    }
}
