package dbconf

func GetMongoConf() (data map[string]map[string]map[string]interface{}) {
	mongoConf := map[string]map[string]map[string]interface{}{
		"dev": {
			"test": {
				"host":   "127.0.0.1",
				"port":   27017,
				"dbname": "test",
			},
			"db2": {
				"host":   "127.0.0.1",
				"port":   27017,
				"dbname": "test",
			},
		},
		"test": {
			"db1": {
				"host":   "127.0.0.1",
				"port":   3306,
				"dbname": "bigbang123",
			},
			"db2": {
				"host":   "127.0.0.1",
				"port":   3306,
				"dbname": "bigbang123",
			},
		},
	}
	return mongoConf
}
