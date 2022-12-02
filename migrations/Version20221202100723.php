<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221202100723 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE medicament_effets_secondaire (medicament_id INT NOT NULL, effets_secondaire_id INT NOT NULL, INDEX IDX_715F59A7AB0D61F7 (medicament_id), INDEX IDX_715F59A774DB3449 (effets_secondaire_id), PRIMARY KEY(medicament_id, effets_secondaire_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE medicament_effets_secondaire ADD CONSTRAINT FK_715F59A7AB0D61F7 FOREIGN KEY (medicament_id) REFERENCES medicament (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE medicament_effets_secondaire ADD CONSTRAINT FK_715F59A774DB3449 FOREIGN KEY (effets_secondaire_id) REFERENCES effets_secondaire (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE medicament_effets_secondaire DROP FOREIGN KEY FK_715F59A7AB0D61F7');
        $this->addSql('ALTER TABLE medicament_effets_secondaire DROP FOREIGN KEY FK_715F59A774DB3449');
        $this->addSql('DROP TABLE medicament_effets_secondaire');
    }
}
