# Étude de la relation entre le revenu, le genre et le niveau d’éducation en France

## Objectif du projet

Ce projet vise à analyser les relations entre **le revenu mensuel**, **le genre** et **le niveau d'études** au sein d’un échantillon représentatif de la population française (n = 6400 individus).  
L’étude repose sur des outils statistiques classiques en R afin de déterminer :
- Si le genre influence le salaire
- Si le niveau d’éducation influence le salaire
- Si l’accès à l’éducation dépend du genre

---

## Structure du projet

revenu-genre-education-R/
│
├── Revenu_Analyse.Rproj # Projet RStudio
├── data/
│ └── population_france.csv # Données de l'échantillon (genre, revenu, éducation)
├── scripts/
│ ├── 01_description.R # Analyse descriptive des variables
│ ├── 02_genre_vs_revenu.R # Étude du lien entre genre et salaire
│ ├── 03_education_vs_revenu.R # Étude du lien entre niveau d'études et salaire
│ └── 04_genre_vs_education.R # Analyse croisée genre / éducation
├── figures/ # Graphiques générés (boxplots, histogrammes...)
└── README.md # Ce fichier

---

## Plan du projet

1. **Introduction**  
2. I – Relation entre le genre et les revenus  
3. II – Relation entre le niveau d’études et les revenus  
4. III – Relation entre le genre et le niveau d’études  
5. **Conclusion**  
6. **Annexe** – Liste des tests statistiques utilisés

---

## Méthodologie

### Analyse descriptive
- Répartition hommes/femmes dans l’échantillon
- Distribution statistique des salaires
- Répartition des niveaux d’études

### Tests statistiques utilisés
| Objectif                            | Test utilisé                        |
|-------------------------------------|-------------------------------------|
| Indépendance entre 2 variables      | Khi²                                |
| Intensité de dépendance             | V de Cramer                         |
| Égalité de proportions              | Test d’égalité de proportion        |
| Comparaison de moyennes             | Test de Student                     |
| Comparaison de médianes (2 groupes) | Test de Wilcoxon                    |
| Comparaison de médianes (≥3 groupes)| Test de Kruskal-Wallis             |

---

## Résultats principaux

### Partie I – Genre et revenus
- Les **femmes ont un salaire moyen et médian supérieur** à celui des hommes dans l’échantillon
- Les tests de Student et Wilcoxon valident l’existence d’une différence statistiquement significative

### Partie II – Niveau d’études et revenus
- Plus le **niveau d’éducation augmente, plus le salaire moyen est élevé**
- Les intervalles de confiance montrent des écarts clairs entre les niveaux
- Les tests de comparaison (Student, Kruskal-Wallis) valident cette relation

### Partie III – Genre et accès à l’éducation
- Globalement, **égalité des chances d’accès à l’éducation** entre hommes et femmes
- Légère surreprésentation féminine au niveau **Bac**
- Les tests du Khi² et de V-Cramer montrent **très faible dépendance**

---

## Outils & langages utilisés

- **R**
- Packages : `tidyverse`, `ggplot2`, `dplyr`, `stats`, `rstatix`

---

## Auteur

Projet réalisé par **Abderrahmane Boufares** et **Mehdi Ibrahim Assifar**  

boufares11@gmail.com

---

## Conclusion

L’étude statistique démontre une **corrélation positive entre l’éducation et les revenus**, une **quasi égalité d’accès à l’éducation entre les genres**, et une observation inattendue : **les femmes ont un revenu moyen légèrement supérieur à celui des hommes** dans cet échantillon. Ces constats viennent nourrir les réflexions sur l’égalité salariale et les dynamiques éducatives en France.
