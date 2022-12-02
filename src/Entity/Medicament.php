<?php

namespace App\Entity;

use App\Repository\MedicamentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MedicamentRepository::class)]
class Medicament
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 35)]
    private ?string $libelle = null;

    #[ORM\ManyToOne(inversedBy: 'medicaments')]
    #[ORM\JoinColumn(nullable: false)]
    private ?MethodeApplication $methodeApplication = null;

    #[ORM\OneToMany(mappedBy: 'medicaments', targetEntity: Indication::class)]
    private Collection $indications;

    #[ORM\ManyToMany(targetEntity: EffetsSecondaire::class, inversedBy: 'medicaments')]
    private Collection $effetsSecondaires;

    public function __construct()
    {
        $this->indications = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    /**
     * @return Collection<int, EffetSecondaire>
     */
    public function getEffetsSecondaires(): Collection
    {
        return $this->effetsSecondaires;
    }

    public function addEffetsSecondaire(EffetsSecondaire $effetsSecondaire): self
    {
        if (!$this->effetsSecondaires->contains($effetsSecondaire)) {
            $this->effetsSecondaires->add($effetsSecondaire);
        }

        return $this;
    }

    public function removeEffetsSecondaire(EffetsSecondaire $effetsSecondaire): self
    {
        $this->effetsSecondaires->removeElement($effetsSecondaire);

        return $this;
    }

    public function setLibelle(string $libelle): self
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getMethodeApplication(): ?MethodeApplication
    {
        return $this->methodeApplication;
    }

    public function setMethodeApplication(?MethodeApplication $methodeApplication): self
    {
        $this->methodeApplication = $methodeApplication;

        return $this;
    }

    /**
     * @return Collection<int, Indication>
     */
    public function getIndications(): Collection
    {
        return $this->indications;
    }

    public function addIndication(Indication $indication): self
    {
        if (!$this->indications->contains($indication)) {
            $this->indications->add($indication);
            $indication->setMedicaments($this);
        }

        return $this;
    }

    public function removeIndication(Indication $indication): self
    {
        if ($this->indications->removeElement($indication)) {
            // set the owning side to null (unless already changed)
            if ($indication->getMedicaments() === $this) {
                $indication->setMedicaments(null);
            }
        }

        return $this;
    }
}
