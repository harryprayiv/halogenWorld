# halogenWorld

I am trying to get the  simple code here: https://purescript-halogen.github.io/purescript-halogen/guide/index.html
to work with purs-nix and having NO success whatsoever.

`file:///.../halogenWorld/output/Effect.Aff/foreign.js:530
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
`
