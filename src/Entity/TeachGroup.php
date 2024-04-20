<?php

namespace App\Entity;

use App\Repository\TeachGroupRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TeachGroupRepository::class)]
class TeachGroup
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'teachGroups')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Kafedra $kafedra = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    /**
     * @var Collection<int, User>
     */
    #[ORM\OneToMany(targetEntity: User::class, mappedBy: 'teachGroup')]
    private Collection $students;

    #[ORM\Column(options: ['default' => '2022'])]
    private ?int $streamYear = null;

    public function __construct()
    {
        $this->students = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getKafedra(): ?Kafedra
    {
        return $this->kafedra;
    }

    public function setKafedra(?Kafedra $kafedra): static
    {
        $this->kafedra = $kafedra;

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
     * @return Collection<int, User>
     */
    public function getStudents(): Collection
    {
        return $this->students;
    }

    public function addStudent(User $student): static
    {
        if (!$this->students->contains($student)) {
            $this->students->add($student);
            $student->setTeachGroup($this);
        }

        return $this;
    }

    public function removeStudent(User $student): static
    {
        if ($this->students->removeElement($student)) {
            // set the owning side to null (unless already changed)
            if ($student->getTeachGroup() === $this) {
                $student->setTeachGroup(null);
            }
        }

        return $this;
    }

    public function getStreamYear(): ?int
    {
        return $this->streamYear;
    }

    public function setStreamYear(int $stream_year): static
    {
        $this->streamYear = $stream_year;

        return $this;
    }
}
