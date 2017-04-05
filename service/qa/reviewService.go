package qa

import (
	"Qa/models/review"
	"Qa/models/user"
)

type ReviewService struct {
}

const APPROVAL_INIT = 1
const APPROVAL_PASS = 2
const APPROVAL_REFUSE = 3
const APPROVAL_CANCEL = 4

var ProcessUid = make([]int64, 0)
var ProcessCount int
var reviewnode review.ReviewNode
var reviewstatus review.ReviewStatus
var reviewperson review.ReviewPerson
var reviewcofig review.ReviewConfig

func GetReviewProcessUid(uid int64, level int) []int64 {
	ProcessUid = make([]int64, 0)
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

func (this *ReviewService) Add(reviewId int64, uid int64, role int64, eid int64, types int, scene string, detail string) error {
	reviewConfigInfo, _ := reviewcofig.GetReviewProcess(role, types, scene, eid)
	var firstApprovalPerson []int64
	var endApprovalPerson []int64
	if reviewConfigInfo.Process > 0 {
		firstApprovalPerson = GetReviewProcessUid(uid, reviewConfigInfo.Process)
	}
	if reviewConfigInfo.EndProcess > 0 {
		endApprovalPerson = GetReviewProcessUid(reviewConfigInfo.EndUid, reviewConfigInfo.EndProcess)
	} else {
		endApprovalPerson = append(endApprovalPerson, reviewConfigInfo.EndUid)
	}
	for i := 0; i < len(endApprovalPerson); i++ {
		firstApprovalPerson = append(firstApprovalPerson, endApprovalPerson[i])
	}
	reviestatusId, _ := addReviewStatus(uid, scene, detail, reviewId)
	errSaveReviewPerson := addReviewPerson(reviestatusId, firstApprovalPerson[0], scene, 1, "")
	if errSaveReviewPerson == nil {
		var errSaveReviewNode error
		for i := 0; i < len(firstApprovalPerson); i++ {
			var additem review.ReviewNode
			additem.Level = i + 1
			additem.OperateUid = firstApprovalPerson[i]
			additem.ReviewStatusId = reviestatusId
			_, errSaveReviewNode = reviewnode.Add(additem)
			if errSaveReviewNode != nil {
				return errSaveReviewNode
			}
		}
		return errSaveReviewNode
	} else {
		return errSaveReviewPerson
	}
}

func addReviewStatus(uid int64, types string, detail string, reviewId int64) (int64, error) {
	var additem review.ReviewStatus
	additem.Type = types
	additem.Uid = uid
	additem.Detail = detail
	additem.ReviewId = reviewId
	id, err := reviewstatus.Add(additem)
	return id, err
}

func addReviewPerson(reviestatusId int64, author int64, types string, level int, detail string) error {
	var additem review.ReviewPerson
	additem.ReviewStatusId = reviestatusId
	additem.Type = types
	additem.Level = level
	additem.Auditor = author
	additem.Detail = detail
	_, err := reviewperson.Add(additem)
	return err
}

func (this *ReviewService) Approve(reviestatusId int64, id int64, level int, types string, detail string) error {
	errChangeReviewPersonStatus := reviewperson.UpdateStatusAndDetail(id, APPROVAL_PASS, detail)
	errChangeReviewNodeStatus := reviewnode.ChangeStatusByLevel(reviestatusId, level, APPROVAL_PASS)
	var addLevel int
	if errChangeReviewPersonStatus == nil && errChangeReviewNodeStatus == nil {
		addLevel = level + 1
		reviewNodeInfo, hasReviewNode := reviewnode.GetReviewNodeByLevel(reviestatusId, addLevel)
		if hasReviewNode != nil {
			errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_PASS)
			return errUpdateStatus
		} else {
			errAddReviewPerson := addReviewPerson(reviestatusId, reviewNodeInfo.OperateUid, types, addLevel, "")
			return errAddReviewPerson
		}
	} else {
		return errChangeReviewPersonStatus
	}
}

func (this *ReviewService) Reject(id int64, reviestatusId int64, detail string, level int) error {
	errChangeReviewPersonStatus := reviewperson.UpdateStatusAndDetail(reviestatusId, APPROVAL_REFUSE, detail)
	if errChangeReviewPersonStatus == nil {
		errChangeReviewNodeStatus := reviewnode.ChangeStatusByLevel(reviestatusId, level, APPROVAL_REFUSE)
		if errChangeReviewNodeStatus == nil {
			errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_REFUSE)
			return errUpdateStatus
		} else {
			return errChangeReviewNodeStatus
		}
	} else {
		return errChangeReviewPersonStatus
	}
}

func (this *ReviewService) Cancel(reviestatusId int64) error {
	errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_CANCEL)
	if errUpdateStatus == nil {
		errDeleteReviewNode := reviewnode.Delete(reviestatusId)
		if errDeleteReviewNode == nil {
			errDeleteReviewPerson := reviewperson.Delete(reviestatusId)
			return errDeleteReviewPerson
		} else {
			return errDeleteReviewNode
		}
	} else {
		return errUpdateStatus
	}
}

func (this *ReviewService) Endorse(id int64, reviestatusId int64, endorseUid int64, orginAuditor int64) error {
	errAddEndorseUid := reviewnode.AddEndorseUid(id, endorseUid)
	if errAddEndorseUid == nil {
		errUpdateAuditor := reviewperson.UpdateAuditor(reviestatusId, orginAuditor, endorseUid)
		return errUpdateAuditor
	} else {
		return errAddEndorseUid
	}
}
