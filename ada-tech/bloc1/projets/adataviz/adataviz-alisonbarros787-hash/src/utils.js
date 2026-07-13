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
