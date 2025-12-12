# Vertical Portal ala Duke Nukem

![The Portala](src/screenshot/thePortala.png)  
![Portala Layout](src/screenshot/portalaLayout.png)

Here's how you can do **Sector Portal** much like used in Duke Nukem (the fan would be, not official ones). Sector Portal allows you to see what's underneath upon its entry, and vice versa, complete with seamless interactibility & virtual camera.

## Criteria & Terms

Building this while easy once you understand, is a bit complicated. Imagine you have a mound, where there is a crater sector tagged 124, that leads you into an inverse ceiling mound with crater tagged 125. Basically one tag, and then another.

- Have those said sectors for the entry & exit. **The shape must be exactly identical for both**.
- Build 2 stray lines inside each crater sectors. Let's say, the left stray line is for the exit, & the latter is for the entry.
  - And so, The left lines are tagged 125 (Exit). on the entry mound, since the left goes outside itself, you set `Misc` to 1.
  - The right lines are tagged 124 (Entry). on the exit mound, since the right goes outside itself, you set `Misc` to 1.
  - Therefore whenever the stray line goes out to the target, it will `Misc` 1.
  - And also hence, the lines that goes to its own sector will have `Misc` 0.
  - In total:
    - Floor Entry Mound's (sector 124) right line `Misc` 0, Tag 124
    - Ceiling Exit Mound's (sector 125) left line `Misc` 0, Tag 125
    - Floor Entry Mound's (sector 124) left line `Misc` 1, Tag 125
    - Ceiling Exit Mound's (sector 125) right line `Misc` 1, Tag 124
  - Images:
    - ![Layout](src/screenshot/portalaLayout.png)
    - ![InOutLeft](src/screenshot/portalaInToOutLeft.png)
    - ![InOutRight](src/screenshot/portalaInToOutRight.png)
    - ![OutInLeft](src/screenshot/portalaOutOfInLeft.png)
    - ![OutInRight](src/screenshot/portalaOutOfInRight.png)
    - ![3D View Entry](src/screenshot/portalaEntry.png)
    - ![3D View Exit](src/screenshot/portalaExit.png)
- Adjust so the height both entry & exit crater adjacent. if you say 512 floor, then 512 the floor.. Overlapping (Pinching) may cause floating halo effect, and Underlapping (Stretching) may pipe effect.
- Finally, **One of the portal cannot be placed at the same sector group**. If this happen, the portal interactibility will fail. You must sever an area of sector for one of your portal.
  - Usually, you'd done this because you usually have a building. a sector about inside the building, and another for its second floor. Then the portal is the corridor hole connecting all floors.
  - However, making Line Portal doorway for access between the two is fine and still considered separate sectors.
  
> [!WARNING]  
> Beware! avoid causing recursive viewing (i.e. portal A ends to portal B and back and forth)! It will cause lag.