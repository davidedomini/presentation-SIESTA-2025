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
    title: [Sparse Self-Federated Learning for Energy Efficient
Cooperative Intelligence in Society 5.0],
subtitle: [Green Federated Learning Workshop \@ IJCNN 2025],
    author: author_list(
      (
        (first_author("Davide Domini"), "davide.domini@unibo.it"),
        ("Laura Ehran", ""),
        ("Gianluca Aguzzi", ""),
        ("Lucia Cavallaro", ""),
        ("Amirhossein Douzandeh Zenoozi", ""),
        ("Antonio Liotta", ""),
        ("Mirko Viroli", ""),
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

#focus-slide[
  #text(weight: "bold")[Context]
]

== Context
#only(1)[
  #figure(image("images/context-1.svg", width: 75%))
]
#only(2)[
  #figure(image("images/context-2.svg", width: 75%))
]
#only(3)[
  #figure(image("images/context-3.svg", width: 75%))
]

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

== Federated Learning in Large Scale IoT

=== Challenges:

- #emph[Non-IID Data]: devices in different regions may see skewed data distributions 
- #emph[Centralization Bottleneck]: Traditional FL relies on a central server for model aggregation, which conflicts with a fully decentralized Society 5.0 vision
- #emph[Communication Overhead]: Exchanging full model updates is bandwidth-heavy
- #emph[Resource Constraints]: Edge devices have limited battery, CPU, and memory

== Proximity based Non-IID Data
#components.side-by-side(columns: (1fr, 1fr), gutter: 1em, align: bottom)[
//  - In many IoT scenarios, data is not IID across all devices, but IID within spatial groups

 - Device *proximity* often shapes *data similarity*

 - Devices that are physically close tend to observe similar environments, leading to locally IID data

 - Devices belonging to different regions experience non-IID distributions

 - This phenomenon arises because *spatially co-located* devices share *similar context* and *interactions*
][
 #figure(image("images/subregions.svg", width: 85%))
]

== Goal

_A novel, *self-organizing* learning paradigm that *holistically* tackles scalability, efficiency and decentralization challenges -- *all at once*_

#focus-slide[
  #text(weight: "bold")[A new approach: Sparse Proximity-based Self-Federated Learning (*SParSeFuL*)]
]


== Sparse Proximity-based Self-Federated Learning (SParSeFuL)
 - #emph[Self-Organizing Federations]: eliminates the central server 
  - Devices *self-organize* into federations (clusters) based on data similarity
  - Each federation elects a *leader* for coordination
 - #emph[Holistic Solution]: tackles all key challenges -- non-IID data, resource constraints, and lack of infrastructure -- in *one framework*
 - #emph[Neural Network Compression]: integrates model compression (sparsification + quantization) into the learning process

 == SParSeFuL Learning Process
 #figure(image("images/algorithm-overview.svg", width: 100%))

 == How to Self-Org? Macroprogramming for Collective Systems

#components.side-by-side(columns: (1fr, 1fr))[
  === Core Idea

  A *single program* #math.text("P") describes the _collective_ *self-org* behavior of the system.

  - #emph[Macroprogramming] abstractions
    - _Spatial_ and _temporal_ operators
  - #emph[Proximity-based] interactions
  - Resilient #emph[coordination] mechanisms
][
  #figure((image("images/scr-result.png", width:100%)))
]

#v(1.5em)

#align(center)[
  Shift from a #underline[device-centric] to a *collective-centric* view of the system.

  #underline[Aggregate Computing] #cite(label("DBLP:journals/computer/BealPV15")) as a way to program such systems.
]

== Theoretical Foundations
=== Self-stabilization
#quote[The system is able to recover from any transient fault, without external intervention] #cite(label("DBLP:conf/coordination/AudritoBDV18"))
=== Eventual consistency
#quote[The system self-stabilizes to a predictable limit state as device density and speed increase #cite(label("7774387"))]
=== Space-time Universality
#quote[The system is able to compute any computable function, given enough time and space]

