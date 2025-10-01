package service.applicant;

import dao.applicant.ApplicantDao;
import dao.applicant.ApplicantDaoImpl;
import dao.file.FileDao;
import dao.file.FileDaoImpl;
import dao.hospital.HospitalDao;
import dao.hospital.HospitalDaoImpl;
import dto.ApplicantDto;
import dto.FileDto;
import dto.HospitalDto;
import dto.otherDto.RequestInfoDto;

public class ApplicantServiceImpl implements ApplicantService {

	ApplicantDao appDao;
	HospitalDao hosDao;
	FileDao fileDao;
	
	public ApplicantServiceImpl() {
		appDao = new ApplicantDaoImpl();
		hosDao = new HospitalDaoImpl();
		fileDao = new FileDaoImpl();
	}
	
	@Override
	public RequestInfoDto getRequestInfo(Integer hNo) throws Exception {
		
		HospitalDto hosDto = hosDao.select(hNo);
		ApplicantDto appDto = appDao.select(hNo);
		FileDto fileDto = fileDao.selectFileByFileNo(hosDto.getHosReFileNo());
		String filePath = "img/hosRe/" + fileDto.getFileName();
		return  new RequestInfoDto(appDto.getApplicantNo(),  hNo, hosDto.gethNm(), appDto.getApplicantName(),
				appDto.getApplicantTel(), appDto.getApplicantEmail(), hosDto.gethAddress(), hosDto.getHosReNo(), filePath);
	}

}
