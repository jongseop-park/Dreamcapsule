package com.dreamcapsule.project.domain;

import java.util.List;

public class WorkplaceVO extends Criteria{

    /** 시퀀스 */
    private String seq;

    /** 근무지 */
    private String place;

    /** 주소 */
    private String address;

    /** 출근시간 */
    private String workingTime;

    /** 퇴근시간 */
    private String workTime;

    /** 장비명 */
    private String equipNm;

    /** 등록일자 */
    private String regDate;

    /** 수정일자 */
    private String modDate;

    /** 삭제여부 */
    private String delYn;

    /** 자식테이블(equipment_mng_tb) */
    private List<EquipmentVO> equipmentVO;

    /** 자식테이블(use_equipment_tb) */
    private UseEquipmentVO useEquipmentVO;

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWorkingTime() {
        return workingTime;
    }

    public void setWorkingTime(String workingTime) {
        this.workingTime = workingTime;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getEquipNm() {
        return equipNm;
    }

    public void setEquipNm(String equipNm) {
        this.equipNm = equipNm;
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

    public List<EquipmentVO> getEquipmentVO() {
        return equipmentVO;
    }

    public void setEquipmentVO(List<EquipmentVO> equipmentVO) {
        this.equipmentVO = equipmentVO;
    }

    public UseEquipmentVO getUseEquipmentVO() {
        return useEquipmentVO;
    }

    public void setUseEquipmentVO(UseEquipmentVO useEquipmentVO) {
        this.useEquipmentVO = useEquipmentVO;
    }
}
