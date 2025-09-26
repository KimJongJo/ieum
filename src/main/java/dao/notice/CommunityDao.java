package dao.notice;

import dto.CommunityDto;

public interface CommunityDao {
	void insert(CommunityDto community) throws Exception;
}
