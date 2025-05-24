# (TEMP) FD24res as is as of now 2025-05-22

This file was compiled by [forking it all just for myself](https://github.com/joelwindows7/freedoom), & then do [whatever I could to compile by cloud again](https://github.com/JOELwindows7/freedoom/blob/fd24/.github/workflows/make.yml).

Mind you, this file **got a lots of lacks right now**. Everything as of this writing from [it this commit of fd24](https://github.com/freedoom/freedoom/commit/d80c8e6effecb0d215465c21019dc33f9325bf30), [I brought over finally](https://github.com/JOELwindows7/freedoom/commit/7826184de8f32e2b96dbe6be8c79b53bc1baaed4) (if you want to cherry pick it that just for the CI idk).

Now you got Freedoom Phase 1 & 2, and also FreeDM. There is `fd24res.wad` each, so I took that out & bring it here.

## To load

Since certain number of asset file literally missing, you still need the original [`id24res.wad` (**paid**)](https://store.steampowered.com/app/2280/DOOM__DOOM_II/) just before loading this `fd24.wad` in that order. Without the literall existence (at least empty dummy file to placehold those all) asset files, such experience of Things will malfunctions.

Additionally, you also need `id24dec.wad` (load this even before `id24res.wad`) for ZDoom based source ports because they also lack ID24 classes. Of course, only by the future release of GZDoom later, should all ID24 stuffs be ready to use (hence you will no longer need those temporary DECORATEs). Mind you, this DECORATE DoomEdNum is not the same due to incompatibility with negative DoomEdNum, ID24 uses. 

A DECORATE patch for just older before v4.13 (ID24 weapons coming) will be made later.