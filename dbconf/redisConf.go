package dbconf

func GetRedisConf() (data map[string]map[string]map[string]interface{}) {
	redisConf := map[string]map[string]map[string]interface{}{
		"dev": {
			"admire": {
				"host":     "127.0.0.1",
				"port":     "6379",
				"password": "",
				"db":       1,
			},
			"article": {
				"host":     "127.0.0.1",
				"port":     "6379",
				"password": "",
				"db":       2,
			},
			"comment": {
				"host":     "127.0.0.1",
				"port":     "6379",
				"password": "",
				"db":       3,
			},
			"user": {
				"host":     "127.0.0.1",
				"port":     "6379",
				"password": "",
				"db":       4,
			},
		},
		"test": {
			"cache": {
				"host":     "127.0.0.1",
				"port":     "6396",
				"password": "",
				"db":       1,
			},
			"family": {
				"host":     "127.0.0.1",
				"port":     "6396",
				"password": "",
				"db":       2,
			},
		},
	}
	return redisConf
}
