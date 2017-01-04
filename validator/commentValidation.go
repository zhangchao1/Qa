package validator

type CommentValidation struct {
	Content   string `valid:"Required; MaxSize(255)"`
	Uid       int64  `valid:"Required"`
	Cid       int64  `valid:"Required"`
	TargetUid int64  `valid:"Required"`
}
