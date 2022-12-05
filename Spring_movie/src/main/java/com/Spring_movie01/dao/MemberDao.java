package com.Spring_movie01.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.Spring_movie01.dto.MemberDto;

public interface MemberDao {
	
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth}, 'YYYY-MM-DD'), #{memail}, #{maddress}, #{mprofile}, 0) ")
	int insertMember(MemberDto member);

	@Select("SELECT * FROM MEMBERS WHERE MID = #{inputId}")
	String getjoinSelect(String inputId);

	
	// @Param : 매개변수가 여러개 일때 매개변수 앞에 @Param("쿼리문에 사용할 이름")을 작성한다.

	@Select("SELECT * FROM MEMBERS WHERE MID = #{LoginMid} AND MPW = #{LoginMpw}")
	MemberDto selectMemberLogin(@Param("LoginMid") String loginMid, @Param("LoginMpw") String loginMpw);

	// @Param : 매개변수가 여러개 일때 매개변수가 어디로 사용 될지 명시를 해줄 때 사용하는 언어테이션
	
	
	
	@Select("SELECT MID, MPW, MNAME, TO_CHAR(MBIRTH, 'YYYY-MM-DD') AS MBIRTH, MEMAIL, MADDRESS, MPROFILE FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto selectMemberView(String loginId);
	
	@Select("SELECT * FROM MEMBERS WHERE MID = #{kakaoId}")
	MemberDto selectkakaoLogin(String kakaoId);

	
	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MEMAIL, MPROFILE, MSTATE)"
			+ "VALUES(#{mid}, '1234', #{mname}, #{memail}, #{mprofile}, 2)")
	int insertkakaoJoin(@Param("mid") String kakaoId, @Param("mname") String kakaonickname, @Param("memail") String kakaoEmail, @Param("mprofile") String kakaoprofileurl);
	

	
	
	

}
