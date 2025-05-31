# Weapons & Damages types

in DOOM Game Engine, there are distinct types of weapons & damages that makes the fun of battle.

## By Bullet

types of known bullet, weapons would emit such as

- Hitscan ([`A_FireBullets`](https://zdoom.org/wiki/A_FireBullets), Monster [`A_CustomBulletAttack`](https://zdoom.org/wiki/A_CustomBulletAttack), Melee [`A_Punch`](https://zdoom.org/wiki/A_Punch), Melee [`A_CustomPunch`](https://zdoom.org/wiki/A_CustomPunch), Melee [`A_Saw`](https://zdoom.org/wiki/A_Saw), Monster Melee [`A_M_Saw`](https://zdoom.org/wiki/A_M_Saw)). The bullet goes instantly like a laser. These weapons instantly spawns the damaging actor usually `BulletPuff` **right where you shoot at, plus some inaccurator spreads**. While it's a lazy & unrealistic way to weapon, it also provides a challenge for opponent that affects how should they build strategies, since these types of weapons when shot will instantly damage them & undodgeable.
    - Fist
    - Chainsaw
    - Pistol
    - Shotgun
    - Super Shotgun
    - Bites (such as from Pinkies)
- Projectile ([`A_FireMissile`](https://zdoom.org/wiki/A_FireMissile), Monster [`A_SpawnProjectile`](https://zdoom.org/wiki/A_SpawnProjectile), Monster [~~`A_CustomMissile`~~ (Deprecated)](https://zdoom.org/wiki/A_CustomMissile)) a.k.a. `Missile`. The bullet projectile **literally spawns onto the scene, then fly towards where you shoot it at or whatever**. The bullet projectiles on these are typically very slow compared to hitscan. If a pistol has this type (in which the projectile runs super fast to fill in the effect), it feels very realistic & kind-of dodgeable at some point if you know what you're doing.
    - Plasma Riffle
    - Rocket Launcher
    - BFG 9000

## The `DamageType`

There are more specific ways to read what weapon was it this which their bullet impacted other Actors. You can see predefined [examples here for ZDoom in its Wiki](https://zdoom.org/wiki/Predefined_damage_types).

You can also define one your own with either above predefined, [or a custom word for it](https://zdoom.org/wiki/Custom_damage_types_(ZScript)).

```
class aSpecificBarrel : Barrel
{
    ...
    Default
    {
        DamageType SpecificBarrel; // make this thing damage type `SpecificBarrel` to make it standout.
    }
    ...
}

// from ZDoom Wiki (https://zdoom.org/wiki/Custom_damage_types_(ZScript)),
// a projectile for `A_FireMissile` of fireball from Imp or something. has damage type of `Fire`.
class Fireball : Actor
{
    Default
    {
        Projectile;
        DamageType 'Fire';
    ...
    }
}
```

This gives not only detail but also you can design Player Classes, Enemies, etc. that will react differently based on what damage type it was inflicted from. e.g., being immune to certain types of damage (of course, also the opposites like severe alergy to it).

```
class anSpecialGuy : DoomPlayer
{
    ...
    Default
    {
        DamageFactor "SpecificBarrel" 0; // will immune to `aSpecificBarrel`'s explosion
        PainChance "SpecificBarrel" 0; // for good measure.
    }
    ...
}

// Or an alergic?
class anAlergicGuy : DoomPlayer
{
    ...
    Default
    {
        DamageFactor "SpecificBarrel" 999999999999999999; // will fatally alergic to `aSpecificBarrel`'s explosion
        PainChance "SpecificBarrel" 100; // for good measure.
    }
    ...
}

// from ZDoom Wiki (https://zdoom.org/wiki/Custom_damage_types_(ZScript)),
// a flamable Zombie?, with special reaction to flames which are `On Fire` & burned to death.
class MyZombie : ZombieMan
{
    Default
    {
        PainChance 'Fire', 255;
    } 
    States 
    {
    Pain.Fire:
         ZMBF AB 3;
         ZMBF C 5 A_StartSound("myzombie/Burn");
         ZMBF D 3;
         goto See;
    Death.Fire:
         ZMBF EFG 3;
         ZMBF H 2 A_StartSound("myzombie/BurnDeath");
         ZMBF IJ 3;
         ZMBF K 3 A_NoBlocking;
         ZMBF L -1;
         stop;
    }
}

// or perhaps Pokemon style damage reacting Imps..
class RaiDoom : DoomImp replaces CellPack
{
    Default
    {
        Health 200;
        +MISSILEMORE
        +MISSILEEVENMORE
        Speed 16;
        DamageFactor 'Pikachu', 0.2; // it's not very effective...
        DamageFactor 'Squirtle', 1.8;  // it's super effective!
   }
}
```

**Fun fact btw,** on many source ports since original DOOM, **on Deathmatch** if you tried to press / passes Level Exit switches / linedefs, you will die instantly (under `Exit` / `MOD_EXIT (20)` Damage Type). Yes, you tryna escape while in the hot heat of a fragging?, not in this house. 

## Moar Sauces

- https://zdoom.org/wiki/Damage_types
- https://zdoom.org/wiki/Predefined_damage_types
- https://zdoom.org/wiki/Custom_damage_types_(ZScript)
- https://zdoom.org/wiki/SpawnMissile