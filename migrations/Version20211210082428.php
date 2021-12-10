<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211210082428 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE article DROP CONSTRAINT fk_23a0e6663379586');
        $this->addSql('DROP INDEX idx_23a0e6663379586');
        $this->addSql('ALTER TABLE article DROP comments_id');
        $this->addSql('ALTER TABLE comments ADD article_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE comments ADD CONSTRAINT FK_5F9E962A7294869C FOREIGN KEY (article_id) REFERENCES article (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX IDX_5F9E962A7294869C ON comments (article_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE article ADD comments_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE article ADD CONSTRAINT fk_23a0e6663379586 FOREIGN KEY (comments_id) REFERENCES comments (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('CREATE INDEX idx_23a0e6663379586 ON article (comments_id)');
        $this->addSql('ALTER TABLE comments DROP CONSTRAINT FK_5F9E962A7294869C');
        $this->addSql('DROP INDEX IDX_5F9E962A7294869C');
        $this->addSql('ALTER TABLE comments DROP article_id');
    }
}
