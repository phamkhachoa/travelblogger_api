package com.travelblogger.entities;
// Generated Jul 2, 2020 11:36:25 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TblProvince generated by hbm2java
 */
@Entity
@Table(name = "tbl_province", catalog = "travelblogger")
public class TblProvince implements java.io.Serializable {

	private int idProvince;
	private String nameProvince;
	private String imgProvince;
	private Integer activeFlag;
	private Set<TblPost> tblPosts = new HashSet<TblPost>(0);

	public TblProvince() {
	}

	public TblProvince(int idProvince, String nameProvince, String imgProvince) {
		this.idProvince = idProvince;
		this.nameProvince = nameProvince;
		this.imgProvince = imgProvince;
	}

	public TblProvince(int idProvince, String nameProvince, String imgProvince, Integer activeFlag,
			Set<TblPost> tblPosts) {
		this.idProvince = idProvince;
		this.nameProvince = nameProvince;
		this.imgProvince = imgProvince;
		this.activeFlag = activeFlag;
		this.tblPosts = tblPosts;
	}

	@Id

	@Column(name = "id_province", unique = true, nullable = false)
	public int getIdProvince() {
		return this.idProvince;
	}

	public void setIdProvince(int idProvince) {
		this.idProvince = idProvince;
	}

	@Column(name = "name_province", nullable = false, length = 50)
	public String getNameProvince() {
		return this.nameProvince;
	}

	public void setNameProvince(String nameProvince) {
		this.nameProvince = nameProvince;
	}

	@Column(name = "img_province", nullable = false, length = 65535)
	public String getImgProvince() {
		return this.imgProvince;
	}

	public void setImgProvince(String imgProvince) {
		this.imgProvince = imgProvince;
	}

	@Column(name = "active_flag")
	public Integer getActiveFlag() {
		return this.activeFlag;
	}

	public void setActiveFlag(Integer activeFlag) {
		this.activeFlag = activeFlag;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblProvince")
	public Set<TblPost> getTblPosts() {
		return this.tblPosts;
	}

	public void setTblPosts(Set<TblPost> tblPosts) {
		this.tblPosts = tblPosts;
	}

}
