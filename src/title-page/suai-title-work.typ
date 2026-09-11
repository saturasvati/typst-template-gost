#let suai-title(
  department: "",
  lecturer: "",
  lecturer-regalia: "",
  sub-title: "",
  work-number: "",
  main-title: "",
  subject: "",
  student: "",
  student-group: "",
  date: datetime.today().year(),
) = [
  #set align(center)
  #set page(
    paper: "a4",
    margin: (
      top: 2cm,
      bottom: 2cm,
      left: 3cm,
      right: 1.5cm,
    ),
    numbering: none,
  )

  #set par(
    justify: false,
    first-line-indent: (amount: 0mm, all: false),
  )

  #set line(
    stroke: 0.5pt,
  )

  #set text(
    font: "Times New Roman",
    size: 14pt,
  )

  #align(center, {
    text(size: 12pt, [МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ])
    linebreak()
    text(size: 11.5pt, [федеральное государственное автономное образовательное учреждение высшего образования])
    linebreak()
    text(size: 14pt, [«САНКТ-ПЕТЕРБУРГСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ АЭРОКОСМИЧЕСКОГО ПРИБОРОСТРОЕНИЯ»])
  })

  #line(length: 100%, stroke: 1pt)

  #v(2em)

  КАФЕДРА №#department

  #v(2em)

  #align(left, [
    ОТЧЕТ ЗАЩИЩЕН С ОЦЕНКОЙ
    #h(2pt)
    #box(width: 1fr, line(length: 50%))
  ])

  #v(1em)

  #align(left, [ПРЕПОДАВАТЕЛЬ])

  #v(1.5em)

  #grid(
    align: center + bottom,
    columns: (1fr, 1fr, 1fr),
    rows: (auto, auto),
    gutter: 1em,
    {
      lecturer-regalia
      line(length: 100%)
    },
    { line(length: 100%) },
    {
      lecturer
      line(length: 100%)
    },

    {
      v(-0.5em)
      text([должность, уч.степень], size: 9pt)
    },
    {
      v(-0.5em)
      text([подпись, дата], size: 9pt)
    },
    {
      v(-0.5em)
      text([инициалы, фамилия], size: 9pt)
    },
  )

  #v(2em)

  #text([#sub-title], weight: "bold")

  #v(2em)

  #main-title

  #v(3em)

  по курсу: #subject

  #v(3em)

  #grid(
    align: (center + bottom),
    columns: (1fr, 1fr, 1fr, 1fr),
    rows: (auto, auto),
    gutter: 1em,

    [СТУДЕНТ ГР. №],
    {
      student-group
      line(length: 100%)
    },
    {
      line(length: 100%)
    },
    {
      student
      line(length: 100%)
    },

    [],
    {
      v(-0.5em)
      text([номер группы], size: 9pt)
    },
    {
      v(-0.5em)
      text([подпись, дата], size: 9pt)
    },
    {
      v(-0.5em)
      text([инициалы, фамилия], size: 9pt)
    },
  )

  #v(1fr)

  Санкт-Петербург

  #date
]
