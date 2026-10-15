#import "title.typ": *

#let gost-style(
  doc,
  font-size: 14pt,
) = {
  // СТРАНИЦЫ

  set page(
    paper: "a4",
    margin: (
      top: 20mm,
      bottom: 20mm,
      left: 30mm,
      right: 15mm,
    ),
    numbering: "1",
  )

  // СОДЕРЖАНИЕ

  set outline(title: [СОДЕРЖАНИЕ])

  // ТЕКСТ

  set text(
    font: "Times New Roman",
    size: font-size,
    lang: "ru",
  )

  set par(
    justify: true,
    leading: 1em,
    spacing: 1em,
    first-line-indent: (amount: 12.5mm, all: true),
  )

  // ЗАГОЛОВКИ

  set heading(numbering: "1.1")
  show heading: set text(size: font-size, hyphenate: false)
  show heading: set block(above: 2em, below: 1em)
  show heading: it => pad(left: 12.5mm, it)

  show heading.where(level: 1): it => {
    if it.body.text == upper(it.body.text) {
      pagebreak(weak: true)
      it.body
      v(1em)
    } else {
      pagebreak(weak: true)
      counter(heading).display("1.1")
      h(1em)
      it.body
      v(1em)
    }
  }
  show heading.where(level: 1): set par(justify: false)
  show heading.where(level: 1): set align(center)

  // ФОРМУЛЫ

  set math.equation(numbering: "(1)", supplement: none)

  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      link(it.target)[(#it)]
    } else {
      lower(it)
    }
  }

  // Вложения в целом

  show figure: set block(breakable: true)

  // ЛИСТИНГ

  show figure.where(kind: raw): set figure.caption(position: top, separator: " — ")
  show figure.caption.where(kind: raw): set align(left)
  show figure.where(kind: raw): it => {
    it.caption
    it.body
  }

  // ТАБЛИЦЫ

  show figure.where(kind: table): set figure.caption(position: top, separator: " — ")
  show figure.where(kind: table): set figure(supplement: "Таблица")
  show figure.caption.where(kind: table): set align(left)
  show figure.where(kind: table): it => {
    it.caption
    it.body
  }
  show table: set align(center)
  show table: set par(justify: false, leading: 0.5em)
  // show table: set text(size: font-size)

  // РИСУНКИ

  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ --- ])
  show figure.where(kind: image): set figure(supplement: "Рисунок")
  show image: set align(center)

  // ТЕРМИНЫ, ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ

  set terms(
    separator: [ --- ],
    hanging-indent: 0mm,
  )

  // СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ

  set bibliography(
    title: "СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ",
    style: "gost-r-705-2008-numeric",
  )

  // СПИСКИ

  set list(
    indent: 12.5mm,
    marker: "-",
  )

  set enum(
    indent: 12.5mm,
    numbering: "1)",
  )

  doc
}

#let gost-presentation(
  doc,
  font-size: 7.5mm,
) = {
  set page(paper: "presentation-4-3", numbering: "1", margin: 10mm)
  set text(size: font-size)
  set align(center + horizon)

  show heading: it => place(top + center, float: true, scope: "parent")[#it]

  set enum(numbering: "1)")

  doc
}
