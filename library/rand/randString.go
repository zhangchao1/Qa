package rand

import (
	"math/rand"
	"strconv"
	"time"
)

//rune 类型是用来专门使用utf-8类型的
var ConstantString = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
var Source = rand.NewSource(time.Now().UnixNano()) //返回1970年后的unix时间戳
const (
	letterIdxBits = 6
	letterIdxMask = 1<<letterIdxBits - 1
	letterIdxMax  = 63 / letterIdxBits
)

type RandString struct {
}

func (this *RandString) RandStringByConstant(randLen int) string {
	rand.Seed(int64(time.Now().Nanosecond()))
	temp := make([]rune, randLen)
	for i := range temp {
		temp[i] = ConstantString[rand.Intn(len(ConstantString))]
	}
	return string(temp)
}

func (this *RandString) RandStringBySource(randLen int) string {
	rand.Seed(int64(time.Now().Nanosecond()))
	temp := make([]rune, randLen)
	for i, cache, remain := randLen-1, Source.Int63(), letterIdxMax; i >= 0; {
		if remain == 0 {
			cache, remain = Source.Int63(), letterIdxMax
		}
		if idx := int(cache & letterIdxMask); idx < len(ConstantString) {
			temp[i] = ConstantString[idx]
			i--
		}
		cache >>= letterIdxBits
		remain--
	}

	return string(temp)
}

func (this *RandString) RandStringByNowTime(randLen int) string {
	rand.Seed(int64(time.Now().Nanosecond()))
	temp := make([]rune, randLen)
	tempString := strconv.FormatInt(Source.Int63(), 10)
	tempRandString := tempString + string(ConstantString)
	RandRune := []rune(tempRandString)
	for i := range temp {
		temp[i] = RandRune[rand.Intn(len(RandRune))]
	}
	return string(temp)
}
