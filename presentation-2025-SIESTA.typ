#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.5.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "utils.typ": *

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config,
    show-bibliography-as-footnote: bibliography(title: none, "bibliography.bib"),
  ),
  config-info(
    title: [Engineering Many-Agent Cooperative Learning in Collective Adaptive
Systems],
subtitle: [International Software Engineering Summer School \@ SIESTA 2025],
    author: author_list(
      (
        (first_author("Davide Domini"), "davide.domini@unibo.it"),
      ), logo: "images/university.svg"
    ),
    // date: datetime(day: 31, month: 03, year: 2025).display("[day] [month repr:long] [year]"),
    // institution: [University of Bologna],
    // logo: align(right)[#image("images/disi.svg", width: 55%)],
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")

#set raw(tab-size: 4)
// #show raw: set text(size: 0.85em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: (x: 1em, y: 1em),
  radius: 0.7em,
  width: 100%,
)
#show raw.where(block: true): set text(size: 0.75em)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: set text(size: 0.75em)

#set list(marker: box(height: 0.65em, align(horizon, text(size: 2em)[#sym.dot])))

#let emph(content) = text(weight: "bold", style: "italic", content)
#show link: set text(hyphenate: true)

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none, indent: 1em))

// #focus-slide[
//   #text(weight: "bold")[Context]
// ]

== Vision of Future Technologies
#components.side-by-side(columns: (1fr, 1fr, 1fr))[
  #figure(image("images/smart-city.jpeg", height: 60%))
][
  #figure(image("images/crowd.jpeg", height: 60%))
][
  #figure(image("/images/drones.jpeg", height: 60%))
]

== What they have in common?
- A plethora of _devices_ and _services_ that need to work together
  - *Autonomous* and *distributed* systems
    - E.g., autonomous vehicles, smart cities, drones, IoT
  - *Heterogeneous* components with varying capabilities and resources
    - E.g., sensors, actuators, mobile devices, cloud services
  - Need for *autonomous decision-making* at both local and global levels
    - E.g., balancing global traffic optimization while satisfying individual routing needs
  - *Coordination challenges* across different spatial and temporal scales
    - E.g., traffic may be congested in one area while free-flowing in another

== Challenges
#figure(image("images/challenges.svg", height: 60%))


== Goal

_A novel, *self-organizing* learning paradigm that *holistically* tackles scalability, efficiency and decentralization challenges -- *all at once*_


== Progress to Date

- Explored *proximity-based and field-based coordination* to overcome non-IID data and decentralization bottlenecks

- Designed *self-federated learning* strategies that reduce communication and resource overhead

- Created *benchmarks#footnote(link("https://github.com/davidedomini/ProFed")) and toolchains#footnote(link("https://github.com/phyelds/phyelds"))* to evaluate scalability and real-world applicability

- Laid the foundations for *self-adaptive, decentralized* collective intelligence

== Research Roadmap
#figure(image("images/roadmap.svg", height: 60%))