== Self-organizing Computational Model

#emph[Behaviour]: execution with #underline[rounds] \
#emph[Interaction]: *neighbours* #underline[messages exchange] \
#emph[Alignment]: each device execution is *aligned* with the others 

#line(length: 100%, stroke: 0.05em + rgb("#23373b"))

#only(1)[
  1. Receiving *messages* from neighbours
  #figure(image("images/ac-messages-perception.svg", width: 74%))
]
#only(2)[
  2. Computation of the *macro-program* against the received messages
  #figure(image("images/ac-computation.svg", width: 74%))
]
#only(3)[
  3. Sending to neighbours the *computed* messages
  #figure(image("images/ac-messages-propagation.svg", width: 74%))
]

// #only(4)[
//   4. Sleep until next *round*...
//   #figure(image("images/ac.svg", width: 74%))
// ]

== Loss-based similarity

#only(1)[
  #figure(image("images/loss-dissimilarity.svg", width: 74%))
]

#only(2)[
  #figure(image("images/loss-dissimilarity2.svg", width: 74%))
]

== SParSeFuL Learning Process Over the Time

#components.side-by-side(columns: (1fr, 1fr, 1fr))[
  #figure(image("images/fed1.svg", height: 60%))
  Initially, federations are #emph[unstable and fragmented]
][
  #figure(image("images/fed2.svg", height: 60%))
  Federations #emph[start aligning] with true data regions
][
  #figure(image("/images/fed3.svg", height: 60%))
  Federations #emph[match the underlying distributions]
]

// == Efficiency through Model Compression
// - #emph[Sparse Models]: Devices *prune a fraction of weights* to create smaller models, reducing bandwidth and energy use

// - #emph[Compressed Similarity Checks]: These lightweight models are *exchanged during similarity checks*, cutting computation and communication costs

// - #emph[Compressed Training]: Models remain sparse (and optionally quantized) during learning, enabling *faster training and inference* with minimal accuracy loss

// - #emph[Quantization]: Using 8-bit weights shrinks model size to ~25% of the original, *improving communication efficiency* with little impact on performance.

#focus-slide[
  #text(weight: "bold")[Preliminary Results]
]

== Preliminary Results (1)
#components.side-by-side(columns: (1fr, 1fr))[
  
- #emph[Pruning 30%]: Inference time reduced by ~67% with no accuracy loss

- #emph[High Sparsity]: Up to 70% pruning keeps accuracy stable

- #emph[Quantization]: 8-bit weights cut model size by ~75%, saving memory and bandwidth with minimal accuracy impact
][
  #figure(image("images/metrics.svg", height: 90%))
]

== Preliminary Results (2)
#figure(image("images/area-count.svg", height: 100%))

#focus-slide[
  #text(weight: "bold")[Conclusions]
]

== Research Roadmap
#figure(image("images/roadmap.svg", height: 60%))

== Opportunities & Challenges

- #emph[Green AI at Scale]: Enables federated learning with thousands of IoT devices while cutting energy and bandwidth, supporting global sustainability goals

- #emph[Better Personalization]: Self-federation creates models tailored to local data, improving accuracy and resilience without a central server

- #emph[Sparse Aggregation]: Merging differently pruned models is challenging; new methods are needed to preserve accuracy

- #emph[Assessing Compression in Practice]: Many techniques are still experimental; we must rigorously compare libraries to measure real gains in battery, latency, and communication

- #emph[Standardization]: The field lacks mature tools for evaluation, building better benchmarks is essential

== Conclusions
- #emph[SParSeFuL] introduces a new framework to reduce energy consumptions , bandwidth, and latency while keeping high accuracy, combining *federated learning* with *models compression* and *self-organizing programming paradigms*
- #emph[Aligned with Society 5.0]: By removing central servers and minimizing communication, it supports human-centered, sustainable smart societies
- #emph[Promising Results]: Early experiments show strong gains in efficiency with little accuracy loss