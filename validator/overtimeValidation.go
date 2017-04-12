package validator

type OverTimeSaveValidation struct {
	Uid          int64  `valid:"Required"`
	EqualizeType string `valid:"Required"`
	IsOutside    string `valid:"Required"`
	StartTime    string `valid:"Required"`
	EndTime      string `valid:"Required"`
	LongTime     string `valid:"Required"`
	Reason       string `valid:"Required"`
}
