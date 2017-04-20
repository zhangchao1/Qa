package validator

type GoodSDetailValidation struct {
	Name       string `valid:"Required"`
	Type       string `valid:"Required"`
	TotalCount int    `valid:"Required"`
	Unit       string `valid:"Required"`
}

type GoodSValidation struct {
	Application     string `valid:"Required"`
	ApplyTotalCount int    `valid:"Required"`
}
