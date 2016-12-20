package dbconf

func GetMemcachedConf() (data map[string]map[string]map[string]interface{}) {
	memcachedConf := map[string]map[string]map[string]interface{}{
		"dev": {
			"cache": {
				"host": "127.0.0.1",
				"port": 11211,
			},
		},
		"test": {
			"cache": {
				"host": "127.0.0.1",
				"port": 11211,
			},
		},
	}
	return memcachedConf
}
