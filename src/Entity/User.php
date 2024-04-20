<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table(name: '`user`')]
#[ORM\UniqueConstraint(name: 'UNIQ_IDENTIFIER_USERNAME', fields: ['username'])]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 180)]
    private ?string $username = null;

    /**
     * @var list<string> The user roles
     */
    #[ORM\Column]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    /**
     * @var Collection<int, Event>
     */
    #[ORM\OneToMany(targetEntity: Event::class, mappedBy: 'creator', orphanRemoval: true)]
    private Collection $created_events;

    /**
     * @var Collection<int, Event>
     */
    #[ORM\ManyToMany(targetEntity: Event::class, mappedBy: 'visitors')]
    private Collection $visited_events;

    /**
     * @var Collection<int, StudentPublish>
     */
    #[ORM\OneToMany(targetEntity: StudentPublish::class, mappedBy: 'student', orphanRemoval: true)]
    private Collection $studentPublishes;

    /**
     * @var Collection<int, StudentPublish>
     */
    #[ORM\ManyToMany(targetEntity: StudentPublish::class, inversedBy: 'liked_users')]
    private Collection $likes;

    #[ORM\Column]
    private File $photo;

    public function __construct()
    {
        $this->created_events = new ArrayCollection();
        $this->visited_events = new ArrayCollection();
        $this->studentPublishes = new ArrayCollection();
        $this->likes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): static
    {
        $this->username = $username;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string)$this->username;
    }

    /**
     * @return list<string>
     * @see UserInterface
     *
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    /**
     * @param list<string> $roles
     */
    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    /**
     * @return Collection<int, Event>
     */
    public function getCreatedEvents(): Collection
    {
        return $this->created_events;
    }

    public function addCreatedEvent(Event $createdEvent): static
    {
        if (!$this->created_events->contains($createdEvent)) {
            $this->created_events->add($createdEvent);
            $createdEvent->setCreator($this);
        }

        return $this;
    }

    public function removeCreatedEvent(Event $createdEvent): static
    {
        if ($this->created_events->removeElement($createdEvent)) {
            // set the owning side to null (unless already changed)
            if ($createdEvent->getCreator() === $this) {
                $createdEvent->setCreator(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Event>
     */
    public function getVisitedEvents(): Collection
    {
        return $this->visited_events;
    }

    public function addVisitedEvent(Event $visitedEvent): static
    {
        if (!$this->visited_events->contains($visitedEvent)) {
            $this->visited_events->add($visitedEvent);
            $visitedEvent->addVisitor($this);
        }

        return $this;
    }

    public function removeVisitedEvent(Event $visitedEvent): static
    {
        if ($this->visited_events->removeElement($visitedEvent)) {
            $visitedEvent->removeVisitor($this);
        }

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
            $studentPublish->setStudent($this);
        }

        return $this;
    }

    public function removeStudentPublish(StudentPublish $studentPublish): static
    {
        if ($this->studentPublishes->removeElement($studentPublish)) {
            // set the owning side to null (unless already changed)
            if ($studentPublish->getStudent() === $this) {
                $studentPublish->setStudent(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, StudentPublish>
     */
    public function getLikes(): Collection
    {
        return $this->likes;
    }

    public function addLike(StudentPublish $like): static
    {
        if (!$this->likes->contains($like)) {
            $this->likes->add($like);
        }

        return $this;
    }

    public function removeLike(StudentPublish $like): static
    {
        $this->likes->removeElement($like);

        return $this;
    }

    public function setPhoto(File $photo): User
    {
        $this->photo = $photo;
        return $this;
    }

    public function getPhoto(): File
    {
        return $this->photo;
    }
}
