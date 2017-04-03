package qa

import (
	"Qa/models/review"
	"Qa/models/user"
)

type ReviewService struct {
}

var ProcessUid = make([]int64, 0)
var ProcessCount int
var reviewnode review.ReviewNode
var reviestatus review.ReviewStatus
var reviewperson review.ReviewPerson
var reviewcofig review.Reviewcofig

func GetReviewProcessUid(uid int64, level int) []int64 {
	ProcessCount = level
	GetHead(uid)
	return ProcessUid
}

func GetHead(uid int64) {
	var user user.User
	if ProcessCount > 0 {
		userDetail, _ := user.GetUserByUid(uid)
		ProcessUid = append(ProcessUid, userDetail.Head)
		ProcessCount = ProcessCount - 1
		GetHead(userDetail.Head)
	}
}
func addReviewByUid(uid int64, role int64, eid int64, types int, scene string) {

}

func addReviewStatus() {

}

func addReviewNode() {

}
