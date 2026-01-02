package com.example.model;

public class HeroMasterDTO {

	private Integer id;
    private String nameKor;
    private String nameEng;     // 이미지 파일명과 동일
    private String ctpNameEng;  // (있으면) ctp 이미지 파일명

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getNameKor() { return nameKor; }
    public void setNameKor(String nameKor) { this.nameKor = nameKor; }

    public String getNameEng() { return nameEng; }
    public void setNameEng(String nameEng) { this.nameEng = nameEng; }

    public String getCtpNameEng() { return ctpNameEng; }
    public void setCtpNameEng(String ctpNameEng) { this.ctpNameEng = ctpNameEng; }
}
