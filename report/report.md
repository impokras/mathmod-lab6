---
## Front matter
title: "Лабораторная работа № 6"
subtitle: "Задача об эпидемии"
author: "Покрас Илья Михайлович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: false
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---


# Цель работы

Целью данной работы является построение модели эпидемии.

# Задание

Построить графики изменения числа особей в каждой из трех групп S, I, R. Рассмотреть,
как будет протекать эпидемия в случае:

1. $I(0) \leq I*$
2. $I(0) > I*$

# Теоретическое введение

Рассмотрим простейшую модель эпидемии. Предположим, что некая
популяция, состоящая из N особей, (считаем, что популяция изолирована)
подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через S(t). Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их I(t). А третья группа, обозначающаяся через R(t) – это здоровые особи с иммунитетом к болезни.

## Код на Julia:

Подключим библиотеки для дальнейшей дальнейшей работы. Далее
создадим переменные количества восприимчивых, инфицированных особей и особей с иммунитетом. Также опишем коэффициенты заболеваемости выздоровления. (@fig:001).

![Переменные и библиотеки](./image/jlcode-init.png){#fig:001}


Создадим с помощью Differential Equations системы (@fig:002).

![ОДУ](./image/jlcode-ode.png){#fig:002}

С помощью solve получим решения ОДУ и сохраним данные решений в отдельные вектора(@fig:004).(@fig:003).

![решение ОДУ](./image/jlcode-solve.png){#fig:003}

Визуализируем решение с помощью Plots(@fig:004).

![визуализация](./image/jlcode-plot.png){#fig:004}

Результат(Julia) (@fig:005 - @fig:006)

![Мат. модель первого случая](./image/jlmodel1.png){#fig:005}

![Мат. модель второго случая](./image/jlmodel2.png){#fig:006}

## Код на OpenModelica

Для начала создадим переменные количества восприимчивых, инфицированных особей и особей с иммунитетом, а также опишем коэффициенты заболеваемости выздоровления. Далее запишем ОДУ (@fig:007 - @fig:008).


![Код OME - первый случай](./image/omecode1.png){#fig:007}

![Код OME - второй случай](./image/omecode2.png){#fig:008}


Результат(OpenModelica) (@fig:009 - @fig:010)

![Мат. модель первого случая](./image/omemodel1.png){#fig:005}

![Мат. модель второго случая](./image/omemodel2.png){#fig:006}

# Вывод

В результате проделанной работы был написан код на Julia и OpenModelica и были построены математические модели зависимости численности особей трех групп S, I, R для случаев, когда больные изолированы и когда они могут заражать особей группы S.

# Список Литературы

[1]  Задания к лабораторной работе №6 (по вариантам) - https://esystem.rudn.ru/pluginfile.php/1971665/mod_resource/content/2/Задание%20к%20лабораторной%20работе%20№%207%20%283%29.pdf

[2] Руководство по выполнению лабораторной работы №6 - https://esystem.rudn.ru/pluginfile.php/1971664/mod_resource/content/2/Лабораторная%20работа%20№%205.pdf