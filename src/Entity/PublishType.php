<?php

namespace App\Entity;

use App\Repository\PublishTypeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PublishTypeRepository::class)]
class PublishType
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    /**
     * @var Collection<int, StudentPublish>
     */
    #[ORM\OneToMany(targetEntity: StudentPublish::class, mappedBy: 'type', orphanRemoval: true)]
    private Collection $studentPublishes;

    public function __construct()
    {
        $this->studentPublishes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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
     * @return Collection<int, StudentPublish>
     */
    public function getStudentPublishes(): Collection
    {
        return $this->studentPublishes;
    }

    public function addStudentPublish(StudentPublish $studentPublish): static
    {
        if (!$this->studentPublishes->contains($studentPublish)) {
            $this->studentPublishes->add($studentPublish);
            $studentPublish->setType($this);
        }

        return $this;
    }

    public function removeStudentPublish(StudentPublish $studentPublish): static
    {
        if ($this->studentPublishes->removeElement($studentPublish)) {
            // set the owning side to null (unless already changed)
            if ($studentPublish->getType() === $this) {
                $studentPublish->setType(null);
            }
        }

        return $this;
    }
}
