#import "@preview/physica:0.9.2": *
#let mainfont = "Harano Aji Mincho Medium"
#set text(font: mainfont, lang: "ja", size: 9pt)
#set page(numbering: "1")
#import "@preview/ctheorems:1.1.2": *
#show: thmrules
#let definition = thmbox("definition", "Definition", stroke: rgb("#444444") + 1pt)
#let theorem = thmbox("theorem", "Theorem", stroke: rgb("#444444") + 1pt)
#let lemma = thmbox("lemma", "Lemma", stroke: rgb("#444444") + 1pt)
#let proof = thmproof("proof", "Proof")
= 球面調和関数

== 極座標における計量テンソル

#definition([極座標変換])[
$forall d in NN, RR^d$における以下のような極座標$(r, theta_1, ..., theta_(d-1))$から直交座標$(x_1, ..., x_d)$への変換を定める。

$
cases(
0 < r,
0 <= theta_i < pi &"for" 1 <= i <= d-2,
0 <= theta_(d-1) < 2 pi
)
$

$
x_i =  cases(
  r cos phi &"if" i = 1 ,
  r product_(j=1)^(i-1) sin(theta_j) cos phi &"if" 2 <= i <= d-1 ,
  r product_(j=1)^(d-1) sin(theta_j) &"if" i = d )
$
]
#lemma()[
$
g_(i j) = diag(1, r^2, r^2 sin^2(theta_1), ..., r^2 product_(j=1)^(d-2) sin^2(theta_j))_(i j)
$
]
#proof()[
$
(d s)^2 = (d r)^2 + r^2 sum_(i=1)^(d-1) ((product_(j=1)^(i-1) sin^2(theta_j)) (d theta_i)^2)
$
]
@BibEntry2012Jun

== 極座標ラプラシアン
#theorem([Voss-Weylの定理 @BibEntry2024Feb])[
$
laplacian psi = 1/sqrt(|g|) diff_i (sqrt(|g|) g^(i j) diff_j psi)
$
]
#theorem([$laplacian$の極座標表示])[
$
laplacian f = 1 / r^(d-1) diff_r (r^(d-1) diff_r f) + sum_(i=1)^(d-1) 1 / ((r^2 product_(j=1)^(i-1) sin^2(theta_j)) sin^(d-i-1)(theta_i)) diff_(theta_i) (sin^(d-i-1)(theta_i) diff_(theta_i) f)
$
]
#proof[
$
g^(i j) = diag(1, 1/r^2, 1/(r^2 sin^2(theta_1)), ..., 1/(r^2 product_(j=1)^(d-2) sin^2(theta_j)))_(i j)
$
$
sqrt(|g|) = r^(d-1) product_(i=1)^(d-1) sin^(d-i-1)(theta_i)
$

各$i$ごとに分割する。
$
laplacian f = (laplacian)_r f + sum_(i=1)^(d-1) (laplacian)_(theta_i) f
$
まず、$g^(i j)$は$diff_i$と可換である。
$i$が$r$に対応するとき、$|g|$の$r$に依存する部分以外は$diff_i$と可換であるため、約分して、
$
(laplacian)_r f = 1 / r^(d-1) diff_r (r^(d-1) diff_r f)
$
$i$が$theta_j$に対応するとき、$|g|$の$theta_j$に依存する部分以外は$diff_i$と可換であるため、約分して、
$
(laplacian)_theta_j f = 1 / ((r^2 product_(k=1)^(j-1) sin^2(theta_k)) sin^(d-j-1)(theta_j)) diff_(theta_j) (sin^(d-j-1)(theta_j) diff_(theta_j) f)
$
]
@BibEntry2021Nov

== ラプラス方程式

$d$次元ラプラス方程式$laplacian f = 0$の変数分離可能な解$f(r,theta_1, ..., theta_(d-1))=R(r)Z(theta_1, ..., theta_(d-1))$を考える。

#bibliography("math.bib")

// 以下のような基底を考える。
// $
// cases(
// e_d = (0, ..., - sin phi, cos phi),
// e_(d-1) = (0, ..., - sin theta_(d-2), cos theta_(d-2) cos phi, cos theta_(d-2) sin phi),
// e_(d-2) = (0, ..., - sin theta_(d-3), cos theta_(d-3) cos theta_(d-2), cos theta_(d-3) cos theta_(d-2) cos phi, cos theta_(d-3) sin theta_(d-2) sin phi),
// e_n = (0, ..., - sin theta_(n - 1), cos theta_(n - 1) cos theta_(n-2), ..., cos theta_(n-1) cos theta_(n-2) ... cos theta_(d-2) cos phi, cos theta_(n-1) cos theta_(n-2) ... cos theta_(d-2) sin phi)
// )
// $
