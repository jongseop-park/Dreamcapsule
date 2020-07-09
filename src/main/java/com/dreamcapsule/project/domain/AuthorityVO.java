package com.dreamcapsule.project.domain;

public class AuthorityVO {

    /** 시퀀스 */
    private Integer seq;

    /** 아이디 */
    private String authId;

    /** 권한 */
    private String auth;

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getAuthId() {
        return authId;
    }

    public void setAuthId(String authId) {
        this.authId = authId;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }
}
