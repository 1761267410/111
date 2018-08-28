package net.dfrz.bean.po;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;

//@Entity(name = "f_userDetail")
public class User_DetailPO {
	private int id;// 编号
	private String tele;// 电话
	private String birdathy;// 出生年月
	private String sex;// 性别
	private String address;// 住址
	private UserPO userPO;// 一对一

	// @Id
	// @GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTele() {
		return tele;
	}

	public void setTele(String tele) {
		this.tele = tele;
	}

	public String getBirdathy() {
		return birdathy;
	}

	public void setBirdathy(String birdathy) {
		this.birdathy = birdathy;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	// @OneToOne(cascade={CascadeType.ALL})
	// @JoinTable(name="f_user_userDetail",joinColumns={@JoinColumn(name="uid")},inverseJoinColumns={@JoinColumn(name="detailid")})
	public UserPO getUserPO() {
		return userPO;
	}

	public void setUserPO(UserPO userPO) {
		this.userPO = userPO;
	}

}
