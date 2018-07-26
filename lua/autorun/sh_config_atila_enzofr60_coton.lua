enzoFR60 = enzoFR60 or {}
enzoFR60.Atila = enzoFR60.Atila or {}
enzoFR60.Atila.Coton = enzoFR60.Atila.Coton or {}
enzoFR60.Atila.Coton.Config = enzoFR60.Atila.Coton.Config or {}

-------------------------------------------------------------------------------------------------------
--										Config													     --
-------------------------------------------------------------------------------------------------------

-- Metier qui ont acces au machine a tisser | true = le metier a acces, false = le metier n'y a pas acces
enzoFR60.Atila.Coton.Config.TeamAcces = { ["Cultivateur de Coton"] = true, ["Police"] = false }

enzoFR60.Atila.Coton.Config.DistanceAffichage = 500 -- Distance d'Affichage

enzoFR60.Atila.Coton.Config.SpawnPlantesCotonTime = 10 -- Temps avant la respawn de la plante

enzoFR60.Atila.Coton.Config.SpawnPlantesCoton = 3 -- Nombre de seau de coton qui spawn quand vous coupez les plantes

enzoFR60.Atila.Coton.Config.BP = 3 -- besoin pour fabriquer un pull
enzoFR60.Atila.Coton.Config.BJ = 3 -- besoin pour fabriquer un jean

enzoFR60.Atila.Coton.Config.TP = 3 -- Temps de fabrication pour un pull
enzoFR60.Atila.Coton.Config.TJ = 3 -- Temps de fabrication pour un jean

enzoFR60.Atila.Coton.Config.MinP = 120 -- Prix Minimum d'un Pull
enzoFR60.Atila.Coton.Config.MaxP = 320 -- Prix Maximum d'un Pull

enzoFR60.Atila.Coton.Config.MinJ = 120 -- Prix Minimum d'un Jean
enzoFR60.Atila.Coton.Config.MaxJ = 320 -- Prix Maximum d'un Jean

enzoFR60.Atila.Coton.Config.InstCoton = {"atila_brasjardinier"} -- Arme pour casser la plante

-- Job 

enzoFR60.Atila.Coton.Config.ModelJob = "models/player/eli.mdl" -- model du job

enzoFR60.Atila.Coton.Config.ColorJob = Color(255, 255, 255, 150) -- couleur du job

enzoFR60.Atila.Coton.Config.MaxJob = 2 -- joueurs max dans le job

enzoFR60.Atila.Coton.Config.SalaireJob = 500 -- salaire du job

-- Entities

enzoFR60.Atila.Coton.Config.MaxEntities = 2 -- nombre max de machine a tisser

enzoFR60.Atila.Coton.Config.PrixEntities = 500 -- prix de la machine a tisser 
