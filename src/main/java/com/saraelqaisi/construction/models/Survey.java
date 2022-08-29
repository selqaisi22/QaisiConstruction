package com.saraelqaisi.construction.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="surveys")
public class Survey {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotNull(message="Please enter your project number")
	@Min(1)
	private Integer projectNum;
	
	@NotNull
	private String findUs;
	
	@NotNull
	private Boolean completedOnTime;
	
	@NotNull(message="Please enter your satifaction rating.")
	@Min(1)
	@Max(5)
	private Integer satisfied;
	
	@NotNull(message="Please leave us feedback")
	@Size(min=5, max=200, message="Feedback must be greater than 5 charecters long.")
	private String feedback;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	    
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt; 
	
	@ManyToOne(fetch= FetchType.LAZY)
	@JoinColumn(name="surveyor_id")
	private User surveyor;
	
	public Survey() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getProjectNum() {
		return projectNum;
	}

	public void setProjectNum(Integer projectNum) {
		this.projectNum = projectNum;
	}

	public String getFindUs() {
		return findUs;
	}

	public void setFindUs(String findUs) {
		this.findUs = findUs;
	}

	public Boolean getCompletedOnTime() {
		return completedOnTime;
	}

	public void setCompletedOnTime(Boolean completedOnTime) {
		this.completedOnTime = completedOnTime;
	}

	public Integer getSatisfied() {
		return satisfied;
	}

	public void setSatisfied(Integer satisfied) {
		this.satisfied = satisfied;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getSurveyor() {
		return surveyor;
	}

	public void setSurveyor(User surveyor) {
		this.surveyor = surveyor;
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
