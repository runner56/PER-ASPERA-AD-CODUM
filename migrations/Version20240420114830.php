<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240420114830 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user ADD teach_group_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D649BFC83087 FOREIGN KEY (teach_group_id) REFERENCES teach_group (id)');
        $this->addSql('CREATE INDEX IDX_8D93D649BFC83087 ON user (teach_group_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE `user` DROP FOREIGN KEY FK_8D93D649BFC83087');
        $this->addSql('DROP INDEX IDX_8D93D649BFC83087 ON `user`');
        $this->addSql('ALTER TABLE `user` DROP teach_group_id');
    }
}
