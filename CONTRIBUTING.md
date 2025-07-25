# Contributing to Lah Mboh MegaWAD PK3

> [!IMPORTANT]
> Comply these rules below to ensure your submission be includable

[![Submit Levels Quick & Dirty](/graphics/Generated/Eevee-DoomTextGen/d-submitDirty.png)](https://github.com/Perkedel/Lah-Mboh/issues/new?template=002-Level_submit.yml)

We trust that you've read & agreed with our general Terms of Service [here](https://perkedel.netlify.app/terms) & our Privacy Policy [here](https://perkedel.netlify.app/privacy_policy), these at hands.

We also have to stress that you must ensure what you're about to submit is what you drew yourself, or if yoinked, you have either received permission from the author and/or auto-granted by the license of the yoinks you're using.

With that out of the way, Now, carefully read & comply with the following instructions & rules of what can you do, must do, and avoid to do below.

## This project is SFW Only

Lah Mboh serves as the base for all DNB / Perkedel endeavour in Doom mapping & moddings. We have analyzed, for safety of audience who happens to seek & ponder upon your gameplay experience, 
we have stood the rule that ensure that the base right here is free from far fetched contexes, beside goriest guro depictions, DOOM is all about.

### Special only for this endeavour, you are allowed to submit anything into this PK3:

- Insults & Rants. Complete with uncensored swearing.
	- Disstrack.
	- Broken mods. [The sun is leaking](https://youtu.be/SkHo4wCmrEQ). a rant about oh so broken HL2 mod. Tragically, due to this callout, the mod dev added malicious measures to make the entire HL2 EXE (with that Overcharged mod installed) crash if it was played using those Steam accounts, which are noclick, Radiation Hazard, & friends. see [video](https://youtu.be/YcvsbZ18izA) from noclick for context.
	- Copyright Takedowns. such as Viacom Bersalah (Viacom the Blamed), a rant about Spongebob Massacre WAD takedown by Paramount Pictures which is a subsidiary of Viacom. Similar tone & vibe to `The sun is leaking` meme but for Indonesian.
- German Chancelors & its symbols, to be against for. **Be careful however, despite this all being about Wolfenstein, the region DE (Germany) still dislike this idea**. Therefore we recommend you to refrain from ever involving those symbols & depiction. If you have to, it is best to omit those elements. See Wolfenstein New Collossus DE distribution version!
- Reproductive Jokes (used sparingly). Example:
	- Cryptic Genitalia depiction & discussions & used as a joke or rant.
		- [NUTS.wad](https://www.doomworld.com/idgames/levels/doom2/Ports/m-o/nuts). A Map replacement PWAD, where this map contains over thousands of monsters. Waking them up puts your skill & even the Source Ports to the Benchmarks. Therefore `NUTS` here means `Insane` / `gila` rather than the scrotum.
	- Jiggly Sexiness concealed & semi-concealed. Such as ones found in Hoyoverse Zenless Zone Zero very prominently. Not even hiding the fact at all.
	- sussy baka! Reproductive inuendos as long it is 10 step before the *showtime*. 
	- Duke Nukem 3D sussy baka stuffs (retaining the censor on those)
- Vent
- etc.

### But you are not allowed to submit into this PK3:

- Actual Fictional Pornography. Please use & submit to our NSFW extension PWAD PK3 instead `ngocrot-deh` `LINK_HERE`. Example:
	- H
	- Encounter
- IRL Pornography. No extension PWAD indefinitely. not to be confused for `ngocrot-deh`.
- Derogatory N-words. This neither covered even in NSFW extension. use our Derogatory extension PWAD `wok-wak-wek-wok` (pls link) (small note: no color derogatory allowed at all there even! only G-word I think!)
- Death Threats. No Extension PWAD.
- Suicide Encouragement. Zero tolerance, no PWAD.
- Doxxing. No Extension PWAD. Even to public companies (with known HQ locations & contacts) where context & intent is to cause raid & also compromise anyone safety whose completely nothing to do with the drama incident, in-all eitherways.
- Non Free-Culture stipulated files. Those file violate our distribution goal (that includes but not limited to such as Arcade machines, Embedded Device Toy, Linux Distros). use our NoCommercialable extension PWAD `Bring-Your-Own-USB-SFW` pls link.

### (CLA) Contribution Results

Once your submission have been accepted, your contributions must be licensed as follows:

> Assets: CC4.0-BY-SA
> Codes: GNU GPL v3

License that comes from yoinks will remain unchanged

## Always fork from the development branch

Dev Branch: `main`

Ensure that you have obtained all latest assets & the references at the latest version to begin your submission making.

When you're done, issue Pull Request your fork back to us. We will review & when everything is eligible, your stuffs will be added in no time.

## Use Issue much less

Issue is designed for bug reporting & too small too fork for submissions.

## Testing your Map

Simply Clone this entire source code, then load this entire project folder as your PWAD.

## Get Started

- Prepare your environment!
	- Make empty folder dedicated for your contribution
	- `cd ~/DoomProjectFolder` there
	- `git clone https://github.com/Perkedel/Lah-Mboh`, and you shall see a new folder of this source code
	- `cd Lah-Mboh`
- Setup your Doom! Read [`INSTALL.md`](/INSTALL.md) file
	- GZDoom / VKDoom Latest
	- Load this entire source code folder into your load order, i.e. `gzdoom -iwad freedoom2.wad -file core.wad Lah-Mboh customMod.wad` stuff like that
	- `Lah-Mboh` must be loaded after core mods & before maps + resources + extra mods.
	- [Ultimate Doom](https://ultimatedoombuilder.github.io/) Builder for mapping
	- [SLADE](https://slade.mancubus.net/) for lump edits such as compiling ACS, Aligning & Adding Textures, compressing PNG, etc.
	- [Sekaiju](https://openmidiproject.opal.ne.jp/) for MIDI
	- Audacity for recording, audio edit, & coversion

## Submitting Levels

Use Pull Request! (**TODO: TUTORIAL PLS!**)

- Fork this source code
- Clone
- Add your level
- Commit & Push to your fork.
- Repeat save to GitHub until you got all the levels done.
- Once done, make Pull Request back here.
- When we receive the notification, we will promptly review those new map wads & if good enough & safe, will be accepted.

### Tips for Level, Mods ZScript & DECORATE, Assets, etc.

- No need Difficulty Implementation yet! We will handle this if necessary. It's okay if you had, and we'll still adjust it further.
- No need to edit the Level Selector & MAPINFO. We'll also handle those.
- Must write author! inside each of your `map` field of MAPINFO, the `Author` cannot be empty! You don't want your name be forgotten right? 
- While we are too lazy to check license of whatever assets contained in your Pull request, Please **AVOID including files that originally PAID**. Such as PWADs, IWADs, MIDIs (Yamaha Musicsoft e.g.), etc. We do not want to sparsdat in this repository, because this repository should make it to arcade machine somehow.
- [Compress your files!](/docs/Tutorial/SladeMaintenance.md). Using Trifecta PNG Optimizer to the SLADE, Render / Convert SFX & Audio Musics in(to) Opus, prioritize musics in MIDI, etc.
- (Personal) If you make slaughter / impossible: 
    - make this entirely optional & escapable
    - All those cameo enemies there `No Completition` (leave just the main boss Completition)
    - even if you provide equal or more arsenals.
- Ensure all resource available to the brim, especially Health & Weapons! Repeated & consistent resource depletion in every New Game causes players to cheat!

## Iyeah