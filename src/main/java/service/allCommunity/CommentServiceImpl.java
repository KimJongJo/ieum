package service.allCommunity;

import java.util.List;

import dao.allCommunity.CommentDao;
import dao.allCommunity.CommentDaoImpl;
import dao.allCommunity.CommunityDao;
import dao.allCommunity.CommunityDaoImpl;
import dto.CommentDto;

public class CommentServiceImpl implements CommentService{
	private CommentDao commentDao;
	
	public CommentServiceImpl() {
		commentDao = new CommentDaoImpl();
	}
	
	
	@Override
	public void insertComment(CommentDto commentDto) throws Exception {
		commentDao.insert(commentDto);
		// 2. 해당 게시글 댓글 수 조회
        int count = commentDao.countCommentsByCommuNo(commentDto.getCommuNo());

        // 3. community 테이블 commu_comment 갱신
        commentDao.updateCommentCount(commentDto.getCommuNo(), count);
	}


	@Override
	public List<CommentDto> getCommentsByCommuNo(Integer commuNo) throws Exception {
		return commentDao.selectCommentWithNick(commuNo);
	}


	@Override
	public CommentDto selectByNo(Integer commeNo) throws Exception {
		
		return commentDao.selectByNo(commeNo);
	}


	@Override
	public boolean reportComment(int commeNo) throws Exception {
		// 1️⃣ 신고 횟수 +1
        commentDao.increaseReportCount(commeNo);

        // 2️⃣ 현재 신고 횟수 조회
        int count = commentDao.getReportCount(commeNo);

        // 3️⃣ 5회 이상이면 자동 삭제
        if (count >= 5) {
            commentDao.deleteComment(commeNo);
            return true; // true = 삭제됨
        }

        return false; // false = 아직 삭제 안 됨
	}	
	
	
	@Override
    public int getCommentWriter(int commeNo) throws Exception {
        return commentDao.getCommentWriter(commeNo);
    }
	
	
}
