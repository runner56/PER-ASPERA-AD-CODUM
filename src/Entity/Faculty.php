<?php

namespace App\Entity;

use App\Repository\FacultyRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FacultyRepository::class)]
class Faculty
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'faculties')]
    #[ORM\JoinColumn(nullable: false)]
    private ?University $university = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    /**
     * @var Collection<int, Kafedra>
     */
    #[ORM\OneToMany(targetEntity: Kafedra::class, mappedBy: 'faculty', orphanRemoval: true)]
    private Collection $kafedras;

    public function __construct()
    {
        $this->kafedras = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUniversity(): ?University
    {
        return $this->university;
    }

    public function setUniversity(?University $university): static
    {
        $this->university = $university;

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
     * @return Collection<int, Kafedra>
     */
    public function getKafedras(): Collection
    {
        return $this->kafedras;
    }

    public function addKafedra(Kafedra $kafedra): static
    {
        if (!$this->kafedras->contains($kafedra)) {
            $this->kafedras->add($kafedra);
            $kafedra->setFaculty($this);
        }

        return $this;
    }

    public function removeKafedra(Kafedra $kafedra): static
    {
        if ($this->kafedras->removeElement($kafedra)) {
            // set the owning side to null (unless already changed)
            if ($kafedra->getFaculty() === $this) {
                $kafedra->setFaculty(null);
            }
        }

        return $this;
    }

}
