<?php

namespace App\Entity;

use App\Repository\ReferentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ReferentRepository::class)]
class Referent
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $nomReferent = null;

    #[ORM\Column(length: 50)]
    private ?string $prenomReferent = null;

    #[ORM\OneToMany(mappedBy: 'referent', targetEntity: session::class, orphanRemoval: true)]
    private Collection $sessions;

    public function __construct()
    {
        $this->sessions = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomReferent(): ?string
    {
        return $this->nomReferent;
    }

    public function setNomReferent(string $nomReferent): static
    {
        $this->nomReferent = $nomReferent;

        return $this;
    }

    public function getPrenomReferent(): ?string
    {
        return $this->prenomReferent;
    }

    public function setPrenomReferent(string $prenomReferent): static
    {
        $this->prenomReferent = $prenomReferent;

        return $this;
    }

    /**
     * @return Collection<int, session>
     */
    public function getSessions(): Collection
    {
        return $this->sessions;
    }

    public function addSession(session $session): static
    {
        if (!$this->sessions->contains($session)) {
            $this->sessions->add($session);
            $session->setReferent($this);
        }

        return $this;
    }

    public function removeSession(session $session): static
    {
        if ($this->sessions->removeElement($session)) {
            // set the owning side to null (unless already changed)
            if ($session->getReferent() === $this) {
                $session->setReferent(null);
            }
        }

        return $this;
    }
}
