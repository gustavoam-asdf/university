curl --location --request POST 'https://data.mongodb-api.com/app/data-wptar/endpoint/data/v1/action/findOne' --header 'Content-Type: application/json' --header 'Access-Control-Request-Headers: *' --header 'api-key: CIfVKWCAuBHATZ5tFPdHUWJsN2gLMM8vFlkkyFLe2frVyFXxLgUAjmNkt4DstNJZ' --data-raw '{ "collection":"areas", "database":"logistica_unheval", "dataSource":"unheval", "projection": {"_id": 1} }'