package com.contact.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "medical")
@Table(name = "medical")
public class Medical {

		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
	  	@Column(nullable = false, unique = true, length = 45)
	    private String orgname;
	     
	    @Column(nullable = false, length = 64)
	    private String phnnum;
	     
	    @Column(name = "address", nullable = false, length = 20)
	    private String address;
	     
	    @Column(name = "city", nullable = false, length = 20)
	    private String city;
	    
	    @Column(name = "orgtype", nullable = false, length = 20)
	    private String orgtype;

	  

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getOrgname() {
			return orgname;
		}

		public void setOrgname(String orgname) {
			this.orgname = orgname;
		}

		public String getPhnnum() {
			return phnnum;
		}

		public void setPhnnum(String phnnum) {
			this.phnnum = phnnum;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getOrgtype() {
			return orgtype;
		}

		public void setOrgtype(String orgtype) {
			this.orgtype = orgtype;
		}
	    
	    
}
