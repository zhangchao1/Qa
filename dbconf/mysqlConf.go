package dbconf

func GetMysqlConfig() (data map[string]map[string]map[string]interface{}) {
	mysqlConf := map[string]map[string]map[string]interface{}{
		"dev": {
			"db1": {
				"user":     "root",
				"password": "root",
				"host":     "127.0.0.2",
				"port":     3306,
				"dbname":   "Qa",
			},
		},
		"test": {
			"db1": {
				"user":     "root11",
				"password": "root11",
				"host":     "127.0.0.1",
				"port":     3306,
				"dbname":   "bigbang123",
			},
			"db2": {
				"user":     "root123",
				"password": "root456",
				"host":     "127.0.0.2",
				"port":     3306,
				"dbname":   "bigbang123",
			},
		},
	}
	return mysqlConf
}
