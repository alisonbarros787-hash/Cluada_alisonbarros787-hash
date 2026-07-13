


// Fonction qui génère le HTML d'une carte à partir d'un objet arbre
const creerCarteHTML = (arbre) => {
  return `
    <article class="container">
      <h3 class="nom-latin">${arbre.nom_latin}</h3>
      <h3 class="nom-vernaculaire">${arbre.nom_vernaculaire}</h3>
      <div class="separator"></div>
      <dl>
        <p>Site de plantation</p>
        <p>${arbre.site_de_plantation}</p>
        <div class="separator"></div>
        <p>Année de plantation</p>
        <p>${arbre.annee_de_plantation}</p>
        <div class="separator"></div>
        <p>Quartier</p>
        <p>${arbre.quartier}</p>
      </dl>
    </article>
  `
}

// On garde les arbres en mémoire pour pouvoir les filtrer sans refaire de fetch
let tousLesArbres = []

// Fonction pour afficher une liste d'arbres donnée (filtrée ou non)
export const afficherListe = (arbres) => {
  const conteneur = document.querySelector(".cards-list")
  conteneur.innerHTML = arbres.map(creerCarteHTML).join("")
}

export const afficherArbres = async () => {
  try {
    const reponse = await fetch("https://data.angers.fr/api/explore/v2.1/catalog/datasets/arbre-signal-angers/records?limit=10")
    const donnees = await reponse.json()
    tousLesArbres = donnees.results // on stocke les données globalement
    afficherListe(tousLesArbres)
  } catch (erreur) {
    console.error("Erreur lors de la récupération des données :", erreur)
  }
}

afficherArbres()

// --- FILTRE PAR QUARTIER ---
export const filtrerParQuartier = (quartier) => {
  const resultats = tousLesArbres.filter(arbre => 
    arbre.quartier && arbre.quartier.toLowerCase().includes(quartier.toLowerCase())
  )
  afficherListe(resultats)
}

// Exemple d'utilisation avec un input de recherche
document.querySelector("input").addEventListener("input", (e) => {
  filtrerParQuartier(e.target.value)
})


afficherArbres()

// FILTER PAR TYPE D'ARBRES 
export  const filtrerParType = (nom_vernaculaire) => {
  const resultats = tousLesArbres.filter(arbre => 
    arbre.nom_vernaculaire && arbre.nom_vernaculaire.toLowerCase().includes(nom_vernaculaire.toLowerCase())
  )
  afficherListe(resultats)
}

document.querySelector("input").addEventListener("input", (e) => {
  filtrerParType(e.target.value)
})

afficherArbres()

