<?php

namespace App\Entity;

use App\Repository\EventRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EventRepository::class)]
class Event
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'created_events')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $creator = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $html = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date = null;

    #[ORM\ManyToOne(inversedBy: 'events')]
    #[ORM\JoinColumn(nullable: false)]
    private ?EventType $eventType = null;

    /**
     * @var Collection<int, User>
     */
    #[ORM\ManyToMany(targetEntity: User::class, inversedBy: 'visited_events')]
    private Collection $visitors;

    /**
     * @var Collection<int, User>
     */
    #[ORM\ManyToMany(targetEntity: User::class, inversedBy: 'liked_events')]
    #[ORM\JoinTable('user_event_like')]
    private Collection $like_users;

    public function __construct()
    {
        $this->visitors = new ArrayCollection();
        $this->like_users = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCreator(): ?User
    {
        return $this->creator;
    }

    public function setCreator(?User $creator): static
    {
        $this->creator = $creator;

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

    public function getHtml(): ?string
    {
        return $this->html;
    }

    public function setHtml(string $description): static
    {
        $this->html = $description;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): static
    {
        $this->date = $date;

        return $this;
    }

    public function getEventType(): ?EventType
    {
        return $this->eventType;
    }

    public function setEventType(?EventType $eventType): static
    {
        $this->eventType = $eventType;

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getVisitors(): Collection
    {
        return $this->visitors;
    }

    public function addVisitor(User $visitor): static
    {
        if (!$this->visitors->contains($visitor)) {
            $this->visitors->add($visitor);
        }

        return $this;
    }

    public function removeVisitor(User $visitor): static
    {
        $this->visitors->removeElement($visitor);

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getLikeUsers(): Collection
    {
        return $this->like_users;
    }

    public function addLikeUser(User $likeUser): static
    {
        if (!$this->like_users->contains($likeUser)) {
            $this->like_users->add($likeUser);
        }

        return $this;
    }

    public function removeLikeUser(User $likeUser): static
    {
        $this->like_users->removeElement($likeUser);

        return $this;
    }
}
