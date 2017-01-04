package qa

import (
	"Qa/models/comment"
)

type commentService struct {
}

func (this *commentService) AddComment(add comment.Comment) (int64, error) {
	var addComment comment.Comment
	var addItem comment.Comment
	addItem.Uid = add.Uid
	addItem.Cid = add.Cid
	addItem.TargetUid = add.TargetUid
	addItem.Content = add.Content
	addItem.Types = add.Types
	id, err := addComment.AddComment(addItem)
	return id, err
}

func (this *commentService) DeleteComment(id int64) error {
	var Comment comment.Comment
	err := Comment.DeleteComment(id)
	return err
}
