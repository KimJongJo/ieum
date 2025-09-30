package service.hospital;

import java.util.List;

import dao.hospital.HospitalDao;
import dao.hospital.HospitalDaoImpl;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import util.PageInfo;

public class HospitalServiceImpl implements HospitalService {
	HospitalDao hosDao = new HospitalDaoImpl();

	@Override
	public List<HosSearchListDto> listByFilter(HosSearchDto hosSearch, PageInfo pageInfo) throws Exception {	
		Integer hosCnt = hosDao.selectListResCnt(hosSearch);
		pageInfo.setAllCnt(hosCnt);
		Integer allPage = (int)Math.ceil((double)hosCnt/8); 
		pageInfo.setAllPage(allPage);
		Integer offset = (pageInfo.getCurPage() - 1) * 8;
		hosSearch.setOffset(offset);
		hosSearch.setLimit(8);
		System.out.println(hosSearch);
		return hosDao.selectList(hosSearch);
	}


}
