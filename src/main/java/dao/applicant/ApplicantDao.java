package dao.applicant;

import dto.ApplicantDto;
import dto.otherDto.RequestInfoDto;

public interface ApplicantDao {

	void addApplicant(ApplicantDto appDto);

	ApplicantDto select(Integer hNo);

}
