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

    #[ORM\Column(nullable: true)]
    private ?string $photo = null;

    #[ORM\ManyToOne(inversedBy: 'students')]
    private ?TeachGroup $teachGroup = null;

    #[ORM\Column(options: ['default' => true])]
    private ?bool $is_verify = true;

    #[ORM\Column(length: 255)]
    private ?string $lastname = null;

    #[ORM\Column(length: 255)]
    private ?string $firstname = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    #[ORM\Column(options: ['default' => 0])]
    private ?int $star = 0;

    #[ORM\ManyToOne(inversedBy: 'users')]
    private ?University $university = null;

    /**
     * @var Collection<int, Event>
     */
    #[ORM\JoinTable('user_event_like')]
    #[ORM\ManyToMany(targetEntity: Event::class, mappedBy: 'like_users')]
    private Collection $liked_events;

    /**
     * @var Collection<int, Achievment>
     */
    #[ORM\OneToMany(targetEntity: Achievment::class, mappedBy: 'student')]
    private Collection $achievments;

    public function __construct()
    {
        $this->created_events = new ArrayCollection();
        $this->visited_events = new ArrayCollection();
        $this->studentPublishes = new ArrayCollection();
        $this->likes = new ArrayCollection();
        $this->liked_events = new ArrayCollection();
        $this->achievments = new ArrayCollection();
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
        $this->username = 't'.$username;

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

    public function setPhoto(string $photo): User
    {
        $this->photo = $photo;
        return $this;
    }

    public function getPhoto(): ?string
    {
        return $this->photo ?? null;
    }

    public function getTeachGroup(): ?TeachGroup
    {
        return $this->teachGroup;
    }

    public function setTeachGroup(?TeachGroup $teachGroup): static
    {
        $this->teachGroup = $teachGroup;

        return $this;
    }

    public function isVerify(): ?bool
    {
        return $this->is_verify;
    }

    public function setVerify(bool $is_verify): static
    {
        $this->is_verify = $is_verify;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): static
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): static
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getStar(): ?int
    {
        return $this->star;
    }

    public function setStar(int $star): static
    {
        $this->star = $star;

        return $this;
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

    /**
     * @return Collection<int, Event>
     */
    public function getLikedEvents(): Collection
    {
        return $this->liked_events;
    }

    public function addLikedEvent(Event $likedEvent): static
    {
        if (!$this->liked_events->contains($likedEvent)) {
            $this->liked_events->add($likedEvent);
            $likedEvent->addLikeUser($this);
        }

        return $this;
    }

    public function removeLikedEvent(Event $likedEvent): static
    {
        if ($this->liked_events->removeElement($likedEvent)) {
            $likedEvent->removeLikeUser($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Achievment>
     */
    public function getAchievments(): Collection
    {
        return $this->achievments;
    }

    public function addAchievment(Achievment $achievment): static
    {
        if (!$this->achievments->contains($achievment)) {
            $this->achievments->add($achievment);
            $achievment->setStudent($this);
        }

        return $this;
    }

    public function removeAchievment(Achievment $achievment): static
    {
        if ($this->achievments->removeElement($achievment)) {
            // set the owning side to null (unless already changed)
            if ($achievment->getStudent() === $this) {
                $achievment->setStudent(null);
            }
        }

        return $this;
    }
}
