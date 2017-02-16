package base

import (
	"encoding/base64"
)

const (
	base64Table = "123QRSTUabcdVWXYZHijKLAWDCABDstEFGuvwxyzGHIJklmnopqr234560178912"
)

type BaseEncodePass struct {
}

var coder = base64.NewEncoding(base64Table)

func (this *BaseEncodePass) Encode(src []byte) []byte {
	return []byte(coder.EncodeToString(src))
}

func (this *BaseEncodePass) Decode(src []byte) ([]byte, error) {
	return coder.DecodeString(string(src))
}
