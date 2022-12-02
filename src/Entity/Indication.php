<?php

namespace App\Entity;

use App\Repository\IndicationRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IndicationRepository::class)]
class Indication
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $posologie = null;

    #[ORM\ManyToOne(inversedBy: 'indications')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Medicament $medicaments = null;

    #[ORM\ManyToOne(inversedBy: 'indications')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Traitement $traitement = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPosologie(): ?string
    {
        return $this->posologie;
    }

    public function setPosologie(string $posologie): self
    {
        $this->posologie = $posologie;

        return $this;
    }

    public function getMedicaments(): ?Medicament
    {
        return $this->medicaments;
    }

    public function setMedicaments(?Medicament $medicaments): self
    {
        $this->medicaments = $medicaments;

        return $this;
    }

    public function getTraitement(): ?Traitement
    {
        return $this->traitement;
    }

    public function setTraitement(?Traitement $traitement): self
    {
        $this->traitement = $traitement;

        return $this;
    }
}
