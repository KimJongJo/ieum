package service.applicant;

import dto.otherDto.RequestInfoDto;

public interface ApplicantService {

	RequestInfoDto getRequestInfo(Integer hNo) throws Exception;

}
