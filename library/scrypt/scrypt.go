package scrypt

import (
	"crypto/subtle"
	"encoding/hex"
	"fmt"
	"golang.org/x/crypto/scrypt"
)

type Scrypt struct {
}

func (this *Scrypt) StringHash(source string, salt string, hashlen int) string {
	hashByte, err := scrypt.Key([]byte(source), []byte(salt), 16384, 8, 1, hashlen)
	if err != nil {
		fmt.Println("加密系统错误")
	}
	return hex.EncodeToString(hashByte)
}

func (this *Scrypt) CompareHash(targetHash []byte, inputHash []byte) bool {

	if subtle.ConstantTimeCompare(targetHash, inputHash) == 1 {
		return true
	}
	return false
}
