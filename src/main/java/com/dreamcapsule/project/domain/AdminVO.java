package com.dreamcapsule.project.domain;

import java.time.LocalDateTime;
import java.util.List;

public class AdminVO {

    /** 관리자 아이디 */
    private String adminId;

    /** 관리자 패스워드 */
    private String adminPw;

    /** 관리자 이름 */
    private String adminNm;

    /** 관리자 이메일 */
    private String adminEmail;

    /** 관리자 연락처 */
    private String adminTel;

    /** 로그인 실패 횟수 */
    private Integer failCnt;

    /** 최종 접속 일시 */
    private LocalDateTime lastLoginDt;

    /** 등록일자 */
    private LocalDateTime regDt;

    /** 수정일자 */
    private LocalDateTime modDt;

    /** 권한 */
    private boolean enabled;

    /** 권한 테이블 */
    private List<AuthorityVO>  authList;

}
