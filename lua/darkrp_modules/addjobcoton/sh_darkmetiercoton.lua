TEAM_ATICOTON = DarkRP.createJob("Cultivateur de Coton", {
            color = enzoFR60.Atila.Coton.Config.ColorJob,
            model = enzoFR60.Atila.Coton.Config.ModelJob,
            description = [[vous etes un nouveaux cultivateur de coton dans se monde]],
            weapons = enzoFR60.Atila.Coton.Config.InstCoton,
            command = 'cultivateurdecotonjob',
            max = enzoFR60.Atila.Coton.Config.MaxJob,
            salary = enzoFR60.Atila.Coton.Config.SalaireJob,
            admin = 0,
            category = "Citizens",
            vote = false,
            hasLicense = false
      })

		DarkRP.createEntity('Machine a Tisser', {
            ent = 'ati_machinecotontrait',
            model = 'models/codeandmodeling_atila_machinetisser/codeandmodeling_atila_machinetisser.mdl',
            price = enzoFR60.Atila.Coton.Config.PrixEntities,
            max = enzoFR60.Atila.Coton.Config.MaxEntities,
            cmd = 'buy_machine_a_coton',
            allowed = {TEAM_ATICOTON}
      })
