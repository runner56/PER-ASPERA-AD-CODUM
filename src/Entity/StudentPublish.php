<?php

namespace App\Entity;

use App\Repository\StudentPublishRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: StudentPublishRepository::class)]
class StudentPublish
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $html = null;

    #[ORM\ManyToOne(inversedBy: 'studentPublishes')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $student = null;

    /**
     * @var Collection<int, User>
     */
    #[ORM\ManyToMany(targetEntity: User::class, mappedBy: 'likes')]
    private Collection $liked_users;

    #[ORM\ManyToOne(inversedBy: 'studentPublishes')]
    #[ORM\JoinColumn(nullable: false)]
    private ?PublishType $type = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    public function __construct()
    {
        $this->liked_users = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getHtml(): ?string
    {
        return $this->html;
    }

    public function setHtml(string $html): static
    {
        $this->html = $html;

        return $this;
    }

    public function getStudent(): ?User
    {
        return $this->student;
    }

    public function setStudent(?User $student): static
    {
        $this->student = $student;

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getLikedUsers(): Collection
    {
        return $this->liked_users;
    }

    public function addLikedUser(User $likedUser): static
    {
        if (!$this->liked_users->contains($likedUser)) {
            $this->liked_users->add($likedUser);
            $likedUser->addLike($this);
        }

        return $this;
    }

    public function removeLikedUser(User $likedUser): static
    {
        if ($this->liked_users->removeElement($likedUser)) {
            $likedUser->removeLike($this);
        }

        return $this;
    }

    public function getType(): ?PublishType
    {
        return $this->type;
    }

    public function setType(?PublishType $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }
}
