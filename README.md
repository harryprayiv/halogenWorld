## halogenWorld: a simple purs-nix hello world for web apps using halogen

I am trying to get the very simple code [here](https://purescript-halogen.github.io/purescript-halogen/guide/index.html) to work with purs-nix and having NO success whatsoever.
It runs fine when I paste it [here](https://try.purescript.org/) but doesn't work when I try to run it with purs-nix like I am in this repo.


Here's the current error message that is confusing me.  It seems to indicate that I don't have npm connected/working properly.  Since this project is to be entirely flake managed, everything should be handled in the flake which is is based heavily on the flake outputs [here](https://github.com/LovelaceAcademy/nix-templates).  I'm stuck at hello world, using purs-nix.....Not an encouraging sign of the purs-nix tooling as it stands today.

```
file:///.../halogenWorld/output/Effect.Aff/foreign.js:530
                throw util.fromLeft(step);
                ^
                
ReferenceError: window is not defined
    at windowImpl (file:///.../halogenWorld/output/Web.HTML/foreign.js:2:3)
    at file:///.../halogenWorld/output/Effect/foreign.js:10:16
    at file:///.../halogenWorld/output/Effect/foreign.js:10:16
    at __do (file:///.../halogenWorld/output/Halogen.Aff.Util/index.js:45:119)
    at runAsync (file:///.../halogenWorld/output/Effect.Aff/foreign.js:96:20)
    at run (file:///.../halogenWorld/output/Effect.Aff/foreign.js:331:22)
    at file:///.../halogenWorld/output/Effect.Aff/foreign.js:637:15
    at drain (file:///.../halogenWorld/output/Effect.Aff/foreign.js:118:9)
    at Object.enqueue (file:///.../halogenWorld/output/Effect.Aff/foreign.js:139:11)
    at Object.run (file:///.../halogenWorld/output/Effect.Aff/foreign.js:636:23)
```
