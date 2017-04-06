package validator

type LeaveSaveValidation struct {
	Uid       int64  `valid:"Required"`
	Type      string `valid:"Required"`
	StartTime string `valid:"Required"`
	EndTime   string `valid:"Required"`
	Reason    string `valid:"Required"`
	LongTime  string `valid:"Required"`
}
