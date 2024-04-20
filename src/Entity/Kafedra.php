<?php

namespace App\Entity;

use App\Repository\KafedraRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: KafedraRepository::class)]
class Kafedra
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'kafedras')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Faculty $faculty = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    /**
     * @var Collection<int, TeachGroup>
     */
    #[ORM\OneToMany(targetEntity: TeachGroup::class, mappedBy: 'kafedra', orphanRemoval: true)]
    private Collection $teachGroups;

    public function __construct()
    {
        $this->teachGroups = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFaculty(): ?Faculty
    {
        return $this->faculty;
    }

    public function setFaculty(?Faculty $faculty): static
    {
        $this->faculty = $faculty;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, TeachGroup>
     */
    public function getTeachGroups(): Collection
    {
        return $this->teachGroups;
    }

    public function addTeachGroup(TeachGroup $teachGroup): static
    {
        if (!$this->teachGroups->contains($teachGroup)) {
            $this->teachGroups->add($teachGroup);
            $teachGroup->setKafedra($this);
        }

        return $this;
    }

    public function removeTeachGroup(TeachGroup $teachGroup): static
    {
        if ($this->teachGroups->removeElement($teachGroup)) {
            // set the owning side to null (unless already changed)
            if ($teachGroup->getKafedra() === $this) {
                $teachGroup->setKafedra(null);
            }
        }

        return $this;
    }
}
