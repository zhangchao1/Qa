package qa

import (
	"Qa/models/review"
	"Qa/models/user"
	"fmt"
)

type ReviewService struct {
}

const APPROVAL_INIT = 1
const APPROVAL_ING = 2
const APPROVAL_PASS = 3
const APPROVAL_REFUSE = 4
const APPROVAL_CANCEL = 5

const APPROVE_PERSON_INIT = 1
const APPROVE_PERSON_PASS = 2
const APPROVE_PERSON_REFUSE = 3

const APPROVE_NODE_INIT = 1
const APPROVE_NODE_PASS = 2
const APPROVE_NODE_REFUSE = 3

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
		endApprovalPerson = append(endApprovalPerson, reviewConfigInfo.EndUid)
		endApprovalPersonUid := GetReviewProcessUid(reviewConfigInfo.EndUid, reviewConfigInfo.EndProcess)
		for i := 0; i < len(endApprovalPersonUid); i++ {
			endApprovalPerson = append(endApprovalPerson, endApprovalPersonUid[i])
		}
	} else {
		if reviewConfigInfo.EndUid > 0 {
			endApprovalPerson = append(endApprovalPerson, reviewConfigInfo.EndUid)
		}
	}
	for i := 0; i < len(endApprovalPerson); i++ {
		firstApprovalPerson = append(firstApprovalPerson, endApprovalPerson[i])
	}
	reviestatusId, _ := addReviewStatus(uid, scene, detail, reviewId)
	errSaveReviewPerson := addReviewPerson(reviestatusId, firstApprovalPerson[0], scene, 1, "", uid)
	if errSaveReviewPerson == nil {
		var errSaveReviewNode error
		for i := 0; i < len(firstApprovalPerson); i++ {
			var additem review.ReviewNode
			additem.Level = i + 1
			additem.Type = scene
			additem.OperateUid = firstApprovalPerson[i]
			additem.ReviewStatusId = reviestatusId
			_, errSaveReviewNode = reviewnode.Add(additem)
			fmt.Println(errSaveReviewNode)
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

func addReviewPerson(reviestatusId int64, author int64, types string, level int, detail string, uid int64) error {
	var additem review.ReviewPerson
	additem.ReviewStatusId = reviestatusId
	additem.Type = types
	additem.Level = level
	additem.Uid = uid
	additem.Auditor = author
	additem.Detail = detail
	_, err := reviewperson.Add(additem)
	return err
}

func (this *ReviewService) Approve(reviestatusId int64, id int64, level int, types string, detail string, uid int64) error {
	errChangeReviewPersonStatus := reviewperson.UpdateStatusAndDetail(id, APPROVE_PERSON_PASS, detail)
	errChangeReviewNodeStatus := reviewnode.ChangeStatusByLevel(reviestatusId, level, types, APPROVE_NODE_PASS)
	var addLevel int
	if errChangeReviewPersonStatus == nil && errChangeReviewNodeStatus == nil {
		addLevel = level + 1
		reviewNodeInfo, hasReviewNode := reviewnode.GetReviewNodeByLevel(reviestatusId, addLevel, types)
		if hasReviewNode != nil {
			errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_PASS)
			return errUpdateStatus
		} else {
			errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_ING)
			if errUpdateStatus == nil {
				errAddReviewPerson := addReviewPerson(reviestatusId, reviewNodeInfo.OperateUid, types, addLevel, "", uid)
				return errAddReviewPerson
			} else {
				return errUpdateStatus
			}
		}
	} else {
		return errChangeReviewPersonStatus
	}
}

func (this *ReviewService) Reject(id int64, reviestatusId int64, detail string, level int, types string) error {
	errChangeReviewPersonStatus := reviewperson.UpdateStatusAndDetail(id, APPROVE_PERSON_REFUSE, detail)
	if errChangeReviewPersonStatus == nil {
		errChangeReviewNodeStatus := reviewnode.ChangeStatusByLevel(reviestatusId, level, types, APPROVE_NODE_REFUSE)
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

func (this *ReviewService) Cancel(reviestatusId int64, types string) error {
	errUpdateStatus := reviewstatus.ChangeStatus(reviestatusId, APPROVAL_CANCEL)
	if errUpdateStatus == nil {
		errDeleteReviewNode := reviewnode.Delete(reviestatusId, types)
		if errDeleteReviewNode == nil {
			errDeleteReviewPerson := reviewperson.Delete(reviestatusId, types)
			return errDeleteReviewPerson
		} else {
			return errDeleteReviewNode
		}
	} else {
		return errUpdateStatus
	}
}

func (this *ReviewService) Endorse(id int64, reviestatusId int64, endorseUid int64, orginAuditor int64, types string) error {
	errAddEndorseUid := reviewnode.AddEndorseUid(id, endorseUid)
	if errAddEndorseUid == nil {
		errUpdateAuditor := reviewperson.UpdateAuditor(reviestatusId, orginAuditor, endorseUid, types)
		return errUpdateAuditor
	} else {
		return errAddEndorseUid
	}
}
