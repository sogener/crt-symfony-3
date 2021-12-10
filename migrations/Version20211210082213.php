<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211210082213 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE "user" (id INT NOT NULL, name VARCHAR(255) NOT NULL, second_name VARCHAR(255) NOT NULL, PRIMARY KEY(id))');
        $this->addSql('ALTER TABLE article ADD comments_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE article ADD CONSTRAINT FK_23A0E6663379586 FOREIGN KEY (comments_id) REFERENCES comments (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_23A0E6663379586 ON article (comments_id)');
        $this->addSql('ALTER TABLE comments DROP CONSTRAINT fk_5f9e962a7294869c');
        $this->addSql('DROP INDEX uniq_5f9e962a7294869c');
        $this->addSql('ALTER TABLE comments DROP article_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('DROP TABLE "user"');
        $this->addSql('ALTER TABLE article DROP CONSTRAINT FK_23A0E6663379586');
        $this->addSql('DROP INDEX IDX_23A0E6663379586');
        $this->addSql('ALTER TABLE article DROP comments_id');
        $this->addSql('ALTER TABLE comments ADD article_id INT NOT NULL');
        $this->addSql('ALTER TABLE comments ADD CONSTRAINT fk_5f9e962a7294869c FOREIGN KEY (article_id) REFERENCES article (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE UNIQUE INDEX uniq_5f9e962a7294869c ON comments (article_id)');
    }
}
