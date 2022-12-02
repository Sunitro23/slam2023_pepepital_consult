<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221202092649 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE effets_secondaire_medicament DROP FOREIGN KEY FK_2E1CC85374DB3449');
        $this->addSql('ALTER TABLE effets_secondaire_medicament DROP FOREIGN KEY FK_2E1CC853AB0D61F7');
        $this->addSql('DROP TABLE effets_secondaire');
        $this->addSql('DROP TABLE effets_secondaire_medicament');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE effets_secondaire (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(50) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE effets_secondaire_medicament (effets_secondaire_id INT NOT NULL, medicament_id INT NOT NULL, INDEX IDX_2E1CC85374DB3449 (effets_secondaire_id), INDEX IDX_2E1CC853AB0D61F7 (medicament_id), PRIMARY KEY(effets_secondaire_id, medicament_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE effets_secondaire_medicament ADD CONSTRAINT FK_2E1CC85374DB3449 FOREIGN KEY (effets_secondaire_id) REFERENCES effets_secondaire (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE effets_secondaire_medicament ADD CONSTRAINT FK_2E1CC853AB0D61F7 FOREIGN KEY (medicament_id) REFERENCES medicament (id) ON DELETE CASCADE');
    }
}
