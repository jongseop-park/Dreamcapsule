package com.dreamcapsule.project.domain;

public class AuthorityVO {

    /** 아이디 */
    private String username;

    /** 권한 */
    private String authorityNm;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAuthorityNm() {
        return authorityNm;
    }

    public void setAuthorityNm(String authorityNm) {
        this.authorityNm = authorityNm;
    }
}
