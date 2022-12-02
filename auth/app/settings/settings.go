package settings

import (
	"auth/app/structs"
	"embed"
	"gopkg.in/yaml.v2"
	"log"
)

var Config *structs.EnvConfig

func Load(f embed.FS) (err error) {
	envPath := []string{
		"env/" + "local" + "/db.yaml",
	}

	for k := range envPath {
		configFile, err := f.ReadFile(envPath[k])
		if err != nil {
			log.Fatalf(err.Error())
		}

		if err = yaml.Unmarshal(configFile, &Config); err != nil {
			log.Fatalf(err.Error())
		}
	}

	return nil
}
