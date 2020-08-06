package com.dreamcapsule.project.domain;

public class EquipmentVO extends Criteria{

    /** 시퀀스 */
    private String seq;

    /** 장비명 */
    private String equipmentNm;

    /** 분류 */
    private String clsfc;

    /** 코드 */
    private String code;

    /** 일련번호 */
    private Integer serialNum;

    /** 등록일자 */
    private String regDate;

    /** 수정일자 */
    private String modDate;

    /** 삭제여부 */
    private String delYn;

    /** 장비 시퀀스 */
    private Integer equipSeq;

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getEquipmentNm() {
        return equipmentNm;
    }

    public void setEquipmentNm(String equipmentNm) {
        this.equipmentNm = equipmentNm;
    }

    public String getClsfc() {
        return clsfc;
    }

    public void setClsfc(String clsfc) {
        this.clsfc = clsfc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getSerialNum() {
        return serialNum;
    }

    public void setSerialNum(Integer serialNum) {
        this.serialNum = serialNum;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getModDate() {
        return modDate;
    }

    public void setModDate(String modDate) {
        this.modDate = modDate;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public Integer getEquipSeq() {
        return equipSeq;
    }

    public void setEquipSeq(Integer equipSeq) {
        this.equipSeq = equipSeq;
    }
}
